# README
## 概要
下記を理解するための勉学アプリ
#### アクション
- index ・・・ 一覧表示ページを表示
- new ・・・ 新規投稿ページを表示
- create ・・・ データの投稿
- show ・・・ 個別詳細ページを表示
- edit ・・・ 投稿編集ページを表示
- update ・・・ データの編集
- destroy ・・・ データの削除

#### httpメゾット
- GET ・・・ ページを表示
- POST ・・・ データを登録
- PATCH ・・・ データを変更
- DELETE ・・・ データを削除

## 手順
#### 1. アプリ作成
```
rails _5.2.3_ new note-app -d mysql
```
#### 2.bundlerをインストール
```
bundle install
```
bundler・・・gem管理してくれる
#### 3.データベース作成
```
rails db:create
```
#### 4.コントローラー作成
```
rails g controller notes
```
複数形に注意
#### 5.メイン表示ページ指定
routes.rb
```
root to: 'notes#index'
```

サーバー立ち上げ
```
rails s
```
#### 6.使用する"gem"導入
```
gem 'haml-rails'  //haml変換
gem 'pry-rails'   //デバックツール
```

デバック ・・・ binding.pry
HAML変換
```
rails haml:erb2haml
```
#### 7.stylesheets変更
```
application.css を application.scss に変更
```

@import で読み込む
```
@import "posts";
@import "reset";
```
読み込み先ファイル
```
ex)
_posts.scss
```
#### 8.コントローラー
```
def index
  @note = Note.all
end
```
#### 9.モデル作成
```
rails g model note
```
単数系に注意
#### 10.マイグレーション
マーグレーションファイルが作成されたので変更を加える
```
class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.text :title
      t.text :content
      t.timestamps
    end
  end
end
```

変更更新
```
rails db:migrate
```

データベースの中に確認方法
```
rails db:status
```
こんな感じに表示される
```
 Status   Migration ID    Migration Name
--------------------------------------------------
   up     20190820071210  Create notes
```

ファイル修正したいとき
```
rails db:rolback
```
こんな感じに表示される
```
 Status   Migration ID    Migration Name
--------------------------------------------------
   down     20190820071210  Create notes
```
これで修正できる

修正後
```
rails db:migrate
```

上記の追加、変更はデータベース内の情報がリセットされる

カラム追加方法

キャメルケース
```
rails g migration AddContentToNotes content:text
```
スネークケース
```
rails g migration add_content_to_notes content:text
```
上記二つとも"notesテーブル"に"content"を"text型"で追加する方法

カラム削除方法
```
rails g migration RemoveContentFromNotes content:text
```

マイグレーションファイル削除方法
```
rm -rf db/migrate/20200826020322_remove_nickname_from_notes.rb
```

#### 11. ビュー作成
#### 12. ルーティング
```
  resources :notes
```
resources :notes, only: [:index, :new, :create, :edit, :update :show, :destroy]の省略系

only ・・・ アクション指定
except ・・・ アクション除外
```
ex)
resources :posts, except: :index

indexのみ除外、つまりindex以外のアクションを使用する
```
アクション確認方法
```
rails routes
```

Prefixパス

```
rails routes で確認

ex)
.link
  = link_to "新規投稿", new_note_path 
  = link_to "削除", note_path(note.id), method: :delete
  = link_to "変更", edit_note_path(note.id)
```
#### 13.一覧表示
"each"全表示
```
- @note.each do |note|
  .note
    .note-date
      投稿日時 : #{note.created_at}
    .note-content
      = note.content
    .delete
      = link_to "削除", note_path(note.id), method: :delete
    .edit
      = link_to "変更", edit_note_path(note.id)
```

#### 14.フォーム作成(form_for)
```
= form_for @notes do |f|
  = f.text_field :content
  = f.submit '投稿する',class: 'send'
```
## 簡易gif
機能理解のためCSSは必要最低限の実装
![画面収録 2020-08-26 13 54 07 mov](https://user-images.githubusercontent.com/61724976/91256993-c2aca000-e7a3-11ea-90a1-c6d53f2c9013.gif)

## 開発環境
- Ruby / Ruby on Rails / GitHub / VSCode / MySQL

## データベース
## notesテーブル
|Column|Type|Options|
|------|----|-------|
|content|text|
