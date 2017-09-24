class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |table|
      table.string :category, null: false, unique: true
    end
  end
end
