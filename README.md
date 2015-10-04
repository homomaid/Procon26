## Usage
$ coffee Server.coffee (option)

- option
    - -p, --port: 解放するポート番号を指定する。指定しない場合、40000 番ポートが解放される。
    - -V, --version: このプログラムのバージョンを表示する。
    - -h, --help: usage 情報を表示する。

## API
- POST /answer
    - パラメタ
        - ans: 競技サーバに送信する回答データ
        - score: 回答データのスコア
    - 返り値
        - isBestscore: 送信したデータが、現状の最良得点であるかの真偽値
        - passOneSecond: 送信したデータが、実際に競技サーバに送信されるまでの待ち時間
- GET /bestscore
    - パラメタ
        - なし
    - 返り値
        - bestscore: 本サーバが記録している現状の最良得点

## 仕様書 from @jprekz
- 問題の受信は, 競技サーバーから直接DLする
    - かのんサーバーは関係ない

- 回答の送信は, かのんサーバーを通じて行う
    - 1秒のインターバルが必要なため
    - rekz&とまマシンから, 回答データとそのスコアがかのんサーバーにPOSTされる。
    - かのんサーバーは, その回答を採用するか(ハイスコアであるか)どうかと残りの待ち時間を即座に返答する。
    - かのんサーバー内では, その時点でのハイスコアとなる回答を保持する。前回の提出から一秒過ぎ次第提出する。
    - (rekz&とまマシンが自己申告したスコアと, 競技サーバーから返ってきたスコアとが食い違っていた場合は警告を表示するといいかも。
        そんなことはないと思うが)

- かのんサーバー内では, その時点でのハイスコアも保持する。rekz&とまマシンから常にGETできる(探索に有効活用)

- かの鯖APIまとめ
    - POST /answer (回答データ, スコア)
        - return (ハイスコアかどうか, 残り待ち時間)
    - GET /hiscore ()
        - return (ハイスコア)
