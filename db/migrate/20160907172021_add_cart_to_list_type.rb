class AddCartToListType < ActiveRecord::Migration[5.0]
  def change
    add_reference :listtypes, :cart, foreign_key: true
  end
end
