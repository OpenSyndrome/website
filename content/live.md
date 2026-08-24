---
title: "Live"
showDate: false
layout: "simple"
---

## Data Browser

Explore the Open Syndrome definitions interactively in the live data browser.

<a href="https://huggingface.co/spaces/opensyndrome/data-browser" target="_blank" rel="noopener" style="display:inline-block; margin-bottom: 1rem; padding: 0.5rem 1.25rem; background:#008850; color:#fff; border-radius:6px; text-decoration:none; font-weight:600;">Open Data Browser →</a>

---

## Dataset

The full definitions dataset is available for download and programmatic access.

- [Case Definitions dataset (PDF, TXT and JSON)](https://huggingface.co/datasets/opensyndrome/case-definitions)

---

## Definitions Graph

This interactive visualization shows the relationships between different criteria in our definitions. Each node represents a criterion or definition, and the connections show how they are related.

<div id="force-graph" style="width: 100%; height: 600px; position: relative;"></div>

<span style="color: #000000">●</span> Definition
<span style="color: #1f77b4">●</span> Symptom
<span style="color: #bf5900">●</span> Diagnosis
<span style="color: #158915">●</span> Professional Judgment
<span style="color: #d62728">●</span> Demographic Criteria
<span style="color: #8f62b8">●</span> Diagnostic Test
<span style="color: #8c564b">●</span> Syndrome
<span style="color: #ad3a8c">●</span> Epidemiological History

{{< badge >}}
Tips
{{< /badge >}}

- **Hover** over nodes to see detailed information
- **Drag** nodes to rearrange the graph
- **Click** the "Export as SVG" button to download the current view as an SVG file

<script src="https://cdn.jsdelivr.net/npm/d3@7"></script>
<script src="/js/force-graph.js"></script>
