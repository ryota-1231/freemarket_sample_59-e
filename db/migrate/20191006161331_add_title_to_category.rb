class AddTitleToCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :title, :text
    add_column :categories, :text, :text
  end
end
