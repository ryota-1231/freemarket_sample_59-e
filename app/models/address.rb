class Address < ApplicationRecord
  belongs_to :user, optional: true
  
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :prefecture

  validates :postcode,         presence: true
  validates :city,             presence: true
  validates :block,            presence: true
  validates :prefecture_id,    presence: true
  
end
