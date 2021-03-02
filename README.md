# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル
 
| Column             | Type   | Options                  |
| -------------------| ------ | ------------------------ |
| name               | string | null: false              |
| email              | string | null: false,unique: true |
| encrypted_password | string | null: false              |
| family_name        | string | null: false              |
| first_name         | string | null: false              |
| family_name_furi   | string | null: false              |
| first_name_furi    | string | null: false              |
| birthday           | date   | null: false              |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column        | Type       | Options                        |
| ------------- | -----------| ------------------------------ |
| genre         | string     | null: false                    |
| description   | text       | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
| category_id   | integer    | null: false, foreign_key: true |
| condition_id  | integer    | null: false                    |
| fee_id        | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| time_id       | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :destination
 
## destinations テーブル

| Column           | Type       | Options                        |
| ---------------- | -----------| ------------------------------ |
| family_name      | string     | null: false                    |
| first_name       | string     | null: false                    |
| family_name_furi | string     | null: false                    |
| first_name_furi  | string     | null: false                    |
| postal_code      | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| ad_detail        | string     | null: false                    |
| building         | string     |                                |
| room_num         | string     |                                |
| phone            | string     | null: false                    |
| order            | references | null: false, foreign_key: true |

### Association

- belongs_to :order


