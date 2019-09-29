class CreateJudges < ActiveRecord::Migration[5.2]
  def change
    create_table :judges do |t|
      t.integer :judge, null: false
      t.text :judge_comment, null: false
      
      t.timestamps
    end
  end
end
