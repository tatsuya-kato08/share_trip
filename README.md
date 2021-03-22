# 開発環境


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