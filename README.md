# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...





手順
rails _5.2.3_ new note-app -d mysql
bundle install
rails db:create

rails g controller notes

  root to: 'notes#index'

index	一覧表示ページを表示するリクエストに対応して動く
new	新規投稿ページを表示するリクエストに対応して動く
create	データの投稿を行うリクエストに対応して動く
show	個別詳細ページを表示するリクエストに対応して動く
edit	投稿編集ページを表示するリクエストに対応して動く
update	データの編集を行うリクエストに対応して動く
destroy	データの削除を行うリクエストに対応して動く

コントローラー記述



rails g model note

マイグレーションファイル変更

カラム型
integer	数字	金額、回数など
string	文字(短文)	ユーザー名、メールアドレスなど
text	文字(長文)	投稿文など
boolean	真か偽か	はい・いいえの選択肢など
datetime	日付と時刻	作成日時、更新日時など

rails db:migrate


GET	ページを表示する操作のみを行う時
POST	データを登録する操作をする時
PUT	データを変更する操作をする時
DELETE	データを削除する操作を行う時