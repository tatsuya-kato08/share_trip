# Share Trip
### 旅行の内容、日程やルートを共有し旅行好き同士でコミュニケーションが行えるアプリケーション

# 概要
### アプリ一つで旅行計画から思い出の共有までできる

地図機能を駆使して複数の目的地へのルートを確認できる
旅行計画を保存し思い出として共有できる
共有された投稿にコメントを残し旅行について話せる
目的の旅行内容を見つければおすすめなどを聞くことができる
投稿された旅行の日程やルートを見本に旅行計画を立てられる

# App URL

# 利用方法

# 課題解決

| ユーザーストーリーから考える課題                                      | 課題解決                                         |
| ---------------------------------------------------------------- | ------------------------------------------------- |
| 旅行した内容を同じ趣味の方と共有もしくは語り合いたい                      | 投稿機能をつけて思い出を共有できるようにする。コメント機能をつけてコミュニケーションができるようにする |
| 休日に旅行を計画したいもしくは、とりあえずどこかに行きたい時に名所を探したい  | 投稿検索機能で投稿を検索できるようにする。また、曖昧検索も可能にする |
| 実際に旅行した日程やどんなルートで旅行したのかを知りたいという課題          | 旅行計画機能をつけて旅行計画機能で作成した旅行日程も共有可能にする |




# 機能一覧

1.ユーザー管理機能
 -新規登録
 -ログイン
 -ログアウト

1.投稿機能
 -画像付きで投稿可能
 -各投稿の詳細が詳細ページで閲覧可能
 -投稿者本人のみ投稿編集、削除が可能
 -投稿タイトルを曖昧検索可能
1.コメント機能
 -ログインしているユーザーは各投稿にコメント可能
 -コメントしたユーザー名が表示されること

1.地図機能
 -目的地の検索
 -目的地へのルート検索

1.旅行計画機能
 -目的地のお気に入り保存
 -目的地へのルートを表化


# README

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| family_name        | string | null: false               |
| first_name_kana    | string | null: false               |
| family_name_kana   | string | null: false               |
| birthday           | date   | null: false               |


### Association

- has_many :tweets
- has_many :comments
- has_many :plans
- has_many :user_maps
- has_many :maps, through: user_maps


## tweetsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| title   | string     | null: false                    |
| text    | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| plan    | references | null: false, foreign_key: true |


## Association

- belongs_to :user
- belongs_to :plan
- has_many :comments

## commentsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                    |
| tweet   | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |


## Association

- belongs_to :user
- belongs_to :tweet

## user_mapsテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| map        | references | null: false, foreign_key: true |


## Association

- belongs_to :user
- belongs_to :map


## mapsテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| place_name | string     | null: false                    |
| code       | string     | null: false                    |
| area_id    | integer    | null: false                    |
| city       | string     | null: false                    |
| number     | string     | null: false                    |
| phone      | string     | null: false                    |
| user       | references | null: false, foreign_key: true |



## Association

- has_many :user_maps
- has_many :users, through: user_maps
- has_many :plan_maps
- has_many :plans, through: plan_maps

## plansテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| route    | string     | null: false                    |
| schedule | datetime   | null: false                    |
| user     | references | null: false, foreign_key: true |



## Association

- belongs_to :tweet
- has_many :plan_maps
- has_many :maps, through: plan_maps

## plan_mapsテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| map      | references | null: false, foreign_key: true |
| plan     | references | null: false, foreign_key: true |



## Association

- belongs_to :map
- belongs_to :plan