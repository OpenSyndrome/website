"""Script to generate statistics from the definitions.json."""
import itertools
from pathlib import Path
from collections import Counter
import json

import networkx as nx
import plotly.graph_objects as go
import pycountry
import polars as pl


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
    fig = go.Figure(data=go.Choropleth(
        locations=df['iso_alpha'],
        z=df['count'],
        locationmode='ISO-3',
        colorscale='Emrld',
        # colorbar_title="Count",
    ))
    fig.update_layout(margin={"r": 0, "t": 0, "l": 0, "b": 0})
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
    )

    fig.write_image("assets/images/world_map.png")
    fig.write_image("assets/images/world_map.svg")
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
    jsons_dir = Path("data/definitions.json")
    definitions = json.loads(jsons_dir.read_text())

    all_instructions_counts = []
    all_types = []
    for data in definitions:
        _all_types = process_criteria(data, "inclusion_criteria", extract_types)
        all_types.extend(_all_types)
        _all_types = process_criteria(data, "exclusion_criteria", extract_types)
        all_types.extend(_all_types)

    # type_counts = Counter(all_types)
    # print("Type Counts (chart format)")
    # print(list(type_counts.keys()))
    # print(list(type_counts.values()))
    # print("Language:")
    # print(count_attribute(definitions, "language"))
    # print("Location:")
    # print(count_attribute(definitions, "location"))

    location_counts = count_attribute(definitions, "location")
    generate_choropleth(location_counts)

    #G = generate_graph_of_criteria(definitions)
    #nx.write_gml(G, "criteria_graph.gml")
