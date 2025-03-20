#!/bin/bash
json="$(gh issue list -l 'approved' --json 'title,number')"
count="$(echo "$json" | jq 'length')"
echo "URLs: "
echo "$json" | jq -r '.[].title' | sort -nrk1,1

echo "------------"
echo "commit message: "
echo "update: add ${count} URLs"
closing_keywords="$(echo "$json" | jq -r '.[].number | ("close KisaragiEffective#" + (. | tostring))')"
echo
echo "$closing_keywords"
echo "------------"
