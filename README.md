# ご当地あるあるったー（仮名）

## サービス概要
出身地や住んでいる地域の、あるある・エピソードを投稿できるサービス。<br>
投稿の際に都道府県と市区町村を指定する。<br>
トップ画面には新着投稿一覧があり、地域で絞り込んで投稿を見ることもできる。<br>

## このサービスへの思い・作りたい理由
自分は北海道稚内市という日本の最北端出身です。北海道はかなり広く、同じ道出身でも特色はかなり違ってきます。<br>
都道府県あるあるはよくありますが、市区町村のあるあるを知りたいという思いと、地元が近い人と交流ができたらいいな、という思いからサービスを考えました。

## ユーザー層について
ゆるいSNSで交流したい人。<br>
既存のSNSでは個としての発信力依存となり、それに疲れてしまう人もいる。<br>
ご当地あるあるったー（仮名）なら、最初から地域というグループに所属している状態かつ普遍的なテーマなので、投稿しやすい。

## サービスの利用イメージ
- 様々な地域のあるあるエピソードが見られる。
- 地域が近い人同士で共感でき、コメントなどで交流できる。
- 現実で人に出身地を聞いたとき、その地域の投稿一覧を見ることで話の種になる。
- 投稿を見ることで引越し先や旅行先の雰囲気を感じることができる。

