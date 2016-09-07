class AddRestaurantToListType < ActiveRecord::Migration[5.0]
  def change
    add_reference :listtypes, :restaurant, foreign_key: true
  end
end
