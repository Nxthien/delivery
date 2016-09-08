class AddRegionToRestaurant < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :region, :string
  end
end
