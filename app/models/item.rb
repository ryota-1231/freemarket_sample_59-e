class Item < ApplicationRecord
  validates :title, presence:true, 
  length:{ maximum:40 } 
  validates :explanation, presence: true, 
  length:{ maximum:1000 }
  validates :status_id, presence: true, numericality: true
  validates :price,
  numericality:{greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :category_id, presence: true, numericality: true
  validates :sizetype_id, numericality: true
  
  
  
  has_many :comments
  has_many :messages
  has_many :images, dependent: :destroy
  has_many :goods
  has_many :users, through: :goods

  belongs_to :user, optional: true
  belongs_to :brand, optional: true
  belongs_to :category, optional: true
  belongs_to :seller, optional: true
  belongs_to :buyer, optional: true
  belongs_to :delivery, optional: true
  belongs_to :sizetype,optional: true


  accepts_nested_attributes_for :delivery
  accepts_nested_attributes_for :category
  # accepts_nested_attributes_for :sizetype


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status

end