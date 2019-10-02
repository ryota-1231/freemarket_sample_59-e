class Delivery < ApplicationRecord

  has_many :items

  validates :deliveryfee, presence:true, numericality: true
  validates :deliverysource, presence: true, numericality: true
  validates :deliverymethod, presence: true, numericality: true
  validates :deliverydate, presence: true, numericality: true
 
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :deliverysource
    belongs_to_active_hash :deliveryfee
    belongs_to_active_hash :deliverydate
    belongs_to_active_hash :deliverymethod
    belongs_to_active_hash :prefecture

end
