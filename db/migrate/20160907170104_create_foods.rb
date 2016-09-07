class CreateFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :basicprice
      t.integer :amount
      t.integer :countorder
      t.integer :bouns
      t.integer :price

      t.timestamps
    end
  end
end
