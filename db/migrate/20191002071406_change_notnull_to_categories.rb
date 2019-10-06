class ChangeNotnullToCategories < ActiveRecord::Migration[5.2]
  def change
    change_column_null :categories, :ancestry, true, nil
    change_column_null :categories, :sizetype_id, true, nil
  end
end
