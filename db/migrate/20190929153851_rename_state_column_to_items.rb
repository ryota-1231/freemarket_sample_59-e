class RenameStateColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :state, :status
  end
end
