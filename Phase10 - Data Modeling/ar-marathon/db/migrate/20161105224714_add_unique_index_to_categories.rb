class AddUniqueIndexToCategories < ActiveRecord::Migration
  def change
    add_index :categories, :category, unique: true
  end
end
