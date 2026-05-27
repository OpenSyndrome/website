---
title: "Case definitions dataset released!"
date: 2025-10-24
---

# Case Definitions Now Available in Open Syndrome Format

We are excited to announce a significant milestone in public health surveillance: the first case definitions are now available in the Open Syndrome format.
This development marks a crucial step forward in standardizing disease surveillance.

## What's in the dataset

The bundle covers **40 case definitions** from a range of public health threats, countries, and health organizations, in both human- and machine-readable formats:

* **JSON** — Open Syndrome format (v1), machine-readable
* **TXT** — extracted text, one file per definition
* **PDF** — original source documents

File names follow `<public-health-threat>_<provenance-or-organization>`, so each definition is traceable to its source.

Each Open Syndrome JSON includes:

* Standardized clinical criteria
* Logical operators for combining symptoms and signs
* Version control for tracking updates
* Machine-readable thresholds and measurements

## Two ways to access the definitions

There are two sources, and they serve different needs.

### 1. Paper snapshot on Hugging Face (frozen bundle)

The exact bundle used in the [Open Syndrome paper](https://arxiv.org/abs/2509.25434) is published on Hugging Face with a citable DOI:

* **Repository:** [`opensyndrome/case-definitions`](https://huggingface.co/datasets/opensyndrome/case-definitions)
* **Size:** ~62 MB · **License:** MIT · **DOI:** [10.57967/hf/6635](https://doi.org/10.57967/hf/6635)

Structure:

```
.
├── human_readable/
│   ├── pdf/   # Original PDF documents
│   └── txt/   # Extracted text, one file per definition
└── machine_readable/
    └── json/  # Open Syndrome format (v1)
```

**Browser, no tools required.** Open the [Files tab](https://huggingface.co/datasets/opensyndrome/case-definitions/tree/main) on Hugging Face and download files or folders directly — no account needed.

**A single file by URL.** Every file resolves at a stable URL, which makes scripting trivial:

```bash
curl -LO https://huggingface.co/datasets/opensyndrome/case-definitions/resolve/main/machine_readable/json/acuteflaccidparalysis_kenya.json
```

**Whole bundle via the Hugging Face CLI:**

```bash
pip install -U "huggingface_hub[cli]"
hf download opensyndrome/case-definitions --repo-type dataset --local-dir ./case-definitions
```

**Whole bundle in Python:**

```python
from huggingface_hub import snapshot_download

path = snapshot_download(
    repo_id="opensyndrome/case-definitions",
    repo_type="dataset",
)
print(path)  # local cache directory containing all files
```

**Or with `git`** (requires [`git-lfs`](https://git-lfs.com/)):

```bash
git lfs install
git clone https://huggingface.co/datasets/opensyndrome/case-definitions
```

### 2. Continuously updated definitions on GitHub

If you want the *current* machine-readable definitions — including fixes and additions made after the paper — pull
them from the GitHub repository, where every change is validated by CI against the [Open Syndrome schema](https://github.com/OpenSyndrome/schema):

* **Repository:** [`OpenSyndrome/definitions`](https://github.com/OpenSyndrome/definitions)

JSONs live under `definitions/v1/`, organized alphabetically. Grab a single file directly:

```bash
curl -LO https://raw.githubusercontent.com/OpenSyndrome/definitions/main/definitions/v1/d/diarrhea_pacificislands.json
```

Or clone the whole repo:

```bash
git clone https://github.com/OpenSyndrome/definitions.git
```

> **Which one should I use?**
> Use the **Hugging Face** bundle to reproduce or cite the paper exactly.
> Use the **GitHub** repo when you want the freshest definitions for tooling and production.

## What's next

This release is just the beginning. We are working on additional case definitions from other major health organizations,
a UI to help on converting existing definitions to Open Syndrome format (already available in our
[Python library](https://github.com/OpenSyndrome/open-syndrome-python/)) and more!

## Join the community

We invite public health professionals, developers, and researchers to contribute to this initiative.
Open an issue or pull request on the [GitHub repository](https://github.com/OpenSyndrome/definitions) to suggest improvements or add a definition,
and please cite us as described in our [citation guide](https://opensyndrome.org/blog/how-to-cite/).

{{< alert "email" >}}
Want to talk to us? Send an email to [gomes-ferreiraa@rki.de](mailto:gomes-ferreiraa@rki.de)
{{< /alert >}}

Together, we're building a more standardized and efficient global disease surveillance system.
