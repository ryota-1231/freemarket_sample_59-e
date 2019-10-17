Mercari clone site
====
  Mercari, a large free market site in Japan, That clone site.

# Description
  We were students of "TECH EXPERT", a Japanese engineer school, 
  and challenged to make this as the last assignment.
  You can register as a user and purchase or sell items.
  
# Demo

# Usage
  You can see the products listed on the top page, 
  you can exhibit your products if you register as a user, 
  and you can also purchase if you register your credit card (provisional) information.

# Mercari DB

## users
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|last_name|text|null: false|
|first_name|text|null: false|
|last_name_kana|text|null: false|
|first_name_kana|text|null: false|
|address_last_name|text|null: false|
|address_first_name|text|null: false|
|address_last_name_kana|text|null: false|
|address_first_name_kana|text|null: false|
|email|string|null: false, unique: true|
|phone_number|integer|unique: true|
|cellphone_number|integer|null: false|
|birthdate_year|integer|null: false|
|birthdate_month|integer|null: false|
|birthdate_day|integer|null: false|
|card_number|integer|null: false|
|expiration_year|integer|null: false|
|expiration_month|integer|null: false|
|expiration_password|integer|null: false|
|reset_password_token|integer||
|reset_password_sent_at|DATETIME||
|remember_created_at|DATETIME||
|introduction|text||

### Association
- has_many :items
- has_many :comments
- has_many :messages
- has_many :goods, dependent: :destroy
- has_many :addresses
- has_many :cards
- has_many :sns_credentials, dependent: :destroy
- has_many :solds
- has_many :items,  through:  :solds
- accepts_nested_attributes_for :addresses


## items
|Column|Type|Options|
|------|----|-------|
|title|string|null: false, add_index|
|explanation|text|null: false|
|price|integer|null: false|
|postage|string|null: false|
|user|references|null: false, foreign_key: true|
|brand|references|null: false, foreign_key: true|
|category|references|null: false, foreign_key: true|
|delivery|references|null: false, foreign_key: true|
|status|bigint|null: false|
|sizetype|bigint||
|purchase|integer|null: false|

### Association
- has_many :comments, dependent: :destroy
- has_many :messages
- has_many :images, dependent: :destroy
- has_many :goods, through: :users, dependent: :destroy
- has_many :solds,  through:  :users
- belongs_to :user, optional: true
- belongs_to :brand, optional: true
- belongs_to :category, optional: true
- belongs_to :buyer, optional: true
- belongs_to :delivery, optional: true
- belongs_to :sizetype,optional: true
- belongs_to :status, optional: true
- accepts_nested_attributes_for :images
- accepts_nested_attributes_for :delivery


## addresses
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

## goods
|Column|Type|Options|
|------|----|-------|
|item|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :user

## judges
|Column|Type|Options|
|------|----|-------|
|judge|integer|null: false|
|judge_comment|text|null: false|
### Association
- has_many :salers
- has_many :buyers

## comments
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :user

## messages
|Column|Type|Options|
|------|----|-------|
|message|text|null: false|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :user



## deliveries
|Column|Type|Options|
|------|----|-------|
|delivery_fee|integer|null: false|
|delivery_method|text|null: false|
|delivery_source|string|null: false|
|delivery_date|string|null: false|
### Association
- has_many :items

## brands
|Column|Type|Options|
|------|----|-------|
|name|text|null: false, unique: true|
### Association
- has_many :items

## categories
|Column|Type|Options|
|------|----|-------|
|name|text|null: false, unique: true|
|option|references|null: false, foreign_key: true|
### Association
- has_many :items
- belongs_to :size
- has_ancestry

## salers
|Column|Type|Options|
|------|----|-------|
|judge|references|null: false, foreign_key: true|
### Association
- has_many :items
- belongs_to :judge

## buyers
|Column|Type|Options|
|------|----|-------|
|judge|references|null: false, foreign_key: true|
### Association
- has_many :items
- belongs_to :judge

## images
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|item|references|null: false, foreign_key: true|
### Association
- belongs_to :item

## sizeTypes
|Column|Type|Options|
|------|----|-------|
|size|text|null: false|
### Association
- has_many :categories
- has_ancestry
