class AddCustomerToCart < ActiveRecord::Migration[5.0]
  def change
    add_column :carts, :customer, :string
  end
end
