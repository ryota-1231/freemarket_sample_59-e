class Category < ApplicationRecord

  has_ancestry
  has_many :items
  belongs_to :sizetype

  accepts_nested_attributes_for :sizetype

  class<<self
    def take
    Category.all
      end
    end


  
end
