class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :postcode, null: false
      t.string :city, null: false
      t.integer :block, null: false
      t.string :building
      t.bigint :user_id
      t.integer :prefecture_id

      t.timestamps
      t.integer  
    end
    add_foreign_key :addresses, :users
  end
end
