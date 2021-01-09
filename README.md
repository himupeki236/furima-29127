# README

# テーブル設計

## users テーブル

| Column        | Type        | Options     |
| ------------- | ----------- | ----------- |
| nickname      | string      | null: false |
| mail_address  | string      | null: false |
| password      | string      | null: false |
| name_sei      | string      | null: false |
| name_sei      | string      | null: false |
| name_kana_sei | string      | null: false |
| name_kana_mei | string      | null: false |
| birth_year    | integer     | null: false |
| birth_month   | integer     | null: false |
| birth_day     | integer     | null: false |

### Association

- has_many :product_users
- has_many :products, through: product_users


## products テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| image        | string  | null: false |
| name         | string  | null: false |
| describe     | string  | null: false |
| category     | string  | null: false |
| state        | string  | null: false |
| ship_charge  | string  | null: false |
| area         | string  | null: false |
| ship_day     | string  | null: false |
| price        | integer | null: false |
| purchase_flg | integer |             |


### Association

- has_many :product_users
- has_many :products, through: product_users

## product_users テーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| product   | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :products


## credits テーブル

| Column           | Type       | Options                        |
| -----------------| ---------- | ------------------------------ |
| credit_card_no   | integer    | null: false, foreign_key: true |
| expiration_month | integer    | null: false, foreign_key: true |
| expiration_year  | integer    | null: false, foreign_key: true |
| security_cd      | integer    | null: false, foreign_key: true |
