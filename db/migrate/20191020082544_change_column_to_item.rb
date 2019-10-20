class ChangeColumnToItem < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :items, :sellers
    remove_foreign_key :items, :buyers
  end
end
