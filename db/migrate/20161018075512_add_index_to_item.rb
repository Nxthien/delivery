class AddIndexToItem < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :cart, foreign_key: true
  end
end
