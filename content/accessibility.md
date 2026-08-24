---
title: "Accessibility"
showDate: false
---

## Our commitment

The Open Syndrome Initiative aims to make this site accessible to as many people as possible.
We target the Web Content Accessibility Guidelines (WCAG) 2.1, level AA — the same technical standard referenced by Germany's Barrier-free Information Technology Ordinance (BITV 2.0), in keeping with our maintainer's affiliation with the [Visualization Group](https://visualization.group/).

## Conformance status

This site is **partially conformant** with WCAG 2.1 AA. Partially conformant means some parts of the content do not yet fully conform to the standard.

### Known issues

An automated audit ([Pa11y](https://pa11y.org/), WCAG2AA ruleset, cross-checked with axe-core) in August 2026 found and we fixed:

- The GitHub link in the main menu and the Bluesky icon in the blog-post sharing links lacked accessible text for screen readers.
- The search dialog's input field had no accessible name, and its form had no submit control, which affected keyboard-only users.
- The "#" permalink links next to headings were distinguished from surrounding text by color alone.
- The skip-to-content link (revealed on keyboard focus) had insufficient color contrast.
- The "Open Data Browser" button on the [Live](/live/) page, and the color-coded dots in its definitions-graph legend, had insufficient color contrast.

We also cross-checked the previous/next article-footer arrows and the floating "back to top" button that axe-core flagged as ambiguous ("needs review", not a confirmed failure): both compute well above the required 4.5:1 in the way they're actually shown, so we're treating them as resolved rather than changing them further.

Fixing the legend colors above also surfaced a larger, separate item we haven't tackled yet: the definitions-graph itself (rendered via [D3](https://d3js.org/)) draws its node labels in a fixed gray (`#666666`) that falls short of AA contrast, and its "Export as SVG"/"Reset" buttons have the same issue. That's a bigger change to the graph's rendering code, not a quick fix, so it's still open.

We are working through these. Automated testing does not catch everything, so other barriers may exist that we are not yet aware of.

## How we test

We assess accessibility with automated tools — Pa11y (WCAG2AA ruleset) and axe-core — run against key pages as part of routine maintenance. These flag common issues such as missing accessible names, insufficient contrast, and missing form controls, but they cannot verify everything a full WCAG audit requires; manual review is still needed for complete assurance.

## Feedback

If you encounter an accessibility barrier on this site, please let us know.

{{< alert "email" >}}
Report accessibility issues to [opensyndrome@anapaulagomes.me](mailto:opensyndrome@anapaulagomes.me)
{{< /alert >}}

---

This page follows the structure of [similar public-sector accessibility statements](https://www.rki.de/EN/Service/Accessibility/accessibility_node.html) in the interest of transparency, given our affiliation with the Visualization Group. The Open Syndrome Initiative itself is not a German public body, so this page is not a formal declaration under the BGG/BITV 2.0.
