class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
    	t.string :name
    	t.integer :basic 
    	t.integer :amount
    	t.integer :price
    	t.string :restaurant_id
      t.timestamps
    end
  end
end
