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
 
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | text   | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :items

## items テーブル

| Column     | Type       | Options                        |
| ---------- | -----------| ------------------------------ |
| name       | text       | null: false                    |
| price      | integer    | null: false
| user       | references | null: false, foreign_key: true |
| categories | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :category
- has_many :photos
- has_one :record

## categories テーブル
 
| Column     | Type | Options     |
| ---------- | ---- | ----------- |
| name       | text | null: false |

### Association

- has_many :items

## photos テーブル

| Column | Type       | Options                        |
| ------ | -----------| ------------------------------ |
| items  | references | null: false, foreign_key: true |

### Association

- belongs_to :item

 ## records テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| items  | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one :destination
 
 ## destinations テーブル

| Column | Type       | Options                        |
| ------ | -----------| ------------------------------ |
| items  | references | null: false, foreign_key: true |

### Association

- belongs_to :record


