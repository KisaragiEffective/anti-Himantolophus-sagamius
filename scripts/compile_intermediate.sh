#!/bin/bash
out_dir="$(dirname "$0")/../intermediate"

cat "$(dirname "$0")/../urls.txt" "$out_dir/urls_by_shopname.txt" \
| sed '/^#/d' \
| jq -R '{type: "path", match: "literal", path: .}' \
| jq -s > "$out_dir/intermediate.json"
