class RemoveStringFromRestaurant < ActiveRecord::Migration[5.0]
  def change
    remove_column :restaurants, :string, :string
  end
end
