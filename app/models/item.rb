class Item < ApplicationRecord
  has_many :comments
  has_many :messages
  has_many :images
  has_many :goods
  has_many :users, through: :goods
  
  belongs_to :user
  belongs_to :brand
  belongs_to :category
  belongs_to :saler
  belongs_to :buyer
  belongs_to :delivery
end