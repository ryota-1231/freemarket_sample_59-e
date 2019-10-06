class AddDetailsToItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :status, :integer
    add_column :items, :sizetype_id, :bigint, foreign_key: true
    add_column :items, :status_id, :bigint, foreign_key: true, null: false
  end
end
