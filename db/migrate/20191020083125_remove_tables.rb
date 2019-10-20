class RemoveTables < ActiveRecord::Migration[5.2]
  def change
    drop_table :judges
    drop_table :sellers
    drop_table :buyers
  end
end
