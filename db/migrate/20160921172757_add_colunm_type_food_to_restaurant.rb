class AddColunmTypeFoodToRestaurant < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :type_food, :string
    add_column :restaurants, :string, :string
  end
end
