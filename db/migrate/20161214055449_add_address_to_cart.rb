class AddAddressToCart < ActiveRecord::Migration[5.0]
  def change
    add_column :carts, :address, :string
  end
end
