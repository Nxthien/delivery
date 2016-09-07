class CreateListtypes < ActiveRecord::Migration[5.0]
  def change
    create_table :listtypes do |t|
      t.string :name
      t.string :type_food

      t.timestamps
    end
  end
end
