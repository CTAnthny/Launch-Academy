class ChangeCreatorToFk < ActiveRecord::Migration
  def up
    remove_column :meetups, :creator
    add_column :meetups, :creator_id, :integer, foreign_key: true, null: false
  end

  def down
    add_column :meetups, :creator, :string, null: false
    remove_column :meetups, :creator_id
  end
end
