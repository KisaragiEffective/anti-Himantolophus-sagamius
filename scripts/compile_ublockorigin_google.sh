#!/bin/bash

if ! which git >/dev/null; then
  echo "git is required" >&2
  exit 1
fi

out_dir="$(dirname "$0")/../dist/booth"
dist="$out_dir/ublockorigin_google.txt"
intermediate="$(dirname "$0")/../intermediate"

exclude_entry_compiler compile \
  --target uBlockOrigin \
  -i "$intermediate/intermediate.json" \
  -o "$dist" \
  --feature-flag GoogleSearchPrefix \
  -h "SPDX-License-Identifier=CC0-1.0" \
  -h "Generated-Date=$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
  -h "Git-Commit=$(git rev-parse HEAD)" \
  -h "Git-Repository=https://github.com/KisaragiEffective/anti-Himantolophus-sagamius" \
