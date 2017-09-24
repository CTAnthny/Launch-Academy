class RemoveMembersColumn < ActiveRecord::Migration
  def change
    remove_column :meetups, :members
    change_column_null :meetups, :location, false
    change_column_null :meetups, :description, false
  end
end
