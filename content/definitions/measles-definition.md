---
title: "Measles Case Definition"
description: "This is a demo of the Congo theme for Hugo."
date: 2024-10-24
---

{{< badge >}}
Generated automatically
{{< /badge >}}

# Open Syndrome Case Definition: Diarrhea

*Released on October 25, 2024*

Today, we are releasing a standardized case definition for Diarrhea in the Open Syndrome format. This definition, based on the [Brighton Collaboration guidelines](https://brightoncollaboration.org/diarrhea/), aims to provide a consistent framework for surveillance and reporting of diarrhea cases, particularly as an Adverse Event Following Immunization (AEFI).

## Why This Matters

Diarrhea remains a significant global health concern, causing over 2 million deaths annually worldwide. The lack of standardized reporting definitions has historically made it challenging to:

* Compare data across different surveillance systems
* Aggregate information from multiple sources
* Ensure consistent reporting in clinical trials
* Monitor vaccine safety effectively

## The Definition

Our new case definition implements the following criteria in a machine-readable format:

### Primary Diagnostic Criteria
All of the following must be present:
* Loose stools
* ≥3 occurrences
* Within a 24-hour period

### Stool Characteristics
At least one of:
* Watery consistency
* Unformed stools

### Associated Signs
Any of the following may be present:
* Clinical dehydration
* Decreased skin turgor
* Sunken eyes
* Low blood pressure (<90/60)

## Technical Implementation

The definition is available in JSON format following the Open Syndrome v1.0 specification. Here's a simplified example:

```json
{
    "title": "Acute Diarrhea Case Definition",
    "description": "Standardized case definition for acute diarrhea as an Adverse Event Following Immunization (AEFI) to enable consistent reporting and comparison across different healthcare settings and surveillance systems",
    "scope": "specific",
    "version": "1.0.0",
    "open_syndrome_version": 1.0,
    "publish_in": "https://brightoncollaboration.org/diarrhea",
    "published_at": "2024-10-25 00:00:00.000000",
    "location": "Global",
    "organization": "Brighton Collaboration",
    "language": "en",
    "authors": ["Brighton Collaboration Diarrhea Working Group"],
    "clinical_criterias": [
        {
            "type": "criteria",
            "logical_operator": "AND",
            "values": [
                {
                    "type": "symptom",
                    "name": "loose_stool"
                },
                {
                    "type": "value",
                    "name": "stool_frequency",
                    "operator": ">=",
                    "value": "3"
                },
                {
                    "type": "value",
                    "name": "time_period",
                    "operator": "<=",
                    "value": "24"
                }
            ]
        },
        {
            "type": "criteria",
            "logical_operator": "AT_LEAST",
            "logical_operator_arguments": ["1"],
            "values": [
                {
                    "type": "symptom",
                    "name": "watery_stool"
                },
                {
                    "type": "symptom",
                    "name": "unformed_stool"
                }
            ]
        },
        {
            "type": "criteria",
            "logical_operator": "OR",
            "values": [
                {
                    "type": "symptom",
                    "name": "dehydration"
                },
                {
                    "type": "symptom",
                    "name": "decreased_skin_turgor"
                },
                {
                    "type": "symptom",
                    "name": "sunken_eyes"
                },
                {
                    "type": "value",
                    "name": "blood_pressure",
                    "operator": "<",
                    "value": "90/60"
                }
            ]
        }
    ]
}
```

## Using the Definition

Healthcare organizations can implement this definition through:

* Direct integration with surveillance systems
* API endpoints for real-time validation
* Manual case verification processes

## Next Steps

We encourage:

* Clinical feedback on the definition criteria
* Technical feedback on the implementation format
* Suggestions for additional symptoms or signs
* Reports of implementation experiences

## Get Involved

Find the complete definition and implementation guides in our GitHub repository. We welcome contributions and feedback from the community.
