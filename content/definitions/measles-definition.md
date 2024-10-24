---
title: "Measles Case Definition"
description: "This is a demo of the Congo theme for Hugo."
date: 2024-10-24
---

{{< badge >}}
Generated automatically
{{< /badge >}}


```json
{
    "title": "Measles Case Definition",
    "description": "Clinical criteria for suspected measles cases as defined by the European Centre for Disease Prevention and Control (ECDC)",
    "scope": "specific",
    "version": "1.0.0",
    "open_syndrome_version": 1.0,
    "publish_in": "https://eur-lex.europa.eu/legal-content/EN/TXT/PDF/?uri=CELEX:32018D0945&from=EN#page=30",
    "published_at": "2024-10-08T09:09:56.930700Z",
    "location": "Europe",
    "organization": "European Centre for Disease Prevention and Control",
    "authors": [],
    "clinical_criterias": [
      {
        "type": "criteria",
        "logical_operator": "AND",
        "values": [
          {
            "type": "syndrome",
            "name": "fever"
          },
          {
            "type": "symptom",
            "name": "maculo-papular rash"
          },
          {
            "type": "criteria",
            "logical_operator": "AT_LEAST",
            "logical_operator_arguments": [1],
            "values": [
              {
                "type": "symptom",
                "name": "cough"
              },
              {
                "type": "symptom",
                "name": "coryza"
              },
              {
                "type": "symptom",
                "name": "conjunctivitis"
              }
            ]
          }
        ]
      }
    ],
    "notes": [
      "This definition is based on the clinical criteria for measles as defined by the ECDC"
    ]
  }
```
