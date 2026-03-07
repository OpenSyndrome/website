"""Generate logical complexity charts from OSD definitions (data/definitions_v1.json).

Produces:
1. Distribution of maximum nesting depth across definitions.
2. Per-disease comparison of logical complexity for diseases with multiple definitions.
3. Distribution of logical operators (AND, OR, AT_LEAST); when not explicit, AND is used (including first level).

Requires kaleido (e.g. pip install kaleido) for SVG/PDF export. See bin/requirements.txt.
"""
from pathlib import Path

import json
import polars as pl
import plotly.express as px
import plotly.graph_objects as go


def plotly_colors_for_categories(n: int) -> list[str]:
    """Return n distinct colors from a qualitative palette (cycles if n exceeds palette size)."""
    palette = px.colors.qualitative.Set2
    return [palette[i % len(palette)] for i in range(n)]


def criterion_depth(criterion: dict) -> int:
    """Depth of a single criterion: 1 for leaves, 1 + max(children) for nodes with values."""
    values = criterion.get("values")
    if not values:
        return 1
    return 1 + max(criterion_depth(child) for child in values)


def definition_depth(definition: dict) -> int:
    """Maximum nesting depth over all top-level inclusion and exclusion criteria."""
    depths = []
    for key in ("inclusion_criteria", "exclusion_criteria"):
        for item in definition.get(key) or []:
            depths.append(criterion_depth(item))
    return max(depths) if depths else 0


def _collect_operators(criterion: dict, out: list[str]) -> None:
    """Append this criterion's operator (AND when not explicit) and recurse into values."""
    values = criterion.get("values")
    if not values:
        return
    op = criterion.get("logical_operator") or "AND"
    out.append(op.strip().upper() if isinstance(op, str) else "AND")
    for child in values:
        _collect_operators(child, out)


def definition_operators(definition: dict) -> list[str]:
    """List of logical operators used in this definition (AND when not explicit at any level)."""
    out: list[str] = []
    for key in ("inclusion_criteria", "exclusion_criteria"):
        for item in definition.get(key) or []:
            _collect_operators(item, out)
    return out


def disease_key(definition: dict) -> str:
    """Normalized disease key from target_public_health_threats (first threat, lowercased)."""
    threats = definition.get("target_public_health_threats") or []
    if not threats:
        return ""
    return str(threats[0]).strip().lower()


def short_title(title: str) -> str:
    """Remove 'Open Syndrome' prefix for display."""
    if not title:
        return title
    t = title.strip()
    if t.lower().startswith("open syndrome "):
        return t[14:].strip()
    return t


def load_definitions(path: Path) -> list[dict]:
    """Load definitions JSON; return list of definition dicts."""
    text = path.read_text()
    data = json.loads(text)
    if not isinstance(data, list):
        data = [data]
    return data


def build_df(definitions: list[dict]) -> pl.DataFrame:
    """Build Polars DataFrame with title, location, depth, disease_key."""
    rows = []
    for d in definitions:
        rows.append({
            "title": d.get("title") or "",
            "location": d.get("location") or "",
            "depth": definition_depth(d),
            "disease_key": disease_key(d),
        })
    return pl.DataFrame(rows)


def generate_distribution_chart(df: pl.DataFrame, out_dir: Path) -> go.Figure:
    """Bar chart: count of definitions by maximum nesting depth. Bin 4+ as '4+'."""
    # Bin depths: 1, 2, 3, 4+
    binned = df.with_columns(
        pl.when(pl.col("depth") >= 4).then(4).otherwise(pl.col("depth")).alias("d"),
    )
    counts = binned.group_by("d").agg(pl.len().alias("count")).sort("d")
    depth_bins = counts.with_columns(
        pl.when(pl.col("d") < 4).then(pl.col("d").cast(pl.Utf8)).otherwise(pl.lit("4+")).alias("depth_label"),
    ).select(pl.col("depth_label"), pl.col("count"))
    if depth_bins.height == 0:
        depth_bins = pl.DataFrame({"depth_label": ["1"], "count": [0]})
    fig = go.Figure(
        data=[
            go.Bar(
                x=depth_bins["depth_label"],
                y=depth_bins["count"],
                text=depth_bins["count"],
                textposition="outside",
            )
        ],
        layout=go.Layout(
            title="Distribution of logical complexity (maximum nesting depth)",
            xaxis_title="Maximum nesting depth",
            yaxis_title="Number of definitions",
            showlegend=False,
            margin=dict(t=50, b=50, l=50, r=50),
            paper_bgcolor="white",
            plot_bgcolor="white",
        ),
    )
    fig.write_image(str(out_dir / "logical_complexity_distribution.svg"))
    fig.write_image(str(out_dir / "logical_complexity_distribution.pdf"))
    return fig


