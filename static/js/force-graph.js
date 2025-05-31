// Force-directed graph component
function createForceGraph(data) {
    // Set up the SVG dimensions
    const width = 800;
    const height = 600;

    // Create SVG with transparent background
    const svg = d3.select("#force-graph")
        .append("svg")
        .attr("width", width)
        .attr("height", height)
        .attr("style", "background: transparent");

    // Create a group for the graph that will be transformed
    const g = svg.append("g");

    // Add zoom behavior
    const zoom = d3.zoom()
        .scaleExtent([0.1, 4]) // Min and max zoom scale
        .on("zoom", (event) => {
            g.attr("transform", event.transform);
        });

    // Apply zoom behavior to the SVG with initial zoom out
    svg.call(zoom)
        .call(zoom.transform, d3.zoomIdentity.scale(0.6)); // Start zoomed out to show more nodes

    // Define node colors based on type
    const nodeColors = {
        "definition": "#000000",
        "symptom": "#1f77b4",
        "diagnosis": "#ff7f0e",
        "professional_judgment": "#2ca02c",
        "demographic_criteria": "#d62728",
        "diagnostic_test": "#9467bd",
        "syndrome": "#8c564b",
        "epidemiological_history": "#e377c2"
    };

    // Create the force simulation
    const simulation = d3.forceSimulation(data.nodes)
        .force("link", d3.forceLink(data.links).id(d => d.id).distance(100))
        .force("charge", d3.forceManyBody().strength(-300))
        .force("center", d3.forceCenter(width / 2, height / 2))
        .force("collision", d3.forceCollide().radius(50));

    // Function to calculate the center of mass
    function calculateCenterOfMass() {
        let totalX = 0, totalY = 0, count = 0;
        data.nodes.forEach(node => {
            if (node.x && node.y) {
                totalX += node.x;
                totalY += node.y;
                count++;
            }
        });
        return count > 0 ? { x: totalX / count, y: totalY / count } : { x: width / 2, y: height / 2 };
    }

    // Function to center the graph
    function centerGraph() {
        const center = calculateCenterOfMass();
        const transform = d3.zoomIdentity
            .translate(width / 2, height / 2)
            .scale(0.6) // Set the zoom level to 0.6
            .translate(-center.x, -center.y);
        
        svg.transition()
            .duration(750)
            .call(zoom.transform, transform);
    }

    // Create the links
    const link = g.append("g")
        .selectAll("line")
        .data(data.links)
        .join("line")
        .attr("stroke", "#999")
        .attr("stroke-opacity", 0.6)
        .attr("stroke-width", 1);

    // Create the nodes
    const node = g.append("g")
        .selectAll("circle")
        .data(data.nodes)
        .join("circle")
        .attr("r", d => d.type === "definition" ? 8 : 5)
        .attr("fill", d => nodeColors[d.type] || "#999")
        .attr("stroke", d => d.type === "definition" ? "#000" : "none")
        .attr("stroke-width", d => d.type === "definition" ? 2 : 0)
        .call(drag(simulation));

    // Add labels
    const label = g.append("g")
        .selectAll("text")
        .data(data.nodes)
        .join("text")
        .text(d => d.label)
        .attr("font-size", 10)
        .attr("font-family", "system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif")
        .attr("dx", 12)
        .attr("dy", 4);

    // Add tooltips
    const tooltip = d3.select("body")
        .append("div")
        .attr("class", "tooltip")
        .style("opacity", 0)
        .style("position", "absolute")
        .style("background-color", "white")
        .style("border", "1px solid #ddd")
        .style("padding", "10px")
        .style("border-radius", "5px")
        .style("pointer-events", "none")
        .style("font-family", "system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif");

    node.on("mouseover", function(event, d) {
        tooltip.transition()
            .duration(200)
            .style("opacity", .9);
        
        let tooltipContent = `<strong>${d.label}</strong><br/>`;
        tooltipContent += `Type: ${d.type}<br/>`;
        if (d.description) tooltipContent += `Description: ${d.description}<br/>`;
        if (d.attribute) tooltipContent += `Attribute: ${d.attribute}<br/>`;
        if (d.operator) tooltipContent += `Operator: ${d.operator}<br/>`;
        if (d.value) tooltipContent += `Value: ${d.value}<br/>`;
        if (d.unit) tooltipContent += `Unit: ${d.unit}<br/>`;
        
        tooltip.html(tooltipContent)
            .style("left", (event.pageX + 10) + "px")
            .style("top", (event.pageY - 28) + "px");
    })
    .on("mouseout", function() {
        tooltip.transition()
            .duration(500)
            .style("opacity", 0);
    });

    // Update positions on each tick
    simulation.on("tick", () => {
        link
            .attr("x1", d => d.source.x)
            .attr("y1", d => d.source.y)
            .attr("x2", d => d.target.x)
            .attr("y2", d => d.target.y);

        node
            .attr("cx", d => d.x)
            .attr("cy", d => d.y);

        label
            .attr("x", d => d.x)
            .attr("y", d => d.y);
    });

    // Center the graph after the initial layout
    simulation.on("end", () => {
        centerGraph();
    });

    // Drag functions
    function drag(simulation) {
        function dragstarted(event) {
            if (!event.active) simulation.alphaTarget(0.3).restart();
            event.subject.fx = event.subject.x;
            event.subject.fy = event.subject.y;
        }

        function dragged(event) {
            event.subject.fx = event.x;
            event.subject.fy = event.y;
        }

        function dragended(event) {
            if (!event.active) simulation.alphaTarget(0);
            event.subject.fx = null;
            event.subject.fy = null;
        }

        return d3.drag()
            .on("start", dragstarted)
            .on("drag", dragged)
            .on("end", dragended);
    }

    // Add zoom controls
    const zoomControls = d3.select("#force-graph")
        .append("div")
        .style("position", "absolute")
        .style("top", "10px")
        .style("left", "10px")
        .style("display", "flex")
        .style("gap", "5px");

    // Add zoom in button
    zoomControls.append("button")
        .text("+")
        .style("width", "30px")
        .style("height", "30px")
        .style("border-radius", "50%")
        .style("border", "1px solid #ddd")
        .style("background", "white")
        .style("cursor", "pointer")
        .on("click", () => {
            svg.transition()
                .duration(300)
                .call(zoom.scaleBy, 1.3);
        });

    // Add zoom out button
    zoomControls.append("button")
        .text("-")
        .style("width", "30px")
        .style("height", "30px")
        .style("border-radius", "50%")
        .style("border", "1px solid #ddd")
        .style("background", "white")
        .style("cursor", "pointer")
        .on("click", () => {
            svg.transition()
                .duration(300)
                .call(zoom.scaleBy, 0.7);
        });

    // Add reset button
    zoomControls.append("button")
        .text("Reset")
        .style("padding", "0 10px")
        .style("height", "30px")
        .style("border-radius", "15px")
        .style("border", "1px solid #ddd")
        .style("background", "white")
        .style("cursor", "pointer")
        .on("click", centerGraph);

    // Export as SVG
    function exportSVG() {
        // Create a clone of the SVG to modify for export
        const svgClone = svg.node().cloneNode(true);
        
        // Add font-family to the SVG element
        svgClone.setAttribute("font-family", "system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif");
        
        // Add a style element to ensure fonts are embedded
        const style = document.createElementNS("http://www.w3.org/2000/svg", "style");
        style.textContent = `
            @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap');
            text {
                font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            }
        `;
        svgClone.insertBefore(style, svgClone.firstChild);
        
        const svgData = new XMLSerializer().serializeToString(svgClone);
        const svgBlob = new Blob([svgData], {type: "image/svg+xml;charset=utf-8"});
        const svgUrl = URL.createObjectURL(svgBlob);
        const downloadLink = document.createElement("a");
        downloadLink.href = svgUrl;
        downloadLink.download = "force-graph.svg";
        document.body.appendChild(downloadLink);
        downloadLink.click();
        document.body.removeChild(downloadLink);
    }

    // Add export button
    d3.select("#force-graph")
        .append("button")
        .text("Export as SVG")
        .style("position", "absolute")
        .style("top", "10px")
        .style("right", "10px")
        .style("padding", "0 10px")
        .style("height", "30px")
        .style("border-radius", "15px")
        .style("border", "1px solid #ddd")
        .style("background", "white")
        .style("cursor", "pointer")
        .on("click", exportSVG);
}

