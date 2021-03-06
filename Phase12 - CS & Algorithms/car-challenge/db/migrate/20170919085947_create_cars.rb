class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.string :name, null: false
      t.integer :year, null: false
      t.references :manufacturer, foreign_key: true

      t.timestamps
    end
  end
end
