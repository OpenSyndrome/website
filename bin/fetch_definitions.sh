#!/bin/bash
set -e

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
