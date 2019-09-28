class CreateSellers < ActiveRecord::Migration[5.2]
  def change
    create_table :sellers do |t|
      t.references :judge, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
