class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.integer :sum_money
      t.integer :distant
      t.integer :sale
      t.integer :money
      t.string :status

      t.timestamps
    end
  end
end
