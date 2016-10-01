class AddDescriptionToFood < ActiveRecord::Migration[5.0]
  def change
    add_column :foods, :description, :string
  end
end
