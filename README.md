* Database creation

# users table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
## association
has_many :messages
has_many :groups, through:members
add_index :users, :name
add_index :users, :email, unique:true

# messages table
|Column|Type|Options|
|------|----|-------|
|body|text|null: false|
|user_id|integer|null: false foreign_key: true|
|group-id|integer|null: false foreign_key: true|
|image|string|

## association
belongs_to :user
belongs_to :group

# groups table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

## association
has_many :users , through: members
has_many :messages

# members table

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

## Association
belongs_to :group
belongs_to :user


