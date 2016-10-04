class AddIndexInFoods < ActiveRecord::Migration[5.0]
  def change
  	add_index :foods, :id
  end
end
