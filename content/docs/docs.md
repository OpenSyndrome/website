---
title: "Docs"
date: 2024-10-25
description: "Open Syndrome documentation"
tags: ["docs"]
---

## Architecture

Our architecture is deliberately simple: a GitHub repository serves as the central hub where all syndrome definitions are stored and managed. When practitioners submit new definitions through Pull Requests, our system automatically validates the format. Only verified contributors can have their submissions reviewed by the community. Once approved, the definitions are automatically published to our website.
Here's a visual representation of our workflow:

{{< mermaid >}}
sequenceDiagram
participant PH as Practitioner
participant GR as Repository
participant CI as CI/CD
participant WEB as Static Website
participant DU as Data Users<br/>(Technical/Academic/Healthcare Orgs)

Note over PH,DU: Contribution Flow
PH->>GR: Open PR with syndrome definition
GR->>CI: Trigger validation
CI->>CI: Validate JSON schema
alt Valid Definition
    CI->>GR: Report success
    GR->>GR: Check contributor verification
    alt Verified Contributor
        Note over GR: Community Review Period
        GR->>PH: Request changes (if needed)
        PH->>GR: Address review comments
        GR->>GR: PR approved
        GR->>GR: Merge to main branch
        GR->>CI: Trigger build
        CI->>WEB: Deploy static website
    else Unverified Contributor
        Note over GR: Wait for Verification
        GR->>PH: Request verification
        PH->>GR: Complete verification
        Note over GR: Resume Review Process
    end
else Invalid Definition
    CI->>GR: Report failure
    GR->>PH: Request fixes
end

Note over PH,DU: Usage Flow
DU->>WEB: Browse definitions
DU->>WEB: Download JSON
DU->>WEB: Copy text format
DU->>WEB: Convert text to JSON
{{< /mermaid >}}

## Our Community

Our platform brings together four key groups: **Public Health Practitioners** who contribute their expertise through syndrome definitions,
the **Technical Community** that builds tools and models using this data, **Healthcare Organizations** that implement these definitions in
practice, and the **Academic Community** that uses this knowledge for research and education.

## The Power of Open Format

By choosing an open format and Git-based workflow, we're making medical knowledge more accessible and standardized. This approach enables everything from machine learning research to clinical education. Practitioners can share their knowledge easily, researchers can develop new syndrome discovery models, and organizations can implement standardized definitions in their systems.

## Getting Started

Whether you want to contribute new syndrome definitions or use existing ones, starting is simple.
Contributors submit their definitions through [GitHub Pull Requests](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request),
and users can access the definitions through our website in various formats - `JSON`, text, or through direct GitHub access.

This initiative represents a step toward more open, standardized, and collaborative medical knowledge sharing.
By bringing together clinical expertise and modern technology infrastructure, we're creating a valuable resource
for the entire healthcare community.
