class RemoveColomnFromCard < ActiveRecord::Migration[5.2]
  def change
    remove_column :cards, :month, :VARCHAR
    remove_column :cards, :year, :VARCHAR
    remove_column :cards, :secure, :VARCHAR
  end
end
