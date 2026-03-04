#!/bin/bash
set -e

# --- Definitions ---

rm -rf data/definitions
mkdir -p data/definitions

curl -L https://github.com/OpenSyndrome/definitions/archive/refs/heads/main.zip -o definitions.zip
unzip definitions.zip
mv definitions-main/definitions/v1 data/definitions
rm -rf definitions.zip definitions-main

echo "Definitions downloaded..."

SEARCH_DIR="data/definitions/"
OUTPUT_FILE="${2:-data/definitions_v1.json}"

if ! command -v jq &> /dev/null; then
    echo "Error: jq is not installed."
    exit 1
fi

echo "[" > "$OUTPUT_FILE"

first_file=true
find "$SEARCH_DIR" -type f -name "*.json" | while read -r json_file; do
    content=$(jq -c '.' "$json_file")

    if [ $? -ne 0 ]; then
        echo "Warning: $json_file is not a valid JSON file. Skipping."
        continue
    fi

    if [ "$first_file" = true ]; then
        first_file=false
    else
        echo "," >> "$OUTPUT_FILE"
    fi

    echo -n "$content" >> "$OUTPUT_FILE"
done

echo "" >> "$OUTPUT_FILE"  # ensure we're on a new line
echo "]" >> "$OUTPUT_FILE"

echo "Combined JSON files: $OUTPUT_FILE"

# --- Schema ---

SCHEMA_URL="https://raw.githubusercontent.com/OpenSyndrome/schema/refs/heads/main/schemas/latest.json"
SCHEMA_OUT="static/schema.json"

echo "Downloading schema..."
if curl -sf "$SCHEMA_URL" -o "$SCHEMA_OUT"; then
    echo "Schema saved to $SCHEMA_OUT"
else
    echo "Warning: could not download schema from $SCHEMA_URL. Skipping."
fi

# --- JSON-LD Context ---

CONTEXT_URL="https://raw.githubusercontent.com/OpenSyndrome/schema/refs/heads/main/schemas/context.jsonld"
CONTEXT_OUT="static/context.jsonld"

echo "Downloading JSON-LD context..."
if curl -sf "$CONTEXT_URL" -o "$CONTEXT_OUT"; then
    echo "Context saved to $CONTEXT_OUT"
else
    echo "Warning: could not download context.jsonld from $CONTEXT_URL. Skipping."
fi
