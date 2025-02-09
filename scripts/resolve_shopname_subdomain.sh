#!/bin/bash
user_agent='User-Agent: KisaragiEffective/anti-himantolophus-sagamius/1.0'
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

old_target="$(mktemp)"
cp "$target" "$old_target"
echo '# AUTO GENERATED: URLs by shop subdomain' > "$target"
new_target_appending_buffer="$(mktemp)"
matched_line_buffer="$(mktemp)"

while IFS= read -r url; do
  item_number="$(echo "$url" | awk -F/ '{print $NF}')"
  echo "process: $url -> $item_number"

  if grep -m1 -E "${item_number}\$" < "$old_target" > "$matched_line_buffer"; then
    echo "partially cached."
    cat "$matched_line_buffer" >> "$new_target_appending_buffer"
    continue
  fi

  status_code="$(curl -s -o /dev/null --head -w '%{http_code}' -H "$user_agent" "$url")"
  if [[ "$status_code" == "404" ]]; then
    echo "404"
    grep -E "${item_number}\$" < "$old_target" >> "$new_target_appending_buffer"
  else
    echo "continue"
    curl -H "$user_agent" "$url" \
      | pup 'a[data-product-list*=shop_index] attr{href}' \
      | uniq \
      | awk -v num="$item_number" '{ print $0 "items/" num }' >> "$new_target_appending_buffer"
  fi

  sleep 0.5
# readコマンドの直後に出力リダイレクトを置くと死ぬ。知るかよ！
done < "$effective_declaration_file"

uniq < "$new_target_appending_buffer" >> "$target"
rm "$new_target_appending_buffer"
rm "$matched_line_buffer"
rm "$old_target"

{
  echo '# AUTO-GENERATED. DO NOT MODIFY THIS HASH.'
  echo "$actual_hash"
} > "$cache_file"
