class CreateCategorizationsJoinTable < ActiveRecord::Migration
  def change
    create_table :categorizations, id: false do |table|
      table.integer :book_id, foreign_key: true
      table.integer :category_id, foreign_key: true
    end

    add_index :categorizations, :book_id, unique: true
    add_index :categorizations, :category_id, unique: true
  end
end
