class AddIndexToListtype < ActiveRecord::Migration[5.0]
  def change
  	add_index :listtypes, :type_food
  end
end
