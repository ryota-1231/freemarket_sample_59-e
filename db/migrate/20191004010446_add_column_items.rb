class AddColumnItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :sizetype_id, :bigint
    add_reference :items, :sizetype, foreign_key: true
  end
end
