class CreateSizetypes < ActiveRecord::Migration[5.2]
  def change
    create_table :sizetypes do |t|
      t.text :sizetype, null: false

      t.timestamps
    end
  end
end

