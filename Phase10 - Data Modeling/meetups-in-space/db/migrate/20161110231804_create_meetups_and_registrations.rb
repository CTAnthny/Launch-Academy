class CreateMeetupsAndRegistrations < ActiveRecord::Migration
  def change
    create_table :meetups do |table|
      table.string :creator, null: false
      table.string :title, null: false
      table.string :members
      table.string :category, null: false
      table.string :location
      table.text :description

      table.timestamps null: false
    end

    create_table :registrations, id: false do |table|
      table.belongs_to :user, index: true
      table.belongs_to :meetup, index: true
    end

    add_index :meetups, :title, unique: true
  end
end