// Parse GML format
function parseGML(text) {
    const nodes = [];
    const links = [];
    let stack = [];
    
    // Split the text into lines and process each line
    const lines = text.split('\n');
    for (let line of lines) {
        line = line.trim();
        
        if (line.startsWith('node [')) {
            stack.push({ type: 'node', data: { id: null, label: '', type: 'unknown' } });
        } else if (line.startsWith('edge [')) {
            currentEdge = { source: null, target: null };
            stack.push({ type: 'edge', data: { source: null, target: null } });
        } else if (line === ']') {
            const item = stack.pop();
            if (!item) continue;
            
            if (item.type === 'node' && item.data.id !== null) {
                // If the node has no type but has a label, it's likely a definition
                if (item.data.type === 'unknown' && item.data.label) {
                    item.data.type = 'definition';
                }
                nodes.push(item.data);
            } else if (item.type === 'edge' && item.data.source !== null && item.data.target !== null) {
                links.push(item.data);
            }
        } else if (stack.length > 0) {
            const current = stack[stack.length - 1];
            if (!current) continue;
            
            if (line.startsWith('id')) {
                const id = line.split(' ')[1];
                current.data.id = id;
            } else if (line.startsWith('label')) {
                const label = line.substring(line.indexOf('"') + 1, line.lastIndexOf('"'));
                current.data.label = label;
                // If this is a node without a type, it's likely a definition
                if (current.type === 'node' && current.data.type === 'unknown') {
                    current.data.type = 'definition';
                }
            } else if (line.startsWith('type')) {
                const type = line.substring(line.indexOf('"') + 1, line.lastIndexOf('"'));
                current.data.type = type;
            } else if (line.startsWith('source')) {
                const source = line.split(' ')[1];
                current.data.source = source;
            } else if (line.startsWith('target')) {
                const target = line.split(' ')[1];
                current.data.target = target;
            } else if (line.startsWith('description')) {
                const description = line.substring(line.indexOf('"') + 1, line.lastIndexOf('"'));
                current.data.description = description;
            } else if (line.startsWith('attribute')) {
                const attribute = line.substring(line.indexOf('"') + 1, line.lastIndexOf('"'));
                current.data.attribute = attribute;
            } else if (line.startsWith('operator')) {
                const operator = line.substring(line.indexOf('"') + 1, line.lastIndexOf('"'));
                current.data.operator = operator;
            } else if (line.startsWith('value')) {
                const value = line.substring(line.indexOf('"') + 1, line.lastIndexOf('"'));
                current.data.value = value;
            } else if (line.startsWith('unit')) {
                const unit = line.substring(line.indexOf('"') + 1, line.lastIndexOf('"'));
                current.data.unit = unit;
            }
        }
    }
    
    return { nodes, links };
}

// Load and parse the GML file
d3.text("/data/criteria_graph.gml").then(text => {
    try {
        // Parse GML file
        const { nodes, links } = parseGML(text);
        console.log("Parsed nodes:", nodes.length);
        console.log("Parsed links:", links.length);
        
        // Create the graph
        createForceGraph({ nodes, links });
    } catch (error) {
        console.error("Error parsing GML:", error);
    }
}); 