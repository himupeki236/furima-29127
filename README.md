# README

# テーブル設計

## users テーブル

| Column             | Type        | Options                  |
| ------------------ | ----------- | ------------------------ |
| nickname           | string      | null: false              |
| email              | string      | null: false,unique: true |
| encrypted_password | string      | null: false              |
| name_sei           | string      | null: false              |
| name_mei           | string      | null: false              |
| name_kana_sei      | string      | null: false              |
| name_kana_mei      | string      | null: false              |
| birth_date         | date        | null: false              |

### Association

- has_many :product_users
- has_many :products, through: product_users


## products テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| name           | string  | null: false |
| describe       | string  | null: false |
| category_id    | integer | null: false |
| state_id       | integer | null: false |
| ship_charge_id | integer | null: false |
| area_id        | integer | null: false |
| ship_day_id    | integer | null: false |
| price          | integer | null: false |
| purchase_flg   | integer |             |


### Association

- has_many :product_users
- has_many :products, through: product_users

## product_users テーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| product   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product

■deliveryテーブル
| Column           | Type     | Options     |
| -----------------| ---------| ------------|
| zip_cd           | integer  | null: false |
| prefectures      | string   | null: false |
| municipality     | string   | null: false |
| address          | string   | null: false |
| building         | string   | null: false |
| tel              | string   | null: false |



