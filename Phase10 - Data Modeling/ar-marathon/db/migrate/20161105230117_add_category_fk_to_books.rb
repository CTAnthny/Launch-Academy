class AddCategoryFkToBooks < ActiveRecord::Migration
  def change
    add_column :books, :category_id, :integer, foreign_key: true
    add_index :books, :category_id, unique: true 
  end
end
