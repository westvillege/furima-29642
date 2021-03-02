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
- has_one :destination

## items テーブル

| Column       | Type       | Options                        |
| ------------ | -----------| ------------------------------ |
| name         | string     | null: false                    |
| description  | text       | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |
| category_id  | references | null: false, foreign_key: true |
| condition_id | integer    | null: false                    |
| fee_id       | integer    | null: false                    |
| area_id      | integer    | null: false                    |
| time_id      | integer    | null: false                    |

### Association

- belongs_to :user
- belongs_to :category
- has_one :record

## categories テーブル
 
| Column     | Type   | Options     |
| ---------- | ----   | ----------- |
| name       | string | null: false |

### Association

- has_many :items

## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| items_id  | references | null: false, foreign_key: true |
| users_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
 
## destinations テーブル

| Column           | Type       | Options                        |
| ---------------- | -----------| ------------------------------ |
| users_id         | references | null: false, foreign_key: true |
| family_name      | string     | null: false                    |
| first_name       | string     | null: false                    |
| family_name_furi | string     | null: false                    |
| first_name_furi  | string     | null: false                    |
| postal_code      |integer     | null: false                    |
| address          | string     | null: false                    |
| phone            | string     |                                |

### Association

- belongs_to :user


