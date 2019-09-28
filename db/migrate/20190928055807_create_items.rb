class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string   :title, null: false, index: true
      t.text     :explanation, null: false
      t.integer  :price
      t.integer  :state , null: false
      t.string   :postage, null: false
      t.bigint :user_id, null: false

      # t.references :user, null: false, foreign_key: true
      # t.references :brand, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      # t.references :seller, null: false, foreign_key: true
      # t.references :buyer, null: false, foreign_key: true
      # t.references :delivery, null: false, foreign_key: true

      t.timestamps
    end
    add_foreign_key :items, :users
  end
end

