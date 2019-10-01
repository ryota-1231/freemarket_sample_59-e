class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.text :name, null: false, unique: true
      t.references :sizetype, foreign_key: true

      t.timestamps
    end
  end
end

