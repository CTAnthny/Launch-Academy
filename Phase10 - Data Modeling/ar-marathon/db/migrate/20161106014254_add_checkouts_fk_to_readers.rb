class AddCheckoutsFkToReaders < ActiveRecord::Migration
  def change
    add_column :readers, :checkouts_id, :integer, unique: true, foreign_key: true
    add_index :readers, :checkouts_id, unique: true
  end
end
