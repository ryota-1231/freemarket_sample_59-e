class Delivery < ApplicationRecord

  has_many :items

  validates :deliveryfee_id, presence:true, numericality: true
  validates :deliverysource_id, presence: true, numericality: true
  validates :deliverymethod_id, presence: true, numericality: true
  validates :deliverydate_id,presence: true, numericality: true

 
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :deliverysource
    belongs_to_active_hash :deliveryfee
    belongs_to_active_hash :deliverydate
    belongs_to_active_hash :deliverymethod
    belongs_to_active_hash :prefecture

end
