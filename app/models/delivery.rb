class Delivery < ApplicationRecord

  has_many :items

  validates :delivery_fee, presence:true, numericality: true
  validates :delivery_source, presence: true, numericality: true
  validates :delivery_method, presence: true, numericality: true
  validates :delivery_date,presence: true,
  numericality: true
 
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :deliveryfee
    belongs_to_active_hash :deliverydate
    belongs_to_active_hash :deliverymethod
    belongs_to_active_hash :prefecture

end
