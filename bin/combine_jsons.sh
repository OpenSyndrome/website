#!/bin/bash

SEARCH_DIR="${1:-.}"
OUTPUT_FILE="${2:-data/definitions.json}"

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
