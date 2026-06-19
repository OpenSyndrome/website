"""Script to generate statistics from the definitions.json.

Heavy third-party imports (plotly, polars, numpy, pycountry, networkx) are kept
local to the functions that need them so the lightweight, stdlib-only chart data
files can always be regenerated even when those packages are not installed.
"""
import itertools
import sys
from pathlib import Path
from collections import Counter
import json

import networkx as nx
import numpy as np
import plotly.graph_objects as go
import plotly.express as px
import pycountry
import polars as pl


def write_chart_data(path, label, counter):
    """Write a Chart.js-friendly data file (labels + data) read by the
    `chart-data` Hugo shortcode, ordered from most to least frequent."""
    items = counter.most_common()
    payload = {
        "label": label,
        "labels": [name for name, _ in items],
        "data": [count for _, count in items],
    }
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(payload, indent=2, ensure_ascii=False) + "\n")
    print(f"Chart data written to {path}")
    return payload


def count_attribute(data, attribute):
    attributes_list = []
    for definition in data:
        if definition.get(attribute):
            attributes_list.append(definition[attribute])
    return Counter(attributes_list)


def extract_types(criteria_item, types=None):
    if types is None:
        types = []

    if "type" in criteria_item:
        types.append(criteria_item["type"])

    if "values" in criteria_item:
        for value in criteria_item["values"]:
            extract_types(value, types)

    return types


def process_criteria(data, key, fn):
    all_items = []
    for criteria in data.get(key, []):
        types = fn(criteria)
        all_items.extend(types)
    return all_items


# Location strings that are not a single country; they are excluded from the map.
REGIONS = {
    "Africa", "Americas", "North America", "South America", "Latin America",
    "Central America", "Europe", "Asia", "Oceania", "Pacific Islands",
    "Caribbean", "Middle East", "Global", "Worldwide",
}

# Names pycountry resolves neither by exact name nor by fuzzy search.
COUNTRY_ALIASES = {"Turkey": "TUR"}


def resolve_country(name):
    """Return the ISO alpha-3 code for a location, or None if it is a region or
    cannot be resolved. Tries exact match, a small alias table, then pycountry's
    fuzzy search."""
    if name in REGIONS:
        return None
    obj = pycountry.countries.get(name=name)
    if obj:
        return obj.alpha_3
    if name in COUNTRY_ALIASES:
        return COUNTRY_ALIASES[name]
    try:
        return pycountry.countries.search_fuzzy(name)[0].alpha_3
    except LookupError:
        return None


def generate_choropleth(location_counts):
    data = []
    regions = []
    unresolved = []
    for location, count in location_counts.items():
        iso = resolve_country(location)
        if iso:
            data.append({'country': location, 'iso_alpha': iso, 'count': count})
        elif location in REGIONS:
            regions.append((location, count))
        else:
            unresolved.append((location, count))

    on_map_defs = sum(item['count'] for item in data)
    total_defs = sum(location_counts.values())
    print(f"Map: {len(data)} countries plotted ({on_map_defs}/{total_defs} definitions).")
    if regions:
        regions.sort(key=lambda x: (-x[1], x[0]))
        joined = ", ".join(f"{name} ({count})" for name, count in regions)
        print(f"  {len(regions)} region-level location(s) excluded: {joined}")
    if unresolved:
        unresolved.sort(key=lambda x: (-x[1], x[0]))
        joined = ", ".join(f"{name} ({count})" for name, count in unresolved)
        print(f"  {len(unresolved)} location(s) UNRESOLVED (add to COUNTRY_ALIASES?): {joined}")

    df = pl.DataFrame(data)
    count = list(df["count"].unique())
    color_scale = [
        (r, c)
        for r, c in zip(
            np.repeat(np.linspace(0, 1, len(count) + 1), 2)[1:],
            np.repeat(px.colors.sequential.Tealgrn, 2),
        )
    ]

    fig = go.Figure(data=go.Choropleth(
        locations=df['iso_alpha'],
        z=df['count'],
        locationmode='ISO-3',
        coloraxis="coloraxis",
    ))
    fig.update_layout(
        geo=dict(
            showcountries=True,
            showframe=False,
            showcoastlines=False,
            projection_type='equirectangular',
            lataxis_range=[-59, 90],
            bgcolor='rgba(0,0,0,0)',
        ),
        margin=dict(l=0, r=0, t=30, b=30),
        paper_bgcolor='rgba(0,0,0,0)',
        coloraxis={
            "colorscale": color_scale,
            "colorbar": {
                "tickvals": list(df["count"].unique()),
                "title": {
                    "text": "count"
                },
                "lenmode": "pixels",
                "len": 100,
            }
        },
    )

    fig.write_image("assets/images/world_map.svg")
    return fig


