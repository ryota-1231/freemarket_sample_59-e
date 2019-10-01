class ReemoveAncestryFromBrands < ActiveRecord::Migration[5.2]
  def change
    remove_column :brands, :ancestry, :integer
  end
end
