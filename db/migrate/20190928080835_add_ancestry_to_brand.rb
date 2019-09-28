class AddAncestryToBrand < ActiveRecord::Migration[5.2]
  def change
    add_column :brands, :ancestry, :string
  end
end
