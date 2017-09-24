class AddJoinsTable < ActiveRecord::Migration
  def change
    create_table :joins do |table|
      table.belongs_to :user, index: true
      table.belongs_to :project, index: true
    end
  end
end
