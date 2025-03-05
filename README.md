# anti Himantolophus sagamius

## 収録基準
以下のうち、いずれか1つ以上に当てはまるBOOTHのアイテムページを格納する。

1. 他の商品に対する言及を何らかの外的フィードによって露出させる以上の価値を持たない
2. パスワード付きZIPなど、アクセス制限がかけられているため利用することのできる人が限られる

当てはまらなくなった場合は削除されることもあり得る。

## インストール

### uBlock Origin
BOOTHの検索結果から消したい場合はこちらがおすすめです。

1. ブラウザにuBlock Originをインストールする
2. 拡張機能のアイコンをクリックしてダッシュボードを開く
3. タブリストから「マイフィルター」を選択する
4. 「マイカスタムフィルターを有効化」にチェックする
5. 指定のURLを入力する

* https://raw.githubusercontent.com/KisaragiEffective/anti-Himantolophus-sagamius/refs/heads/live/dist/booth/ublockorigin_booth_search.txt

### uBlacklist
Googleの検索結果から消したい場合はこちらがおすすめです。

https://dev.classmethod.jp/articles/deny-devio-using-ublacklist/

を見てください。指定URLは

* https://github.com/KisaragiEffective/anti-Himantolophus-sagamius/blob/live/dist/booth/ublacklist.txt

です。

## How to edit listing

1. `cargo install --git https://github.com/KisaragiEffective/exclude_entry_compiler/`
2. https://github.com/EricChiang/pup をパスが通っているディレクトリに展開
3. `urls.txt` を編集する。`#` から始まる行はコメント。
4. `./scripts/all.sh` を実行する
5. make PR

## How to file report

Go to https://github.com/KisaragiEffective/anti-Himantolophus-sagamius/issues/new
