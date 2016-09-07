class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :type_restaurant
      t.string :name
      t.string :address
      t.string :time_open
      t.string :time_close
      t.integer :price_range

      t.timestamps
    end
  end
end
