---
title: "The Definitions Graph"
showDate: false
---

This interactive visualization shows the relationships between different criteria in our definitions. Each node represents a criterion or definition, and the connections show how they are related.

<div id="force-graph" style="width: 100%; height: 600px; position: relative;"></div>

<span style="color: #000000">●</span> Definition
<span style="color: #1f77b4">●</span> Symptom
<span style="color: #ff7f0e">●</span> Diagnosis
<span style="color: #2ca02c">●</span> Professional Judgment
<span style="color: #d62728">●</span> Demographic Criteria
<span style="color: #9467bd">●</span> Diagnostic Test
<span style="color: #8c564b">●</span> Syndrome
<span style="color: #e377c2">●</span> Epidemiological History

{{< badge >}}
Tips
{{< /badge >}}

- **Hover** over nodes to see detailed information
- **Drag** nodes to rearrange the graph
- **Click** the "Export as SVG" button to download the current view as an SVG file

<script src="https://cdn.jsdelivr.net/npm/d3@7"></script>
<script src="/js/force-graph.js"></script> 
