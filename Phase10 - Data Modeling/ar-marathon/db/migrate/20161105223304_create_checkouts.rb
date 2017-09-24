class CreateCheckouts < ActiveRecord::Migration
  def change
    create_table :checkouts do |table|
      table.integer :book_id, index: true, unique: true, foreign_key: true
      table.timestamps null: false
    end
  end
end
