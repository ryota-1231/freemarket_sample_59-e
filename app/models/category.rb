class Category < ApplicationRecord
  has_many :items
  belongs_to :sizetype
  has_ancestry
end
