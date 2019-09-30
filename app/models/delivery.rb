class Delivery < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :deliverysource
  belongs_to_active_hash :deliverydate
  belongs_to_active_hash :deliverymethod
  
  
end
