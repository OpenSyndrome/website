---
title: "Introducing the Open Syndrome Editor"
date: 2026-06-08
---

# Write a Case Definition, Get Machine-Readable JSON

When we [released the first case definitions dataset](https://opensyndrome.org/blog/first-case-definitions-dataset-released/),
we promised a tool to help turn existing definitions into the Open Syndrome format. Today that tool is here: the **Open Syndrome Editor**,
an open-source web application you can run on your own machine. The code lives at [github.com/OpenSyndrome/editor](https://github.com/OpenSyndrome/editor).

{{< figure src="editor.png" alt="The Open Syndrome Editor turning a clinical case definition into validated JSON" caption="The Open Syndrome Editor: clinical prose on the left, the validated structured definition on the right." >}}

The idea is simple. A case definition usually starts life as a paragraph of clinical prose, the kind of text you find in
a surveillance manual or a published guideline. That prose is easy for a person to read but hard for a computer to use.
The Editor sits in the middle: you paste the text, and it helps you produce a clean, validated [Open Syndrome Definition (OSD)](https://github.com/OpenSyndrome/schema)
in JSON, ready to be shared, queried, or plugged into a surveillance system.

{{< alert >}}
**The Editor is not a hosted service.** There is no public instance to sign up for. It runs entirely on your own machine, either
locally or on infrastructure you self-host, so your clinical text stays under your control. Bringing it up takes a few minutes
(see [For developers](#for-developers) below).
{{< /alert >}}

## For public health practitioners

You do not need to know anything about JSON or programming to use the Editor. The screen is split into two panes, a bit like
a document on the left and its structured version on the right, and you move a definition through four straightforward steps.

**Convert.** Paste the free text of a clinical case definition — say, the criteria for acute flaccid paralysis — and the
Editor reads it and proposes a structured version: the clinical criteria, the symptoms and signs, and how they combine
("any two of these three," "this *and* that, but *not* the other"). You stay in control and can adjust anything it gets wrong.

**Validate.** With one action, the Editor checks your definition against the official Open Syndrome schema and tells you,
in plain terms, whether anything is missing or malformed. This is the same check our community repository runs on every
contribution, so if it passes here, it is ready to share.

**Enrich.** Public health vocabularies give each symptom a standard identifier so that "fever" means the same thing everywhere.
The Editor can look those identifiers up for you automatically, matching your criteria against the EBI Ontology Lookup Service.
No more hunting through reference tables by hand.

**Humanize.** The reverse trip also works. Hand the Editor a structured definition and it writes the narrative back out as readable
prose — useful for review, for documentation, or simply for checking that the structured version still says what you meant.

You can start from your own pasted text, from a JSON file on your computer, or by browsing the existing [community definitions](https://github.com/OpenSyndrome/definitions) directly inside the tool.
When you are happy, you view, copy, or download the JSON. That is the whole loop: prose in, validated definition out.

## For developers

Under the hood the Editor is a single container that pairs a **React + Vite** front end with a **FastAPI** back end, and all the real
work is delegated to the [`opensyndrome`](https://github.com/OpenSyndrome/open-syndrome-python) Python package, the same library that powers the rest of the ecosystem.
The web app is, in effect, a friendly face over that package, so anything the Editor does you can also script.

Running it locally takes a few minutes. In dev mode you bring up the API and the UI separately:

```bash
cp .env.example .env        # set OPENSYNDROME_PROVIDER / OPENSYNDROME_MODEL
uv sync
uv run uvicorn app.main:app --reload --port 8000     # API on :8000

cd frontend && npm install && npm run dev            # UI on :5173 (proxies /api -> :8000)
# open http://localhost:5173
```

Or run the single production image, the same one that ships to Hugging Face Spaces:

```bash
docker build -t opensyndrome-editor .
docker run --rm -p 7860:7860 --env-file .env opensyndrome-editor
# open http://localhost:7860
```

The model provider is entirely up to you. Because conversion runs through a configurable provider, you can point it at a local [ollama](https://ollama.com/)
instance and keep every piece of clinical text on your own hardware. Nothing leaves the machine:

```bash
ollama pull qwen2.5:7b-instruct
# then set OPENSYNDROME_PROVIDER=ollama and OPENSYNDROME_MODEL=qwen2.5:7b-instruct in .env
```

That self-hosted path matters for surveillance work, where the source material can be sensitive and "send it to a cloud API" is not always an option.
Validation and enrichment, for their part, need no model credits at all. The repository's `README` covers the remaining details:
billing through Hugging Face Inference Providers, optional Sentry error monitoring, and the test suites for both back end and front end.

## Try it and tell us what breaks

The Editor is open source under the same spirit as the rest of the project: clone it, run it, and open an issue or pull request
when something does not work the way you expect. It is the most direct way yet to contribute a definition — convert your text,
validate it, and send it to the [community repository](https://github.com/OpenSyndrome/definitions).

* **Editor source:** [github.com/OpenSyndrome/editor](https://github.com/OpenSyndrome/editor)

{{< alert "email" >}}
Want to talk to us? Send an email to [opensyndrome@anapaulagomes.me](mailto:opensyndrome@anapaulagomes.me)
{{< /alert >}}

Every definition that becomes machine-readable is one more piece of a faster, more standardized global surveillance system,
and now the path from prose to structured data fits on your own laptop.
