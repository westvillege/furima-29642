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
 
| Column             | Type   | Options      |
| -------------------| ------ | ------------ |
| name               | text   | null: false  |
| email              | string | null: false  |
|                    |        | unique: true |
| encrypted_password | string | null: false  |
| family_name        | text   | null: false  |
| first_name         | text   | null: false  |
| family_name_furi   | text   | null: false  |
| first_name_furi    | text   | null: false  |
| birthday           | date   | null: false  |

### Association

- has_many :items

## items テーブル

| Column       | Type       | Options                        |
| ------------ | -----------| ------------------------------ |
| name         | text       | null: false                    |
| description  | text       | null: false                    |
| price        | integer    | null: false                    |
| categories   | references | null: false, foreign_key: true |
| user_id      | references | null: false, foreign_key: true |
| condition_id | integer    | null: false                    |
| fee_id       | integer    | null: false                    |
| area_id      | integer    | null: false                    |
| time_id      | integer    | null: false                    |

### Association

- belongs_to :user
- belongs_to :category
- has_one :record

## categories テーブル
 
| Column     | Type | Options     |
| ---------- | ---- | ----------- |
| name       | text | null: false |

### Association

- has_many :items

 ## records テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| items_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one :destination
 
 ## destinations テーブル

| Column     | Type       | Options                        |
| ---------- | -----------| ------------------------------ |
| records_id | references | null: false, foreign_key: true |

### Association

- belongs_to :record


