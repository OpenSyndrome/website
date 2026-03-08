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

SCHEMA_BASE_URL="https://raw.githubusercontent.com/OpenSyndrome/schema/refs/heads/main/schemas"
SCHEMA_VERSIONS=("v1")

echo "Downloading schema..."

# latest.json → /schema.json
if curl -sf "$SCHEMA_BASE_URL/latest.json" -o "static/schema.json"; then
    echo "Schema saved to static/schema.json"
else
    echo "Warning: could not download latest.json. Skipping."
fi

# versioned schemas → /schema/<version>/schema.json
for VERSION in "${SCHEMA_VERSIONS[@]}"; do
    mkdir -p "static/schema/$VERSION"
    if curl -sf "$SCHEMA_BASE_URL/$VERSION/schema.json" -o "static/schema/$VERSION/schema.json"; then
        echo "Schema saved to static/schema/$VERSION/schema.json"
    else
        echo "Warning: could not download $VERSION/schema.json. Skipping."
    fi
done

# --- JSON-LD Context ---

echo "Downloading JSON-LD context..."

# latest context → /context.jsonld
if curl -sf "$SCHEMA_BASE_URL/context.jsonld" -o "static/context.jsonld"; then
    echo "Context saved to static/context.jsonld"
else
    echo "Warning: could not download context.jsonld. Skipping."
fi

# versioned contexts → /schema/<version>/context.jsonld
for VERSION in "${SCHEMA_VERSIONS[@]}"; do
    mkdir -p "static/schema/$VERSION"
    if curl -sf "$SCHEMA_BASE_URL/$VERSION/context.jsonld" -o "static/schema/$VERSION/context.jsonld"; then
        echo "Context saved to static/schema/$VERSION/context.jsonld"
    else
        echo "Warning: could not download $VERSION/context.jsonld. Skipping."
    fi
done
