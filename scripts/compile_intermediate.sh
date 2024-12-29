#!/bin/bash
out_dir="$(dirname "$0")/../intermediate"

sed '/^#/d' < "$(dirname "$0")/../urls.txt" | jq -R '{type: "path", match: "literal", path: .}' | jq -s > "$out_dir/intermediate.json"