## ユーザーの獲得について
X(旧Twitter)で投稿を共有できるようにして、導線を増やす。
## サービスの差別化ポイント・推しポイント
既存のSNSだと特定のおそれもあり地域の話はしにくいが、地域の話のみ投稿のサービスなので気兼ねなく住んでいる場所の話ができる。
## 使用技術一覧
- 開発環境: Docker
- サーバサイド: Ruby on Rails 7系
<br>Ruby 3.2.2 Rails 7.1.3
- フロントエンド: HotWire
- CSSフレームワーク: bootstrap5系
- WebAPI: [GeolocationAPI](https://developers.google.com/maps/documentation/geolocation/overview?hl=ja)、[都道府県一覧API](https://opendata.resas-portal.go.jp/docs/api/v1/prefectures.html)、[市区町村一覧API](https://opendata.resas-portal.go.jp/docs/api/v1/cities.html)
#### インフラ:
- Webアプリケーションサーバ: Heroku
- データベースサーバ: PostgresSQL

## 機能候補
#### MVPリリース
- ユーザー登録
- ログイン(sorcery)
- マイページ
- ユーザー情報の変更機能（ユーザー名、メールアドレス、パスワード、地域、アイコン）
- あるあるの投稿機能、投稿の削除機能
- 選択肢から都道府県・市区町村を指定して投稿する機能
- 都道府県・市区町村を指定して検索(ransack)
- トップ画面に新着一覧
- 投稿にコメント(Ajax)
- 画像アップデート(ActiveStorage)
- 「このアプリについて」ページ
#### 本リリース
- adminユーザーの投稿管理
- 位置情報で投稿地域指定(geolocation)
- いいね（あるある！）ボタン(Ajax)
- 通知機能
- パンくずリスト(gretel)
- シームレススクロール(Ajax)
- ページネーション機能(kaminari)
- 既存サービスでログイン
- 共有ボタン(X等)
- 退会機能

## 追加サービス案
- 地域検索のオートコンプリート
- タグ機能
- 通報・ブロック機能
- トップ画面に投稿があった地域の色が濃くなる日本地図を設置
- プロフィールに設定したエリアの新着投稿のトップ画面表示

## 画面遷移図
[Figma](https://www.figma.com/file/C6nwG8Amj8UWj3kLeZvxkx/%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3?type=design&node-id=0%3A1&mode=design&t=Ohwb7qEoPWtmLxvC-1)

## ER図
[draw.io](https://viewer.diagrams.net/?tags=%7B%7D&highlight=0000ff&edit=_blank&layers=1&nav=1&title=portfolio.drawio#R7V1tb9o6FP41%2FbgpbwT4eGHtrnQ7qep2te1T5REXvBtilJgB%2B%2FXXJnZCMGkCpTHjWKqq2DhO4vMcP7bP8fGNP56vP6ZoMftEIxzfeE60vvE%2F3Hhe0Hf5f5GxyTOG3jDPmKYkyrPcMuMz%2BY1lpiNzlyTCWaUgozRmZFHNnNAkwRNWyUNpSlfVYs80rj51gabyiU6Z8XmCYqwV%2B0oiNstzB16%2FzP8bk%2BlMPdkN5ffNkSosK85mKKKrnSz%2F9sYfp5Sy%2FGq%2BHuNYtJ1ql%2Fy%2Bu5pfixdLccLa3PDVm9xt7u6%2F%2FoeS28Vs%2BNMZvJu%2Bcx1Pvh3bqE%2FGEW8BmaQpm9EpTVB8W%2BaOUrpMIizqdXiqLHNP6YJnujzzJ2ZsI8WJlozyrBmbx%2FJXvCbsm7j9fU%2BmvsvKxPWH9W5ioxIJSzffdhPfyxpEsrxtm1L3ZQyl7C8BBZ5x%2B0gTrDLvSBwXt0Rlkd84pV%2FoJ5Rs8l92yuWNJVqoVgoyK6PLdIJfanqJZpROMXuh3NAvwMKVDNM55l%2FHb0xxjBj5VX0RJOE%2BLcqViOAXEhTHACSv9xeKl%2FJJ%2F2Y4zTTQcHQvxCVDP%2BKigaX8fdFyXEEZIglOJQQmNI7RIiPb4nnOjMTRPdrQJVMVqdTomaxx9Jhrs7tF4OqeV5ZJsTzzyhVkxc8oJtOEX0%2B4VMQTRynO%2BLvco4zJEjtglF%2BIU4bXL0tVF4K6wZVaL3s535HpVdlnuAPZEcx2%2Bgvfcd5IcJ4muJdl9ijAP5rRlPwWklKA35XjNr0i8xglvNND0V7WiEZK5565xoxpTIWwk1zjqvIWhaKULr4o9IuMBSUJ27ZDb8T%2FeMuMhXr3%2BLuOedot0%2FxPFE%2FZmCYZSzmuRB2Yi3eFhYhHbNsRiUpj%2FKzqT2W7i%2BsflDE6PwYB9eqhw6KAQVsUvBEIfA0ED%2F%2FUwoB%2FLCMofuQ0ipJpnAtty6qoFNoByR5s66J99xt%2BX1Upb%2FbneNvzzkgUYa62o9WMMPx5gbb954qPK05Q2Hql0MW1Ix%2F%2FSPHIyspGO7o2FPMuKkGM6w9n1UyTefGep8Mg0GCw5J34e36PWSyobjovO8q4xEkyvc%2FvDPfA0rsQsKzrdbt3VvC0qq4D9PQsk7RiEudVaHuZSULTTBK2B0E3fQeOiKqvcxrpwaSRvoaBBM3xpXPIJSADHGd4vuWIrjliaJojvAAwJ3g1yzTXTgqePjxEvxDXY8sLLdABjhgGdjJhnChczzRTDO1sYk8l4BGHsvDtgADPEYktbzRjAxxtFEZUSxPd0UTPNE0UtlSItLDjJACKF9RYYIcXFijLVjSNniIyFRpiGaIZJuAowtVdFSxndM4ZA9Oc4erdx51pm7dJGnFrBHbtNOLqvg%2BLFD%2Fzd16m%2BOnyTd8XARJ4JFK%2FhG054404o%2FD1NccZ%2Bho2bM4IgHKG7uUwIWxj2aIdPOCxRd%2ByRedsERhniwFkaugDpQbdZDVJMX9k9ITsglQbhIBjBy%2B07NA5O%2FRNs4NXPya4fnbIIQ%2BPHTzdrWW5iCw7tEcIPHbQBxQPNGN2Z2UVEEEgVavo4FvurCzmCeffVKc7rliiP%2F%2FWylxBapne%2FN5K3d4Ie3OlD9Rhwdctjgvek9vtlafBBdxIwNctlZZPzj9xbOAT4zssfX2XNmgjlA90Q42vGyPFbn1rhGoHD3D00bcuC92zhfG9ln3rsnBAC%2BCxRV93WbBubseCBBxn%2BEeE87Ak8lYkYn4fpq%2BH9ADNIj5Q%2B5Wv26%2Bs41t7eIDjj4F1bTBAF8b3Yw4g%2BzYMgHLDQOcGYd54InMROtvSQzNCwNFDYGcTBujB%2BNbLoD7o2%2FXTQ455ePQQ6GYr4ZAkGstyQzM84HFDz3JD59xgfotlUD9jBMANQAMGB%2Fryot00cxRCwNHDQLdmd3gekbrOTxby1OFEDQcSuTdXcSCR8rRuPJGozozWzYlEgb4e8VBYPK37%2FL77fPVgotBpORAYvtlA4IjYn6AHhK8klJrIkZfiPa%2FoxnrPV%2FQC3hixp2%2BjKB1YrA%2F9aaABN2zseZZVOlhmaGAV4z70vSO2Ulz%2FskMP6JJ0T1%2BStgcVtcQGOOYI9fHHmDBiZ5INM8l%2B286%2B8HI8%2F5l0lvS7mEqGF37IbWhPuT2kF%2FB4PzxgiiZsYyeRp8EF3lDAnnTbxSSygU%2BMTyJDfXMM6E0RIVDrdahbr%2B3WumNBAo9E7AmHF0Aixvdnh%2FaIQ00p4FGIikZqVyKPxwY45ujrccWNuT619HwqEn%2B255Psmhsdn%2BpiznTj%2BKQiX3aMjxNlXRFjLumq%2FPbAUJH0PibOKGt1TFyjsOts690IWw1W%2FoTO4EIFHbQUdN36V0eC1s84vVBBH997zw%2F126e6zZ4RGsqU1QyNmlltR9DQt8pcKDSuzRU6bD0iqNny2xog21v556HNTgE5Hy9rfhAZ5Zi471RtsQPZ1921LB9Uy%2FOL%2FA3O68mvz4DHdD7HiY1x3mBab2tRLTLP3vMM9XnryzKDuoj1yoABFx7ifGhDnB%2FSC3jrWENPA8Ik78utcf00xIBb3RraKOdd2EUaKMW4cX1oo5wfUAuAjGKjnL8GHvDow0asvQD6MG5WH9qAtQfUAiB91AUltPTRBh7w6MNGHbgA%2BjAf8NxV8S%2BsX1apFvDow3X0lU0btbA9PsDxh%2BvYiOcG%2BMJ4xHPXgRzyXKIeIj8cOBDDRi48CiMAOeLq%2FXXauuK08uvJG%2Bss%2FjpK2o3%2BOnUT4tc6dPFkSinbBRTXsdknGmFR4n8%3D)
