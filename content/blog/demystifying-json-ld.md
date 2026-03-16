---
title: "Demystifying JSON-LD: Giving Your Case Definitions Global Meaning"
date: 2026-03-16
---

If you work in public health informatics or disease surveillance, you already know the central struggle of our field: 
everyone speaks a slightly different language. You might call a field `disease`, another system calls it `condition`, 
and a third calls it `target_threat`. When we try to share case definitions across borders or software systems, 
computers get confused, and humans have to spend hours manually mapping data.

At the Open Syndrome Initiative, we use standard JSON to structure our definitions. But to truly solve this communication barrier,
we need a way to tell every computer in the world exactly what our JSON fields mean.

> Enter **JSON-LD**

If you have never heard of [JSON-LD](https://json-ld.org/), do not worry. It stands for *JavaScript Object Notation for Linked Data*.
In plain English, it acts as a universal dictionary for your data. It takes your local, simple terms and links them to global standards so
that there is zero ambiguity about what you mean.

Let's look at how this works in practice using a real-world example from the [European Centre for Disease Prevention and Control (ECDC)](https://www.ecdc.europa.eu/en/all-topics/eu-case-definitions).

### The ECDC Tuberculosis Use Case

Imagine we want to digitize the official ECDC clinical criteria for Tuberculosis. The human-readable definition looks like this:

> **Any person with the following two:**
> — Signs, symptoms and/or radiological findings consistent with active tuberculosis in any site
> **AND**
> — A clinician's decision to treat the person with a full course of anti-tuberculosis therapy
> **OR**
> A case discovered post-mortem with pathological findings consistent with active tuberculosis that would have indicated anti-tuberculosis antibiotic treatment had the patient been diagnosed before dying.

If we write this into a standard Open Syndrome JSON file, we will create fields like `target_public_health_threats`, `organization`, and `inclusion_criteria` to capture this logic.
But a computer parsing this file doesn't inherently know what those fields actually represent in the real world.

For example, when a basic JSON file lists `"target_public_health_threats": ["Tuberculosis"]`, a computer just sees a string of twelve letters.
It has absolutely no idea that those letters refer to the specific, real-world infectious disease caused by the _Mycobacterium tuberculosis_ bacteria.
If a partner organization spells it "TB" or "Tubercolosis" (a typo), the computer assumes they are entirely different things.

### Adding the Universal Dictionary

To fix this, we drop a single line of JSON-LD at the very top of our file: the `@context`.

The `@context` points to a URL (like https://opensyndrome.org/context.jsonld) that holds the translation key.
When a computer reads your file, it first reads the context. The context tells the computer, 
_"Hey, when this file uses the field target_public_health_threats, it isn't just a random text box—it maps directly to a globally_ 
_recognized medical disease ontology. And when you see a diagnostic code, expect a standard clinical URI."_

Here is what a simplified version of that ECDC Tuberculosis definition looks like when empowered by JSON-LD:

```json

```

### Why This is a Game Changer

Notice a few things in the payload above. First, the `@context` at the top does all the heavy lifting behind the scenes. You don't have to clutter your file with complex 
web addresses for every single word; you just write your standard fields, and the background dictionary links your "twelve letters" to the exact biological concept of Tuberculosis.

Second, look at the post-mortem criteria. Instead of just writing "SNOMED", we use the official standard URI: http://snomed.info/sct. Because our `@context` understands linked data, 
it knows exactly how to read and validate that specific medical terminology.

By using JSON-LD, you aren't just writing a script for one specific surveillance software. You are publishing a globally interoperable artifact.
A system in Germany, a database in Brazil, and a dashboard at the CDC can all ingest this exact file, instantly understand the ECDC's clinical logic, 
and know the precise medical concepts to look for.

References:

* https://bioschemas.org/tutorials/community/rd
