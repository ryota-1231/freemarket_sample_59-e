class Item < ApplicationRecord
  has_many :comments
  has_many :messages
  has_many :images
  has_many :goods
  has_many :users, through: :goods
  

  belongs_to :user, optional: true
  belongs_to :brand, optional: true
  belongs_to :category, optional: true
  belongs_to :seller, optional: true
  belongs_to :buyer, optional: true
  belongs_to :delivery, optional: true

  accepts_nested_attributes_for :delivery
  accepts_nested_attributes_for :category

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :state
  



end