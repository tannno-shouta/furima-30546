# README


# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| name     | string | null: false |
| email    | string | null: false |
| encrypted_password | string | null: false |
| first_name | string | null: false |
| last_name  | string | null: false |
| first_kana | string | null: false |
| last_kana  | string | null: false |
| birthday  | date   | null: false |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| product  | string | null: false |
| message  | text   | null: false |
| password | string | null: false |
| category | string | null: false |
| status   | string | null: false |
| shipping | string | null: false |
| area     | string | null: false |
| days     | string | null: false |
| price    | string | null: false |
| user     | references | foreign_key: true |


### Association

- belongs_to :users
- has_one :buyer

## buyer テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| user     | references | foreign_key: true |
| item    | references | foreign_key: true |

### Association
- belongs_to :users
- belongs_to :items
- has_one :buyer


## address テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| postcode | string | null: false |
| street_id | integer | null: false |
| municipality | string | null: false |
| address  | string | null: false |
| building | string |-------------|
| tel      | string | null: false |
| buyer     | references | foreign_key: true |

### Association

- belongs_to :buyer
