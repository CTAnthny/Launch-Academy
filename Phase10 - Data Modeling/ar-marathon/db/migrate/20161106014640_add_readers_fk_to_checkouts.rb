class AddReadersFkToCheckouts < ActiveRecord::Migration
  def change
    add_column :checkouts, :reader_id, :integer, unique: true, foreign_key: true
    add_index :checkouts, :reader_id, unique: true
  end
end
