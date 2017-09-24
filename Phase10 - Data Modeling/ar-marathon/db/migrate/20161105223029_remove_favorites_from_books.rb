class RemoveFavoritesFromBooks < ActiveRecord::Migration
  def change
    remove_column :books, :favorite, :boolean
  end
end
