class AddDefaultToItems < ActiveRecord::Migration[5.2]
  def change
    change_column_null :items, :postage, true
    change_column_null :items, :user_id, true
    change_column_null :items, :brand_id, true
    change_column_null :items, :seller_id, true
    change_column_null :items, :buyer_id, true
  end
end
