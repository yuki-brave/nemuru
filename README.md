# README

# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| gender             | integer | default: 0  |
| age                | integer | default: 0  |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false |


### Association

- has_many :tweets
- has_many :comments
- has_many :likes
- has_many :diaries

## tweets テーブル

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| title          | string     | null: false |
| text           | text       | null: false |
| thought        | text       | null: false |
| mind_id        | integer    | null: false |
| category_id    | integer    | null: false |
| time_length_id | integer    | null: false | 
| user           | references | null: false, foreign_key: true |

### Association

- has_many   :comments
- belongs_to :user
- has_many :tweet_tag_relations
- has_many :tags, through :tweet_tag_relations
- has_many :likes

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


## likes テーブル

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| user   | references |             |
| tweet  | references |             |               

### Association

- belongs_to :user
- belongs_to :tweet


## diary テーブル

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| start_time     | datetime   | null: false |
| title          | string     | null: false |
| text           | text       | null: false |
| thought        | text       |             |
| mind_id        | integer    |             |
| category_id    | integer    |             |
| time_length_id | integer    |             |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user