def generate_threats_treemap(threat_counts):
    """Treemap of the public-health threats each definition targets."""
    items = sorted(threat_counts.items(), key=lambda x: (-x[1], x[0]))
    labels = [threat for threat, _ in items]
    values = [count for _, count in items]

    # Explicit per-tile colors (sampled from Tealgrn) instead of numeric values +
    # colorscale, so the implicit root can be made transparent — otherwise plotly
    # colours the root from the scale and renders a grey surround.
    vmax = max(values)
    colors = px.colors.sample_colorscale("Tealgrn", [v / vmax for v in values])

    fig = go.Figure(go.Treemap(
        labels=labels,
        parents=[""] * len(labels),
        values=values,
        marker=dict(colors=colors, line=dict(width=1, color="white")),
        tiling=dict(pad=0),
        root=dict(color="rgba(0,0,0,0)"),
        textinfo="label+value",
        hovertemplate="%{label}<br>%{value} definitions<extra></extra>",
    ))
    # template "none" + transparent backgrounds so the tiles fill edge to edge and
    # the surround follows the page's light/dark theme instead of plotly's grey.
    fig.update_layout(
        template="none",
        margin=dict(l=0, r=0, t=0, b=0),
        paper_bgcolor='rgba(0,0,0,0)',
        plot_bgcolor='rgba(0,0,0,0)',
    )

    fig.write_image("assets/images/threats_treemap.svg")
    print(
        f"Threats treemap written to assets/images/threats_treemap.svg "
        f"({len(labels)} public-health threats)."
    )
    return fig


def create_nodes_from_criteria(G, criteria, _nodes=None):
    if not _nodes:
        _nodes = []
    for item in criteria:
        if item["type"] == "criteria":
            return create_nodes_from_criteria(G, item["values"], _nodes)
        else:
            node = item.get("name") or item.get("description")
            _nodes.append(node)
            G.add_node(node, **item)
    return _nodes


def create_edges_from_criteria(G, definition_title, criteria):
    nodes = create_nodes_from_criteria(G, criteria)
    nodes.append(definition_title)
    G.add_node(definition_title, type="definition")
    connected_nodes = itertools.combinations(nodes, 2)
    G.add_edges_from(connected_nodes)
    return G


def generate_graph_of_criteria(definitions):
    G = nx.DiGraph()
    for definition in definitions:
        title = definition["title"].replace("Open Syndrome", "").strip()
        G = create_edges_from_criteria(G, title, definition.get("inclusion_criteria", []))
        G = create_edges_from_criteria(G, title, definition.get("exclusion_criteria", []))
    print(len(G.nodes()), len(G.edges()))
    return G


if __name__ == "__main__":
    jsons_dir = Path("data/definitions_v1.json")
    definitions = json.loads(jsons_dir.read_text())

    all_instructions_counts = []
    all_types = []
    for data in definitions:
        _all_types = process_criteria(data, "inclusion_criteria", extract_types)
        all_types.extend(_all_types)
        _all_types = process_criteria(data, "exclusion_criteria", extract_types)
        all_types.extend(_all_types)

    type_counts = Counter(all_types)
    total = sum(type_counts.values())
    print(f"Type counts (N={total}):")
    for type_name, count in type_counts.most_common():
        percentage = round(count / total * 100)
        print(f"  {type_name}: ({count}/{total}, {percentage}%)")

    write_chart_data(
        "data/charts/criteria_types.json",
        "# inclusion and exclusion criteria types",
        type_counts,
    )

    locations = {d["location"] for d in definitions if d.get("location")}
    summary = {"locations": len(locations), "definitions": len(definitions)}
    summary_path = Path("data/charts/summary.json")
    summary_path.write_text(json.dumps(summary, indent=2) + "\n")
    print(
        f"Summary written to {summary_path} "
        f"({summary['locations']} locations, {summary['definitions']} definitions)"
    )

    # The world map SVG is non-deterministic (plotly embeds random ids), so the
    # pre-push staleness check regenerates charts only with --charts-only.
    if "--charts-only" in sys.argv:
        print("Charts-only mode: skipping the world map.")
    else:
        try:
            location_counts = count_attribute(definitions, "location")
            generate_choropleth(location_counts)
            print("World map written to assets/images/world_map.svg")

            threat_counts = Counter()
            for definition in definitions:
                for threat in (definition.get("target_public_health_threats") or []):
                    threat_counts[threat.strip().lower()] += 1
            generate_threats_treemap(threat_counts)
        except ImportError as exc:
            print(
                f"Skipping images (missing dependency: {exc.name}). "
                "Install bin/requirements.txt to regenerate them."
            )

    #G = generate_graph_of_criteria(definitions)
    #nx.write_gml(G, "criteria_graph.gml")
