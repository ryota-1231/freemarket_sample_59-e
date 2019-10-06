class AddItemToImages < ActiveRecord::Migration[5.2]
  def change
    add_reference :images, :item, foreign_key: true
  end
end
