class AddDetailsToCars < ActiveRecord::Migration[5.0]
  def change
    add_column :cars, :color, :string, null: false
    add_column :cars, :mileage, :integer, null: false
  end
end
