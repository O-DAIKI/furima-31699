# README

# テーブル設計

## users テーブル

| Column                  | Type    | Options      |
| ----------------------- | ------- | ------------ |
| nickname                | string  | null: false  |
| email                   | string  | unique: true |
| password                | string  | null: false  |
| encrypted_password      | string  | null: false  |
| first_name              | string  | null: false  |
| last_name               | string  | null: false  |
| first_name_kana         | string  | null: false  |
| last_name_kana          | string  | null: false  |
| birthday                | date    | null: false  |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| text             | text       | null: false                    |
| category         | string     | null: false                    |
| condition_id     | integer    | null: false                    |
| shipping_fee_id  | integer    | null: false                    |
| shipping_from_id | integer    | null: false                    |
| shipping_days_id | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :order

## orders テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |
| address          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## addresses テーブル

| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| prefecture       | string     | null: false                    |
| municipality     | string     | null: false                    |
| address          | string     | null: false                    |
| building         | string     |                                |
| phone_num        | string     | null: false                    |
| order            | references | null: false, foreign_key: true |

### Association

- belongs_to :order