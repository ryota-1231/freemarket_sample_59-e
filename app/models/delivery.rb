class Delivery < ApplicationRecord

  has_many :items

  

  

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :deliveryfee

    belongs_to_active_hash :deliverydate
    belongs_to_active_hash :deliverymethod
    belongs_to_active_hash :prefecture

end
