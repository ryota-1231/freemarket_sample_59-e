class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.integer :delivery_fee, null: false
      t.text :delivery_method, null: false
      t.string :delivery_source, null: false
      t.string :delivery_date, null: false

      t.timestamps
    end
  end
end
