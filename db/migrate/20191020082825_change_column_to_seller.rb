class ChangeColumnToSeller < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :sellers, :judges
  end
end
