# README

## アプリケーション名
EducationLog

## アプリケーション概要
このアプリケーションでは、授業内容に関する投稿を行うことができます。投稿にはワード、エクセル、パワーポイントなどのファイルを添付することが可能です。
それぞれの投稿は公開と非公開を切り替えることができ、公開ページはユーザー登録なしでアクセスすることができます。非公開ページはログインしたユーザーの投稿のみが表示されます。


## URL
[デプロイ済みのURL](https://original-app-37346.onrender.com)


## テスト用アカウント
mail:test1@test
pass:test11

mail:test2@test
pass:test22


## 利用方法
- ログインする
- 新規投稿ページへアクセスする
- 投稿を作成する
- 投稿の詳細確認、編集、削除ができる
- 投稿の公開と非公開を切り替えられる
- 生徒一覧が表示できる
- エクセルファイルを用いて生徒登録ができる
- 出欠一覧ページが表示できる
- フォームから出欠が登録できる
- 登録した出欠件数がカレンダーに表示される
- モーダルを表示すると出欠の詳細が確認できる

## アプリケーションを作成した背景
前職が高校の教員であったことから、学校で使えるアプリケーションを作りたいと考えました。前職では各職員の授業に関するノウハウが共有される場面が少なく、それぞれオリジナルの授業スタイルや資料を使用していました。そのため新規採用者や転任者は、その学校での授業に関する情報が少ないまま準備を進める必要がありました。結果として準備により多くの時間がかかることや、授業のペース・難易度が学校にマッチしていないという問題も生じていました。以上のような背景から授業の記録を蓄積できるアプリケーションを作成しようと考えました。


## 洗い出した要件
- 投稿できる
- 投稿の編集・削除ができる
- 投稿の詳細表示ができる
- 投稿の公開・非公開が切り替えられる
- エクセルファイルで生徒を登録できる
- 生徒情報の詳細表示・編集・削除ができる
- カレンダーに出欠情報を登録できる


## 実装した機能についての画像やGIFおよびその説明




## 実装予定の機能
- 教員用アカウントと生徒用アカウントで機能を分ける
- 投稿に対してAND検索・OR検索、タグ検索などの柔軟な検索方法追加する
- 出欠の一覧表示画面を作成する


## データベース設計

### users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| school             | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |


#### Association

- has_many :subjects
- has_many :students
- has_many :attendances


### subjects テーブル

| Column      | Type       | Options                        |
| ------------| ---------- | ------------------------------ |
| subject_id  | integer    | null: false                    |
| sub_subject | string     |                                |
| title       | string     | null: false                    |
| month_id    | integer    | null: false                    |
| grade_id    | integer    | null: false                    |
| name        | string     | null: false                    |
| content     | text       | null: false                    |
| user        | references | null: false, foreign_key: true |

#### Association

- belongs_to :user
- has_one :public


### publics テーブル

| Column  | Type       | Options                                     |
| ------- | ---------- | ------------------------------------------- |
| user    | references | null: false, foreign_key: true              |
| subject | references | null: false, foreign_key: true, unique: true|

#### Association

- belongs_to :subject


### students テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| grade        | integer    | null: false                    |
| class_number | integer    | null: false                    |
| number       | integer    | null: false                    |
| name         | string     | null: false                    |
| user         | references | null: false, foreign_key: true |

#### Association

- belongs_to :user
- has_many :attendances


### attendances テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| status     | string     | null: false                    |
| reason     | text       | null: false                    |
| start_time | datetime   | null: false                    |
| user       | references | null: false, foreign_key: true |
| student    | references | null: false, foreign_key: true |

#### Association

- belongs_to :user
- belongs_to :student


## 画面遷移図




## 開発環境




## ローカルでの動作方法



## 工夫したポイント


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
