class AddAncestryToSizetypes < ActiveRecord::Migration[5.2]
  def change
    add_column :sizetypes, :ancestry, :string
    add_index :sizetypes, :ancestry
  end
end
