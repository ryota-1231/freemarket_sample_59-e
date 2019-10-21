class RemoveCardId < ActiveRecord::Migration[5.2]
  def change
    remove_column :cards, :card_id, :VARCHAR
    remove_column :cards, :token, :text

  end
end
