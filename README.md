# Mercari DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|fullname|string|null: false|
|kana|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|phone_number|integer|null: false, unique: true|
### Association
- has_many :items
- has_many :comments
- has_many :messages
- has_many :goods
- has_many :items, through: :goods
- has_many :addresses

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|postcode|integer|null: false|
|prefecture|references|null: false, foreign_key: true|
|city|string|null: false|
|block|integer|null: false|
|building|string||
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## goodsテーブル
|Column|Type|Options|
|------|----|-------|
|item|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :user

## judgesテーブル
|Column|Type|Options|
|------|----|-------|
|judge|integer|null: false|
|judge_comment|text|null: false|
### Association
- has_many :salers
- has_many :buyers

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :user

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|message|text|null: false|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false, add_index|
|explanation|text|null: false|
|price|integer|null: false|
|state|integer|null: false|
|postage|string|null: false|
|user|references|null: false, foreign_key: true|
|brand|references|null: false, foreign_key: true|
|category|references|null: false, foreign_key: true|
|seller|references|null: false, foreign_key: true|
|buyer|references|null: false, foreign_key: true|
|delivery|references|null: false, foreign_key: true|
### Association
- has_many :comments
- has_many :messages
- has_many :images
- has_many :goods
- has_many :users, through: :goods
- belongs_to :user
- belongs_to :brand
- belongs_to :category
- belongs_to :saler
- belongs_to :buyer
- belongs_to :delivery

## deliveriesテーブル
|Column|Type|Options|
|------|----|-------|
|delivery_fee|integer|null: false|
|delivery_method|text|null: false|
|delivery_source|string|null: false|
|delivery_date|string|null: false|
### Association
- has_many :items

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|text|null: false, unique: true|
### Association
- has_many :items

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|text|null: false, unique: true|
|option|references|null: false, foreign_key: true|
### Association
- has_many :items
- belongs_to :size
- has_ancestry

## salersテーブル
|Column|Type|Options|
|------|----|-------|
|judge|references|null: false, foreign_key: true|
### Association
- has_many :items
- belongs_to :judge

## buyersテーブル
|Column|Type|Options|
|------|----|-------|
|judge|references|null: false, foreign_key: true|
### Association
- has_many :items
- belongs_to :judge

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|item|references|null: false, foreign_key: true|
### Association
- belongs_to :item

## sizeTypesテーブル
|Column|Type|Options|
|------|----|-------|
|size|text|null: false|
### Association
- has_many :categories
- has_ancestry