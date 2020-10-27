# README


# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| birthday | string | null: false |

### Association

- has_many :items
- belongs_to :address


## items テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
|  images  | string | null: false |
| product  | string | null: false |
| message  | string | null: false |
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
- belongs_to :address

## buyer テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| user     | references | foreign_key: true |
| items    | references | foreign_key: true |

### Association
- belongs_to :users
- belongs_to :items


## address テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| postcode | string | null: false |
| street   | string | null: false |
| municipality | string | null: false |
| address  | string | null: false |
|building  | string |-------------|
| tel      | string | null: false |

### Association

- belongs_to :users
- belongs_to :items
