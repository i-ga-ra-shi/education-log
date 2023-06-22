# アプリケーション名
EducationLog


# アプリケーション概要
このアプリケーションでは、授業内容に関する投稿を行うことができます。投稿にはワード、エクセル、パワーポイントなどのファイルを添付することが可能です。
それぞれの投稿は公開と非公開を切り替えることができ、公開ページはユーザー登録なしでアクセスすることができます。非公開ページはログインしたユーザーの投稿のみが表示されます。
次に、生徒情報の管理ができます。エクセルファイルをアップロードすることで簡単に生徒の登録ができます。生徒がこのアプリを使用して出欠登録をすることが出来ます。出欠はカレンダーに日付別に登録されます。登録された情報は自動で集計され、グラフが表示されます。


# URL
[デプロイ済みのURL](https://original-app-37346.onrender.com)


# テスト用アカウント
- Basic認証パスワード：37346
- Basic認証ID：original
- メールアドレス：test1@test
- パスワード：test11


# 利用方法

## 授業記録投稿
1. トップページから新規登録画面へ移動する。
2. ユーザーの新規登録を行う。
3. 投稿一覧画面のヘッダーから新規投稿をクリックし、新規投稿画面へ移動する。
4. 必要事項を入力し、投稿する。
5. 投稿一覧ページの公開・非公開ボタンで公開・非公開を切り替える。

## 生徒登録
1. ログイン後に、ヘッダーの生徒管理から生徒登録をクリックし、生徒登録ページに移動する。
2. 指定された.xlsxファイルをアップロードするか、手動で登録する。
3. 登録後は生徒一覧画面に遷移する。生徒情報の編集、削除ができる。

## 出欠登録
1. ログイン後のヘッダーにある生徒管理から出欠一覧をクリックし、出欠登録ページに移動する。
2. フォームに必要事項を入力し、出欠情報を登録する。この際、生徒IDはuserに紐づいているID出なければならない。
3. 登録された情報はカレンダーの中に表示される。カレンダーの中にある詳細ボタンをクリックすることでモーダルが開き、詳細を確認することができる。
4. 出欠一覧ページでは全ての出欠データがテーブルで表示される。テーブルのヘッダーをクリックするとクリックしたカラムを基準に並び替えができる。

# アプリケーションを作成した背景
前職が高校の教員であったことから、学校で使えるアプリケーションを作りたいと考えました。前職では各職員の授業に関するノウハウが共有される場面が少なく、それぞれオリジナルの授業スタイルや資料を使用していました。そのため新規採用者や転任者は、その学校での授業に関する情報が少ないまま準備を進める必要がありました。結果として準備により多くの時間がかかることや、授業のペース・難易度が学校にマッチしていないという問題も生じていました。以上のような背景から授業の記録を蓄積できるアプリケーションを作成しようと考えました。


# 洗い出した要件
[要件定義書](https://docs.google.com/spreadsheets/d/1WDx91GiIbm9DrCV2vsra8Bfkie5hStCdtP8Eq5gkndw/edit#gid=982722306)


# 実装した機能についての画像やGIFおよびその説明
- [授業記録の一覧が表示されている](https://i.gyazo.com/7a2be138151551e802403f2b3712ec3c.gif)


- [授業記録の新規投稿ができる](https://i.gyazo.com/0a5c541cfdc26618689e8f28fb07eb3b.gif)


- [授業記録の詳細が表示される](https://i.gyazo.com/453a332af5267fdcfd79307535ef128c.gif)


- [公開、非公開を切り替えられる](https://i.gyazo.com/da6f8b0f8ec4de06b51de637968411f5.gif)


- [授業記録の検索ができる](https://i.gyazo.com/99ad8b9539ecabb26dcf92e7799d23a0.gif)


- [Excelファイルをアップロードして生徒データを登録できる](https://i.gyazo.com/f6a8114e7b392ed9cd1147700b18d74c.gif)


- [カレンダーに出欠情報が登録され、グラフが表示されている](https://i.gyazo.com/fe672c415b5986018d6f0b74abc33ba4.gif)


- [カレンダーに出欠情報を登録できる](https://i.gyazo.com/44d5b7b2e98d655522902a68dde05455.gif)



# 実装予定の機能
- 学校アカウント、教員用アカウント、生徒用アカウントを分ける
- 投稿に対してAND検索・OR検索、タグ検索などの柔軟な検索方法追加する
- 出欠のデータに関して期間を限定したり、学年別に表示したりできるようにする
- 生徒の一括削除機能


# データベース設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| school             | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |


### Association

- has_many :subjects
- has_many :students
- has_many :attendances


## subjects テーブル

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

### Association

- belongs_to :user
- has_one :public


## publics テーブル

| Column  | Type       | Options                                     |
| ------- | ---------- | ------------------------------------------- |
| user    | references | null: false, foreign_key: true              |
| subject | references | null: false, foreign_key: true, unique: true|

### Association

- belongs_to :subject


## students テーブル

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


## attendances テーブル

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


# ER図
[![Image from Gyazo](https://i.gyazo.com/aaa48176476f33f223b20b91c32a4d1b.png)](https://gyazo.com/aaa48176476f33f223b20b91c32a4d1b)


# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/4efb1b1f378a4006424a63e3cf741a2c.png)](https://gyazo.com/4efb1b1f378a4006424a63e3cf741a2c)


# 開発環境
HTML / CSS / JavaScript / Ruby /Ruby on Rails / MySQL / Github / Visual Studio Code


# ローカルでの動作方法
以下のコマンドを順に実行

% git clone https://github.com/i-ga-ra-shi/education-log

% cd education-log

% bundle install

% yarn install



# 工夫したポイント
1. BootStrapを用いてビューを見やすくしたこと。
2. simple_calenderのビューを編集したこと。欠席や遅刻の件数を表示し、詳細はそれぞれの日付のモーダルに埋め込む形にした。
3. ユーザーが実際にアプリを使った時に便利だと感じてもらえるような機能を実装しようと試みました。ファイルをアップロードできること、エクセルファイルの読み込みができること、カレンダーに出欠登録ができることなどが、あれば便利ではないかと考えた機能です。
