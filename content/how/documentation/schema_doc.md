
---
title: "Open Syndrome Definition Schema"
showDate: false
description: "Open Syndrome Definition documentation"
ToC: false
---

| Property                                                         | Type             | Title/Description                                                                                                                                                                                 |
| ---------------------------------------------------------------- | ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| + [title](#title )                                               | string           | Title of the case definition.                                                                                                                                                                     |
| - [description](#description )                                   | string           | Detailed description of a case definition.                                                                                                                                                        |
| + [scope](#scope )                                               | enum (of string) | A broad definition aims to capture most or all true cases, while a specific definition provides a more accurate description but risks missing some true cases.                                    |
| + [category](#category )                                         | enum (of string) | Case definition categories according to Bassil, K. (2008). Case definition. In Encyclopedia of epidemiology (Vol. 2, pp. 133-134). SAGE Publications, Inc., https://doi.org/10.4135/9781412953948 |
| + [version](#version )                                           | string           | Case definition version to be defined by the author but following the Semantic Versioning Specification (https://semver.org/).                                                                    |
| + [open_syndrome_version](#open_syndrome_version )               | string           | Open Syndrome Definition schema version.                                                                                                                                                          |
| + [published_in](#published_in )                                 | string           | URL where the narrative format definition was originally published or can be found.                                                                                                               |
| + [published_at](#published_at )                                 | string           | Date and time of publication at Open Syndrome Initiative website (UTC).                                                                                                                           |
| - [published_by](#published_by )                                 | array of string  | List of the case definition publishers in the Open Syndrome Initiative.                                                                                                                           |
| + [location](#location )                                         | string           | Free text for location input; recommended format is 'City, State/Region, Country' following geographical hierarchy with comma separation                                                          |
| + [language](#language )                                         | string           | Written language                                                                                                                                                                                  |
| + [organization](#organization )                                 | string           | The organization responsible for this case definition maintenance.                                                                                                                                |
| - [authors](#authors )                                           | array of string  | People or organizations that authored this case definition.                                                                                                                                       |
| + [inclusion_criteria](#inclusion_criteria )                     | array            | -                                                                                                                                                                                                 |
| - [exclusion_criteria](#exclusion_criteria )                     | array            | -                                                                                                                                                                                                 |
| - [notes](#notes )                                               | array of string  | Any notes that may be relevant to this case definition.                                                                                                                                           |
| + [references](#references )                                     | array of object  | References which have supported this definition followed by a URL.                                                                                                                                |
| + [status](#status )                                             | enum (of string) | Current status of this definition in the Open Syndrome Initiative platform.                                                                                                                       |
| - [keywords](#keywords )                                         | array of string  | Keywords related to a definition.                                                                                                                                                                 |
| - [human_readable_definition](#human_readable_definition )       | string           | A human-readable definition of the case definition, which can be used for display purposes in user interfaces.                                                                                    |
| - [target_public_health_threats](#target_public_health_threats ) | array of string  | List of public health threats that this case definition targets.                                                                                                                                  |

## Title

|              |          |
| ------------ | -------- |
| **Type**     | `string` |
| **Required** | Yes      |

**Description:** Title of the case definition.

## Description

|              |          |
| ------------ | -------- |
| **Type**     | `string` |
| **Required** | No       |

**Description:** Detailed description of a case definition.

## Category

|              |                    |
| ------------ | ------------------ |
| **Type**     | `enum (of string)` |
| **Required** | Yes                |

**Description:** A broad definition aims to capture most or all true cases, while a specific definition provides a more accurate description but risks missing some true cases.

Must be one of:
* "specific"
* "broad"

## Scope

|              |                    |
| ------------ | ------------------ |
| **Type**     | `enum (of string)` |
| **Required** | Yes                |
| **Default**  | `"suspected"`      |

**Description:** Case definition categories according to Bassil, K. (2008). Case definition. In Encyclopedia of epidemiology (Vol. 2, pp. 133-134). SAGE Publications, Inc., https://doi.org/10.4135/9781412953948

Must be one of:
* "confirmed"
* "probable"
* "suspected"

## Version

|              |          |
| ------------ | -------- |
| **Type**     | `string` |
| **Required** | Yes      |

**Description:** Case definition version to be defined by the author but following the Semantic Versioning Specification (https://semver.org/).

| Restrictions                      |                                                                                               |
| --------------------------------- | --------------------------------------------------------------------------------------------- |
| **Must match regular expression** | ```^\d+\.\d+\.\d+$``` [Test](https://regex101.com/?regex=%5E%5Cd%2B%5C.%5Cd%2B%5C.%5Cd%2B%24) |

## Open Syndrome Definition version

|              |          |
| ------------ | -------- |
| **Type**     | `string` |
| **Required** | Yes      |

**Description:** Open Syndrome Definition schema version.

**Example:**

```json
"1.0.0"
```

| Restrictions                      |                                                                                                                      |
| --------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| **Must match regular expression** | ```^\d+\.\d+\.\d+$``` [Test](https://regex101.com/?regex=%5E%5Cd%2B%5C.%5Cd%2B%5C.%5Cd%2B%24&testString=%221.0.0%22) |

## Published in

|              |          |
| ------------ | -------- |
| **Type**     | `string` |
| **Required** | Yes      |
| **Format**   | `uri`    |

**Description:** URL where the narrative format definition was originally published or can be found.

## Published at

|              |             |
| ------------ | ----------- |
| **Type**     | `string`    |
| **Required** | Yes         |
| **Format**   | `date-time` |

**Description:** Date and time of publication at Open Syndrome Initiative website (UTC).

**Example:**

```json
"2020-05-30T12:00:00Z"
```

## Published by

|              |                   |
| ------------ | ----------------- |
| **Type**     | `array of string` |
| **Required** | No                |

**Description:** List of the case definition publishers in the Open Syndrome Initiative.

**Examples:**

```json
[
    "Ana Maria Braga"
]
```

```json
[
    "Oswaldo Gonçalves Cruz",
    "Bento Gonçalves Cruz",
    "Amália Taborda de Bulhões Cruz"
]
```

|                      | Array restrictions |
| -------------------- | ------------------ |
| **Min items**        | N/A                |
| **Max items**        | N/A                |
| **Items unicity**    | False              |
| **Additional items** | False              |
| **Tuple validation** | See below          |

| Each item of this array must be           | Description |
| ----------------------------------------- | ----------- |
| [published_by items](#published_by_items) | -           |

## Location 

|              |          |
| ------------ | -------- |
| **Type**     | `string` |
| **Required** | Yes      |

**Description:** Free text for location input; recommended format is 'City, State/Region, Country' following geographical hierarchy with comma separation

**Examples:**

```json
"Salvador, Bahia, Brasil"
```

```json
"Berlin, Germany"
```

```json
"Nigeria"
```

## Language

|              |          |
| ------------ | -------- |
| **Type**     | `string` |
| **Required** | Yes      |

**Description:** Written language

**Examples:**

```json
"English"
```

```json
"Brazilian Portuguese"
```

## Organization

|              |          |
| ------------ | -------- |
| **Type**     | `string` |
| **Required** | Yes      |

**Description:** The organization responsible for this case definition maintenance.

**Examples:**

```json
"Ministry of Health"
```

```json
"The Epidemic Intelligence from Open Sources Initiative"
```

## Authors

|              |                   |
| ------------ | ----------------- |
| **Type**     | `array of string` |
| **Required** | No                |

**Description:** People or organizations that authored this case definition.

**Examples:**

```json
[
    "Ana Maria Braga"
]
```

```json
[
    "Oswaldo Gonçalves Cruz",
    "Bento Gonçalves Cruz",
    "Amália Taborda de Bulhões Cruz"
]
```

|                      | Array restrictions |
| -------------------- | ------------------ |
| **Min items**        | N/A                |
| **Max items**        | N/A                |
| **Items unicity**    | False              |
| **Additional items** | False              |
| **Tuple validation** | See below          |

| Each item of this array must be | Description |
| ------------------------------- | ----------- |
| [authors items](#authors_items) | -           |

## Inclusion Criteria

|              |         |
| ------------ | ------- |
| **Type**     | `array` |
| **Required** | Yes     |

|                      | Array restrictions |
| -------------------- | ------------------ |
| **Min items**        | N/A                |
| **Max items**        | N/A                |
| **Items unicity**    | False              |
| **Additional items** | False              |
| **Tuple validation** | See below          |

| Each item of this array must be        | Description |
| -------------------------------------- | ----------- |
| [criterion](#inclusion_criteria_items) | -           |

### Criterion

|                           |                   |
| ------------------------- | ----------------- |
| **Type**                  | `combining`       |
| **Required**              | No                |
| **Additional properties** | Any type allowed  |
| **Defined in**            | #/$defs/criterion |

| Property                                                                              | Pattern | Type             | Deprecated | Definition | Title/Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| ------------------------------------------------------------------------------------- | ------- | ---------------- | ---------- | ---------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| + [type](#inclusion_criteria_items_type )                                             | No      | enum (of string) | No         | -          | Type of criterion.<br /><br />- criteria: Group of criteria or conditions.<br />- syndrome: Syndrome (defined by another definition, but used here as a criterion).<br />- symptom: just a symptom.<br />- diagnosis: The diagnosed disease, which may or may not be followed by a code, e.g. ICD.<br />- diagnostic_test: Tests or medical examinations to confirm a diagnosis, e.g. gluplasma glucose.<br />- professional_judgment: Professional assessment.<br />- epidemiological_history: Travel history or contact with someone with an epidemiological link.<br />- demographic_criteria: Factors such as age or sex. |
| - [logical_operator](#inclusion_criteria_items_logical_operator )                     | No      | enum (of string) | No         | -          | Keywords that represent a logical operation on criteria.<br /><br />AND: All conditions in this group must be satisfied (true).<br />OR: At least one condition in this group must be satisfied.<br />AND_NOT: All conditions in this group must not be satisfied (must be false).<br />AT_LEAST: Used with the number specified in \`logical_operator_arguments\`. At least that many conditions must be true.                                                                                                                                                                                                               |
| - [logical_operator_arguments](#inclusion_criteria_items_logical_operator_arguments ) | No      | array of integer | No         | -          | Used with \`logical_operator = AT_LEAST\`. At least that many conditions must be true.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| - [name](#inclusion_criteria_items_name )                                             | No      | string           | No         | -          | Criterion label.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| - [attribute](#inclusion_criteria_items_attribute )                                   | No      | string           | No         | -          | The referred attribute.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| - [value](#inclusion_criteria_items_value )                                           | No      | object           | No         | -          | The reference value for the referred attribute. It has no type because it could be anything.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| - [description](#inclusion_criteria_items_description )                               | No      | string           | No         | -          | A detailed description of the criterion.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| - [operator](#inclusion_criteria_items_operator )                                     | No      | enum (of string) | No         | -          | Comparison operators.<br /><br />>: Value must be greater than the specified threshold.<br />>=: Value must be greater than or equal to the specified threshold.<br /><: Value must be less than the specified threshold.<br /><=: Value must be less than or equal to the specified threshold.<br />==: Value must exactly match the specified value.<br />!=: Value must not match the specified value.<br />regex: Value must match the specified regular expression pattern.                                                                                                                                              |
| - [regex_pattern](#inclusion_criteria_items_regex_pattern )                           | No      | string           | No         | -          | Regular expression for evaluation and pattern matching.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| - [regex_flags](#inclusion_criteria_items_regex_flags )                               | No      | string           | No         | -          | Regular expression flags for extra configuration.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| - [code](#inclusion_criteria_items_code )                                             | No      | object           | No         | -          | System agnostic diagnosis code.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| - [values](#inclusion_criteria_items_values )                                         | No      | array            | No         | -          | -                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |

| Any of(Option)                               |
| -------------------------------------------- |
| [item 0](#inclusion_criteria_items_anyOf_i0) |
| [item 1](#inclusion_criteria_items_anyOf_i1) |

#### 

|                           |                  |
| ------------------------- | ---------------- |
| **Type**                  | `object`         |
| **Required**              | No               |
| **Additional properties** | Any type allowed |

##### <a name="autogenerated_heading_2"></a>14.1.1.1. The following properties are required
* name

#### 

|                           |                  |
| ------------------------- | ---------------- |
| **Type**                  | `object`         |
| **Required**              | No               |
| **Additional properties** | Any type allowed |

##### <a name="autogenerated_heading_3"></a>14.1.2.1. The following properties are required
* values

#### 

|              |                    |
| ------------ | ------------------ |
| **Type**     | `enum (of string)` |
| **Required** | Yes                |

**Description:** Type of criterion.

- criteria: Group of criteria or conditions.
- syndrome: Syndrome (defined by another definition, but used here as a criterion).
- symptom: just a symptom.
- diagnosis: The diagnosed disease, which may or may not be followed by a code, e.g. ICD.
- diagnostic_test: Tests or medical examinations to confirm a diagnosis, e.g. gluplasma glucose.
- professional_judgment: Professional assessment.
- epidemiological_history: Travel history or contact with someone with an epidemiological link.
- demographic_criteria: Factors such as age or sex.

Must be one of:
* "criterion"
* "syndrome"
* "symptom"
* "diagnosis"
* "diagnostic_test"
* "professional_judgment"
* "epidemiological_history"
* "demographic_criteria"

#### Logical operator

|              |                    |
| ------------ | ------------------ |
| **Type**     | `enum (of string)` |
| **Required** | No                 |

**Description:** Keywords that represent a logical operation on criteria.

AND: All conditions in this group must be satisfied (true).
OR: At least one condition in this group must be satisfied.
AND_NOT: All conditions in this group must not be satisfied (must be false).
AT_LEAST: Used with the number specified in `logical_operator_arguments`. At least that many conditions must be true.

Must be one of:
* "AND"
* "OR"
* "AND_NOT"
* "AT_LEAST"

#### Logical operator arguments

|              |                    |
| ------------ | ------------------ |
| **Type**     | `array of integer` |
| **Required** | No                 |

**Description:** Used with `logical_operator = AT_LEAST`. At least that many conditions must be true.

|                      | Array restrictions |
| -------------------- | ------------------ |
| **Min items**        | 1                  |
| **Max items**        | 1                  |
| **Items unicity**    | False              |
| **Additional items** | False              |
| **Tuple validation** | See below          |

| Each item of this array must be                                                                | Description |
| ---------------------------------------------------------------------------------------------- | ----------- |
| [logical_operator_arguments items](#inclusion_criteria_items_logical_operator_arguments_items) | -           |

#### Name

|              |          |
| ------------ | -------- |
| **Type**     | `string` |
| **Required** | No       |

**Description:** Criterion label.

#### Value

|              |          |
| ------------ | -------- |
| **Type**     | `string` |
| **Required** | No       |

**Description:** The referred attribute.

**Examples:**

```json
"body_temperature"
```

```json
"age"
```

```json
"onset"
```

#### 

|                           |                  |
| ------------------------- | ---------------- |
| **Type**                  | `object`         |
| **Required**              | No               |
| **Additional properties** | Any type allowed |

**Description:** The reference value for the referred attribute. It has no type because it could be anything.

**Examples:**

```json
true
```

```json
37.5
```

```json
"abnormal but non-specific bowel gas pattern"
```

#### 

|              |          |
| ------------ | -------- |
| **Type**     | `string` |
| **Required** | No       |

**Description:** A detailed description of the criterion.

#### 

|              |                    |
| ------------ | ------------------ |
| **Type**     | `enum (of string)` |
| **Required** | No                 |

**Description:** Comparison operators.

>: Value must be greater than the specified threshold.
>=: Value must be greater than or equal to the specified threshold.
<: Value must be less than the specified threshold.
<=: Value must be less than or equal to the specified threshold.
==: Value must exactly match the specified value.
!=: Value must not match the specified value.
regex: Value must match the specified regular expression pattern.

Must be one of:
* ">"
* ">="
* "<"
* "<="
* "=="
* "!="
* "regex"

#### Regular expression

|              |          |
| ------------ | -------- |
| **Type**     | `string` |
| **Required** | No       |

**Description:** Regular expression for evaluation and pattern matching.

**Example:**

```json
"deng[u]?e"
```

#### Regular expression flags

|              |          |
| ------------ | -------- |
| **Type**     | `string` |
| **Required** | No       |

**Description:** Regular expression flags for extra configuration.

**Example:**

```json
"i"
```

| Restrictions                      |                                                                                                |
| --------------------------------- | ---------------------------------------------------------------------------------------------- |
| **Must match regular expression** | ```^[gimsuy]*$``` [Test](https://regex101.com/?regex=%5E%5Bgimsuy%5D%2A%24&testString=%22i%22) |

#### System agnostic diagnosis

|                           |                  |
| ------------------------- | ---------------- |
| **Type**                  | `object`         |
| **Required**              | No               |
| **Additional properties** | Any type allowed |

**Description:** System agnostic diagnosis code.

| Property                                             | Pattern | Type   | Deprecated | Definition | Title/Description                  |
| ---------------------------------------------------- | ------- | ------ | ---------- | ---------- | ---------------------------------- |
| + [system](#inclusion_criteria_items_code_system )   | No      | string | No         | -          | The diagnosis system used.         |
| + [code](#inclusion_criteria_items_code_code )       | No      | string | No         | -          | -                                  |
| - [display](#inclusion_criteria_items_code_display ) | No      | string | No         | -          | A label that represents this code. |

##### 

|              |          |
| ------------ | -------- |
| **Type**     | `string` |
| **Required** | Yes      |

**Description:** The diagnosis system used.

**Examples:**

```json
"ICD-10"
```

```json
"SNOMED-CT"
```

##### 

|              |          |
| ------------ | -------- |
| **Type**     | `string` |
| **Required** | Yes      |

**Examples:**

```json
"J11"
```

```json
"A.99"
```

```json
"233604007"
```

##### 

|              |          |
| ------------ | -------- |
| **Type**     | `string` |
| **Required** | No       |

**Description:** A label that represents this code.

**Examples:**

```json
"Pneumonia"
```

```json
"Dengue"
```

#### 

|              |         |
| ------------ | ------- |
| **Type**     | `array` |
| **Required** | No      |

|                      | Array restrictions |
| -------------------- | ------------------ |
| **Min items**        | N/A                |
| **Max items**        | N/A                |
| **Items unicity**    | True               |
| **Additional items** | False              |
| **Tuple validation** | See below          |

| Each item of this array must be                     | Description |
| --------------------------------------------------- | ----------- |
| [criterion](#inclusion_criteria_items_values_items) | -           |

##### <a name="inclusion_criteria_items_values_items"></a>14.1.14.1. Open Syndrome Case Definition Schema > inclusion_criteria > inclusion_criteria items > values > criterion

|                           |                                                       |
| ------------------------- | ----------------------------------------------------- |
| **Type**                  | `combining`                                           |
| **Required**              | No                                                    |
| **Additional properties** | Any type allowed                                      |
| **Same definition as**    | [inclusion_criteria_items](#inclusion_criteria_items) |

## 

|              |         |
| ------------ | ------- |
| **Type**     | `array` |
| **Required** | No      |

|                      | Array restrictions |
| -------------------- | ------------------ |
| **Min items**        | N/A                |
| **Max items**        | N/A                |
| **Items unicity**    | False              |
| **Additional items** | False              |
| **Tuple validation** | See below          |

| Each item of this array must be        | Description |
| -------------------------------------- | ----------- |
| [criterion](#exclusion_criteria_items) | -           |

### Exclusion criteria

|                           |                                                       |
| ------------------------- | ----------------------------------------------------- |
| **Type**                  | `combining`                                           |
| **Required**              | No                                                    |
| **Additional properties** | Any type allowed                                      |
| **Same definition as**    | [inclusion_criteria_items](#inclusion_criteria_items) |

## 

|              |                   |
| ------------ | ----------------- |
| **Type**     | `array of string` |
| **Required** | No                |

**Description:** Any notes that may be relevant to this case definition.

|                      | Array restrictions |
| -------------------- | ------------------ |
| **Min items**        | N/A                |
| **Max items**        | N/A                |
| **Items unicity**    | False              |
| **Additional items** | False              |
| **Tuple validation** | See below          |

| Each item of this array must be | Description |
| ------------------------------- | ----------- |
| [notes items](#notes_items)     | -           |

### Notes

|              |          |
| ------------ | -------- |
| **Type**     | `string` |
| **Required** | No       |

## Note item

|              |                   |
| ------------ | ----------------- |
| **Type**     | `array of object` |
| **Required** | Yes               |

**Description:** References which have supported this definition followed by a URL.

|                      | Array restrictions |
| -------------------- | ------------------ |
| **Min items**        | N/A                |
| **Max items**        | N/A                |
| **Items unicity**    | False              |
| **Additional items** | False              |
| **Tuple validation** | See below          |

| Each item of this array must be       | Description |
| ------------------------------------- | ----------- |
| [references items](#references_items) | -           |

### References

|                           |                  |
| ------------------------- | ---------------- |
| **Type**                  | `object`         |
| **Required**              | No               |
| **Additional properties** | Any type allowed |

| Property                                  | Pattern | Type   | Deprecated | Definition | Title/Description |
| ----------------------------------------- | ------- | ------ | ---------- | ---------- | ----------------- |
| - [citation](#references_items_citation ) | No      | string | No         | -          | -                 |
| + [url](#references_items_url )           | No      | string | No         | -          | -                 |

## Status

|              |                    |
| ------------ | ------------------ |
| **Type**     | `enum (of string)` |
| **Required** | Yes                |
| **Default**  | `"draft"`          |

**Description:** Current status of this definition in the Open Syndrome Initiative platform.

Must be one of:
* "draft"
* "published"
* "deprecated"

## Keywords

|              |                   |
| ------------ | ----------------- |
| **Type**     | `array of string` |
| **Required** | No                |

**Description:** Keywords related to a definition.

**Examples:**

```json
"outbreaks"
```

```json
"covid19"
```

```json
"WHO"
```

|                      | Array restrictions |
| -------------------- | ------------------ |
| **Min items**        | N/A                |
| **Max items**        | N/A                |
| **Items unicity**    | False              |
| **Additional items** | False              |
| **Tuple validation** | See below          |

| Each item of this array must be   | Description |
| --------------------------------- | ----------- |
| [keywords items](#keywords_items) | -           |

## Human-readable definition

|              |          |
| ------------ | -------- |
| **Type**     | `string` |
| **Required** | No       |

**Description:** A human-readable definition of the case definition, which can be used for display purposes in user interfaces.

## Public-health threats

|              |                   |
| ------------ | ----------------- |
| **Type**     | `array of string` |
| **Required** | No                |

**Description:** List of public health threats that this case definition targets.

|                      | Array restrictions |
| -------------------- | ------------------ |
| **Min items**        | N/A                |
| **Max items**        | N/A                |
| **Items unicity**    | False              |
| **Additional items** | False              |
| **Tuple validation** | See below          |

| Each item of this array must be                                           | Description |
| ------------------------------------------------------------------------- | ----------- |
| [target_public_health_threats items](#target_public_health_threats_items) | -           |

**Examples:**

```json
"COVID-19"
```

```json
"Influenza"
```

```json
"Extreme Weather Events"
```
