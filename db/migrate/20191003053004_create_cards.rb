class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.references :user, foreign_key: true, null: false
      t.string :buyer_id, null: false
      t.string :card_id, null: false
      t.text :token, null: false
      t.string :card_number, null: false
      t.string :month, null: false
      t.string :year, null: false
      t.string :secure, null: false
      t.timestamps
    end
  end
end
