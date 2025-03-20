#!/bin/bash
intermediate_file="$(dirname "$0")/../intermediate/urls_by_shopname.txt"
sed -E '/^#/d' < "$intermediate_file" | cut -f3 -d/ | sort | uniq -c | sort -nrk 1,1
