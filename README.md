# anti Himantolophus sagamius

## 収録基準
以下のうち、いずれか1つ以上に当てはまるBOOTHの商品ページを格納する。

1. 他の商品に対する言及を何らかの外的フィードによって露出させる以上の価値を持たない商品ページ
2. パスワードが利用規約と矛盾しない方法で公開できないため誰でも利用することができるわけではない商品ページ

当てはまらなくなった場合は削除されることもあり得る。

## How to contribute

1. `cargo install --git https://github.com/KisaragiEffective/exclude_entry_compiler/`
2. https://github.com/EricChiang/pup をパスが通っているディレクトリに展開
3. `urls.txt` を編集する。`#` から始まる行はコメント。
4. `./scripts/all.sh` を実行する
5. make PR
