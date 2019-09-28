class AddSizetypeToCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference :categories, :sizetype, foreign_key: true
  end
end
