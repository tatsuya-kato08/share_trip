# Share Trip
### 旅行の内容、日程やルートを共有し旅行好き同士でコミュニケーションが行えるアプリケーション
![image](https://user-images.githubusercontent.com/78143445/112260666-b511b700-8cad-11eb-850f-7b9ade2367a1.png)

# 概要
### アプリ一つで旅行計画から思い出の共有までできる

地図機能を駆使して複数の目的地へのルートを確認できる
共有された投稿にコメントを残し旅行について話せる
目的の旅行内容を見つければおすすめなどを聞くことができる
投稿された旅行の日程やルートを見本に旅行計画を立てられる

# App URL
### ログイン可能ユーザー
#### email: test@test.com
#### pass : testtest34443
https://share-trip-34443.herokuapp.com

# 利用方法
#### ` トップページから右上の新規登録・ログインをクリック`
#### ` 一覧画面へ遷移する`
#### ` 新規投稿は右下の新規投稿ボタンをクリック`
#### ` 投稿完了後は一覧画面へ戻る`<br>
![image](https://user-images.githubusercontent.com/78143445/112098972-02c2ec80-8be6-11eb-8ae4-09ee26d86fa8.png)
![image](https://user-images.githubusercontent.com/78143445/112259580-e2f5fc00-8cab-11eb-8f5e-aea4a565e35c.png)
<br>

#### ` 投稿一覧画面から１つの投稿を選択 → 投稿詳細画面へ遷移する`
#### ` 投稿者本人であれば投稿の編集・削除が投稿詳細画面から可能になる`<br>
![Videotogif](https://user-images.githubusercontent.com/78143445/112442690-78b68780-8d8f-11eb-9720-4fbceaa41a4c.gif)
<br>

#### ` 投稿詳細画面からコメントができる`
#### `（コメントは投稿に対して交流のために使う）`<br>
![Videotogif (2)](https://user-images.githubusercontent.com/78143445/112443322-29248b80-8d90-11eb-9717-35c3001963b3.gif)
<br>

#### ` 左上の地図をクリック → 地図機能画面へ遷移する`
#### ` 目的地の検索やルート検索ができる(開発途中)`<br>
![Videotogif (3)](https://user-images.githubusercontent.com/78143445/112443671-933d3080-8d90-11eb-9728-261160eb5b93.gif)

# 課題解決

| ユーザーストーリーから考える課題                                      | 課題解決                                         |
| ---------------------------------------------------------------- | ------------------------------------------------- |
| 旅行した内容を同じ趣味の方と共有もしくは語り合いたい                      | 投稿機能をつけて思い出を共有できるようにする。コメント機能をつけてコミュニケーションができるようにする |
| 休日に旅行を計画したいもしくは、とりあえずどこかに行きたい時に名所を探したい  | 投稿検索機能で投稿を検索できるようにする。また、曖昧検索も可能にする |
| 実際に旅行した日程やどんなルートで旅行したのかを知りたいという課題          | 旅行計画機能をつけて旅行計画機能で作成した旅行日程も共有可能にする |


# 機能一覧

| 機能            | 概要             |
| -------------- | -----------------|
| ユーザー管理機能 | 新規登録・ログイン・ログアウトが可能  |
| 投稿機能 | 画像付きで旅行の思い出投稿が可能 |
| 投稿詳細表示機能 | 各投稿詳細が詳細ページで閲覧可能 |
| 投稿編集・削除機能 | 投稿者本人のみ投稿編集・削除が可能 |
| 地図表示機能 | google mapを使用して地図の表示が可能 |
| ルート探索機能 | 目的地を検索してルートを表示 |
| コメント機能 | 投稿詳細ページからコメントが可能|



# 追加予定機能

- 旅行計画機能(日程やルートを保存できる機能) 
- 投稿機能に上記の情報を投稿する機能
- 非同期(コメント機能、いいね機能)


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