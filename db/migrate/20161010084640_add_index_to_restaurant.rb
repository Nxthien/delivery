class AddIndexToRestaurant < ActiveRecord::Migration[5.0]
  def change
  	add_index :restaurants, :id
  end
end
