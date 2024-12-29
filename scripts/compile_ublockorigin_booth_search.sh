#!/bin/bash

out_dir="$(dirname "$0")/../dist/booth"
dist="$out_dir/ublockorigin_booth_search.txt"
intermediate="$(dirname "$0")/../intermediate"

{
  echo "! SPDX-License-Identifier=CC0-1.0"
  echo "! Generated-Date=$(date -u +%Y-%m-%dT%H:%M:%SZ)"
  echo "! Git-Commit=$(git rev-parse HEAD)"
  echo "! Git-Repository=https://github.com/KisaragiEffective/anti-Himantolophus-sagamius"
  jq -r '.[].path' < "$intermediate/intermediate.json" | \
    awk -F / '{ print "booth.pm" "##" "[data-product-id=" "\"" $NF "\""  "]" }'
} > "$dist"