def generate_by_disease_chart(df: pl.DataFrame, out_dir: Path) -> go.Figure | None:
    """Horizontal bar chart: depth by definition, grouped by target_public_health_threats (diseases with ≥2 definitions). One color per public health threat."""
    multi = (
        df.filter(pl.col("disease_key") != "")
        .group_by("disease_key")
        .agg(pl.len().alias("n"))
        .filter(pl.col("n") >= 2)
    )
    if multi.height == 0:
        return None
    subset = df.join(multi.select("disease_key"), on="disease_key", how="inner")
    # Sort by disease_key (target_public_health_threats group) then depth descending
    subset = subset.sort(["disease_key", "depth"], descending=[False, True])
    # One trace per public health threat so each gets a distinct color and legend entry
    unique_keys = subset["disease_key"].unique().to_list()
    palette = plotly_colors_for_categories(len(unique_keys))
    key_to_color = dict(zip(unique_keys, palette))
    traces = []
    for key in unique_keys:
        rows = subset.filter(pl.col("disease_key") == key)
        labels = [
            f"{short_title(row[0])} ({row[1]})"
            for row in rows.select("title", "location").iter_rows()
        ]
        traces.append(
            go.Bar(
                name=key,
                y=labels,
                x=rows["depth"],
                orientation="h",
                text=rows["depth"],
                textposition="outside",
                marker_color=key_to_color[key],
            )
        )
    fig = go.Figure(
        data=traces,
        layout=go.Layout(
            title="Logical complexity by definition (diseases with multiple definitions)",
            xaxis_title="Maximum nesting depth",
            yaxis_title="",
            barmode="group",
            showlegend=True,
            legend_title="Public health threat",
            margin=dict(l=200, t=50, b=50, r=80),
            height=400 + subset.height * 24,
            paper_bgcolor="white",
            plot_bgcolor="white",
        ),
    )
    fig.write_image(str(out_dir / "logical_complexity_by_disease.svg"))
    fig.write_image(str(out_dir / "logical_complexity_by_disease.pdf"))
    return fig


def generate_operator_distribution_chart(definitions: list[dict], out_dir: Path) -> go.Figure:
    """Bar chart: count of logical operators (AND, OR, AT_LEAST) across all definitions. Implicit operator is AND."""
    all_ops: list[str] = []
    for d in definitions:
        all_ops.extend(definition_operators(d))
    # Normalize to known set (AT_LEAST may appear as "AT_LEAST" in data)
    normalized = []
    for op in all_ops:
        if op in ("AND", "OR", "AT_LEAST"):
            normalized.append(op)
        else:
            normalized.append("AND")
    op_series = pl.Series("operator", normalized)
    counts_df = op_series.value_counts().sort("count", descending=True)
    # Ensure order AND, OR, AT_LEAST for display
    order = ["AND", "OR", "AT_LEAST"]
    op_col = counts_df["operator"]
    labels = [x for x in order if x in op_col.to_list()]
    data = [counts_df.filter(pl.col("operator") == x)[0, "count"] for x in labels]
    if not labels:
        labels, data = ["AND", "OR", "AT_LEAST"], [0, 0, 0]
    fig = go.Figure(
        data=[
            go.Bar(
                x=labels,
                y=data,
                text=data,
                textposition="outside",
            )
        ],
        layout=go.Layout(
            title="Distribution of logical operators in case definitions",
            xaxis_title="Logical operator",
            yaxis_title="Count",
            showlegend=False,
            margin=dict(t=50, b=50, l=50, r=50),
            paper_bgcolor="white",
            plot_bgcolor="white",
        ),
    )
    fig.write_image(str(out_dir / "logical_operators_distribution.svg"))
    fig.write_image(str(out_dir / "logical_operators_distribution.pdf"))
    return fig


def main() -> None:
    repo_root = Path(__file__).resolve().parent.parent
    data_path = repo_root / "data" / "definitions_v1.json"
    out_dir = repo_root / "assets" / "images"
    out_dir.mkdir(parents=True, exist_ok=True)

    definitions = load_definitions(data_path)
    df = build_df(definitions)

    generate_distribution_chart(df, out_dir)
    generate_by_disease_chart(df, out_dir)
    generate_operator_distribution_chart(definitions, out_dir)

    # Summary stats
    depth = df["depth"]
    print("Logical complexity summary")
    print(f"  Definitions: {len(df)}")
    print(f"  Depth — mean: {depth.mean():.2f}, median: {depth.median():.0f}")
    print(f"  Definitions with depth ≥ 4: {(depth >= 4).sum()}")


if __name__ == "__main__":
    main()
