# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
# users table
|Column|Type|Options|
|------|----|-------|

## association
has_many :messages
has_many :groups
add_index :users, :name
add_index :users, :email, unique:true

# messages table
|Column|Type|Options|
|------|----|-------|
|body|text|null: false|
|user_id|integer|null: false foreign_key: true|
|group-id|integer|null: false foreign_key: true|
|created_at|datetime|null: false|
|image|string|

## association
belongs_to :users
belongs_to :groups

# groups table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|user_id|integer|null: faulse foreign_key: true|
|created_at|datetime|null: false|

## association
has_many :users
has_many :messages

# members table

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

## Association
belongs_to :group
belongs_to :user

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
