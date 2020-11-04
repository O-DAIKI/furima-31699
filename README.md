# README

# テーブル設計

## users テーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| nickname    | string  | null: false |
| email       | string  | null: false |
| password    | string  | null: false |
| first_name  | string  | null: false |
| last_name   | string  | null: false |
| birth_year  | integer | null: false |
| birth_month | integer | null: false |
| birth_day   | integer | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| name          | string     | null: false       |
| text          | text       | null: false       |
| category      | string     | null: false       |
| condition     | string     | null: false       |
| shipping_fee  | string     | null: false       |
| shipping_from | string     | null: false       |
| shipping_days | string     | null: false       |
| price         | integer    | null: false       |
| user          | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column           | Type       | Option            |
| ---------------- | ---------- | ----------------- |
| card_num         | integer    | null: false       |
| expiration_month | integer    | null: false       |
| expiration_year  | integer    | null: false       |
| security_code    | integer    | null: false       |
| postal_code      | string     | null: false       |
| prefecture       | string     | null: false       |
| municipality     | string     | null: false       |
| address          | string     | null: false       |
| building         | string     | null: true        |
| phone_num        | integer    | null: false       |
| user             | references | foreign_key: true |
| item             | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item