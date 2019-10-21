class RemoveCardsNumberFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :expiration_month, :VARCHAR
    remove_column :users, :expiration_year, :integar
    remove_column :users, :card_number, :integar
  end
end
