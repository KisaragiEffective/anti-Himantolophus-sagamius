#!/bin/bash
out_dir="$(dirname "$0")/../intermediate"
target="$out_dir/urls_by_shopname.txt"

effective_declaration_file="$out_dir/urls.txt.actual.txt"
sed '/^#/d' < "$(dirname "$0")/../urls.txt" > "$effective_declaration_file"

cache_file="$out_dir/urls.txt.sha512sum"
cached_hash="$(sed -n 2p "$cache_file")"
actual_hash="$(sha512sum "$effective_declaration_file")"

echo "actual: $actual_hash"
echo "cached: $cached_hash"

if [[ -z "$NO_CACHE" && -f "$cache_file" && "$actual_hash" == "$cached_hash" ]]; then
  echo "[resolve:shop-name]: cached!"
  exit 0
fi

echo '# AUTO GENERATED: URLs by shop subdomain' > "$target"
while IFS= read -r url; do
  item_number="$(echo "$url" | awk -F/ '{print $NF}')"
  echo "process: $url -> $item_number"
  curl -H 'User-Agent: KisaragiEffective/anti-himantolophus-sagamius/1.0' "$url" \
  | pup 'a[data-product-list*=shop_index] attr{href}' \
  | uniq \
  | awk -v num="$item_number" '{ print $0 "items/" num }' >> "$target"
# readコマンドの直後に出力リダイレクトを置くと死ぬ。知るかよ！
done < "$effective_declaration_file"

{
  echo '# AUTO-GENERATED. DO NOT MODIFY THIS HASH.'
  echo "$actual_hash"
} > "$cache_file"
