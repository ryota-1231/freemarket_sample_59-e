class ChangeColumnToBuyer < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :buyers, :judges
  end
end
