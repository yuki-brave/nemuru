# README

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |


### Association

- has_many :tweets
- has_many :comments

## tweets テーブル

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| title          | string     | null: false |
| text           | text       | null: false |
| mind_id        | integer    | null: false |
| category_id    | integer    | null: false |
| time_zone_id   | integer    | null: false | 
| user           | references | null: false, foreign_key: true |

### Association

- has_many   :comment
- belongs_to :user

## comments テーブル

| Column  | Type       | Options                        |
| ------  | ---------- | ------------------------------ |
| text    | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| tweet   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :tweet