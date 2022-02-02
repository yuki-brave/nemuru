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

- has_many   :comments
- belongs_to :user
- has_many :tweet_tag_relations
- has_many :tags, through :tweet_tag_relations

## comments テーブル

| Column  | Type       | Options                        |
| ------  | ---------- | ------------------------------ |
| text    | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| tweet   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :tweet

## tags テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| tag_name | string | null: false |

### Association

- has_many :tweet_tag_relations
- has_many :tags, through :tweet_tag_relations

## tweet_tag_relations テーブル

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| tweet  | references | null: false |
| tag    | references | null: false |               

### Association

- belongs_to :tweet
- belongs_to :tag