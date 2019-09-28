class RemoveSizeTypeFromCategory < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :sizetype_id, :integer
  end
end
