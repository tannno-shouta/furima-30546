# README


# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
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
| category_id | integer| null: false |
| status_id   | integer | null: false |
| shipping_id | integer | null: false |
| area_id     | integer | null: false |
| days_id     | integer | null: false |
| price    | integer | null: false |
| user     | references | foreign_key: true |


### Association

- belongs_to :user
- has_one :buyer

## buyers テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| user     | references | foreign_key: true |
| item    | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :addresses


## addresses テーブル

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
