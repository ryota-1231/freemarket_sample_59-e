class ChangeColumnToDelivery < ActiveRecord::Migration[5.2]
  def change
    remove_column :deliveries, :delivery_method, :text
    remove_column :deliveries, :delivery_source, :varchar
    remove_column :deliveries, :delivery_date, :varchar
    remove_column :deliveries, :delivery_fee, :integer
    add_column :deliveries, :deliveryfee_id, :bigint, foreign_key: true, null: false
    add_column :deliveries, :deliverymethod_id, :bigint, foreign_key: true, null: false
    add_column :deliveries, :deliverysource_id, :bigint, foreign_key: true, null: false
    add_column :deliveries, :deliverydate_id, :bigint, foreign_key: true, null: false
  end
end
