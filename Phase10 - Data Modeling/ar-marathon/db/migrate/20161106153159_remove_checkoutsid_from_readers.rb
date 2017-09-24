class RemoveCheckoutsidFromReaders < ActiveRecord::Migration
  def change
    remove_column :readers, :checkouts_id, :integer
    # remove_index :readers, column: :checkouts_id
  end
end
