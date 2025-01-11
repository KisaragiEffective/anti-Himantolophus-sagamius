#!/bin/bash
out_dir="$(dirname "$0")/../intermediate"
target="$out_dir/urls_by_shopname.txt"
rm "$target" 2>/dev/null || true
echo '# AUTO GENERATED: URLs by shop subdomain'

sed '/^#/d' < "$(dirname "$0")/../urls.txt" | while IFS= read -r url; do
  item_number="$(echo "$url" | awk -F/ '{print $NF}')"
  echo "process: $url -> $item_number"
  curl -H 'User-Agent: KisaragiEffective/anti-himantolophus-sagamius/1.0' "$url" \
  | pup 'a[data-product-list*=shop_index] attr{href}' \
  | uniq \
  | awk -v num="$item_number" '{ print $0 "items/" num }' >> "$target"
done
