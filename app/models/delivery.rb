class Delivery < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :deliveryfee, :deliverydate, :deliverymethod, :prefecture

  

end
