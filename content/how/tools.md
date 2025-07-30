---
title: "Tools 🛠️"
showDate: false
---

The Open Syndrome Definition Initiative provides a set of simple tools to make syndrome definitions
accessible in different formats. Whether you're a healthcare practitioner drafting definitions in
plain text or a developer integrating them into your systems, we've got you covered.

Our tooling was built on top of the `osi-python` package that works as a CLI
and a library. To install it, run:

```bash
pip install osi
```

## OSI CLI

The `osi` CLI is a command-line tool that allows you to convert case and syndrome definitions in
narrative format to JSON and back. It also provides a simple validation tool to check the syntax.
Let's explore its main features!

### From human to machine-readable form 🤖

You can pass a case definition to this option and get a formatted JSON out of it.
This can be done in two ways: 1) calling `osi convert` will open an interactive prompt where you can
paste the text, or 2) you can pass the text after the `--human-readable-definition` or `-hr` option.

```bash
osi convert --human-readable-definition "Fever, cough, and difficulty breathing for 3 days"
````

In case you want to try other Large Language Models (LLMs), you can use the `--model` option to specify it.
If you want to have it in other spoken languages, you can use the `--language` option to specify it.
The same applies to the **humanize** command.

{{< lead >}}
The JSON output is a starting point to be refined further.
{{< /lead >}}

You can pass the option `--edit` to open an interactive editor to refine it.

Run `osi convert --help` to see all options.

### Validate your JSON ✅

To validate your JSON file against the Open Syndrome Definition schema, you can use the `validate` command.
It will show you what is missing or if the JSON is valid.

If you have the schema in another location, use `--schema-file` to change the default location.

```bash
osi validate dengue_brazil.json
```

### From machine to human-readable form 📖

Now that you have a JSON file, you can convert it back to a human-readable format using the `humanize` command.
This command will take the JSON file and output a narrative description of the syndrome or case definition.
You can also choose the model and language for the output.

```bash
osi humanize measles_who.json
```

Run `osi humanize --help` to see all options.

## Other JSON tools

* [ajv](https://github.com/ajv-validator/ajv): we use `ajv` combined with [ajv-formats](https://github.com/ajv-validator/ajv-formats) in our automated workflows to validate the schemas and make sure they have the correct format.
* [jsoncrack](https://jsoncrack.com/editor): tools like JSON Crack allow you to visualize the hierarchy of your JSON, which is useful when you are taking advantage of the nested structure or debugging.
* [JSON Lint](https://jsonlint.com/): if you are looking for a simple interface to show if your JSON is valid or not, this is the one you're looking for!
