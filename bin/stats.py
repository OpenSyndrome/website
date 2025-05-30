"""Script to generate statistics from the definitions.json."""
from pathlib import Path
from collections import Counter
import json
import plotly.express as px
import pycountry
import polars as pl


# knowledge graph of definitions - normalize terms and locations
jsons_dir = Path("data/definitions.json")
sample_data = json.loads(jsons_dir.read_text())


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


def generate_choropleth(location_counts):
    data = []
    for country, count in location_counts.items():
        try:
            country_obj = pycountry.countries.get(name=country)
            if country_obj:
                data.append({
                    'country': country,
                    'iso_alpha': country_obj.alpha_3,
                    'count': count
                })
        except:
            continue
    
    df = pl.DataFrame(data)
    fig = px.choropleth(
        df,
        locations='iso_alpha',
        color='count',
        hover_name='country',
        color_continuous_scale='Plasma',
        locationmode='ISO-3',
        color_discrete_sequence=px.colors.sequential.Plasma,
        color_discrete_map={i: px.colors.sequential.Plasma[i-1] for i in range(1, max(df['count']) + 1)}
    )
    
    fig.update_layout(
        geo=dict(
            showframe=False,
            showcoastlines=True,
            projection_type='equirectangular'
        ),
        margin=dict(l=0, r=0, t=30, b=0),
        coloraxis_colorbar=dict(
            tickmode='array',
            ticktext=[str(i) for i in range(1, max(df['count']) + 1)],
            tickvals=list(range(1, max(df['count']) + 1))
        )
    )
    
    fig.write_image("assets/images/world_map.svg")
    return fig


all_instructions_counts = []
all_types = []
for data in sample_data:
    _all_types = process_criteria(data, "inclusion_criteria", extract_types)
    all_types.extend(_all_types)
    _all_types = process_criteria(data, "exclusion_criteria", extract_types)
    all_types.extend(_all_types)


type_counts = Counter(all_types)
print("Type Counts (chart format)")
print(list(type_counts.keys()))
print(list(type_counts.values()))
print("Language:")
print(count_attribute(sample_data, "language"))
print("Location:")
print(count_attribute(sample_data, "location"))


location_counts = count_attribute(sample_data, "location")
fig = generate_choropleth(location_counts)
