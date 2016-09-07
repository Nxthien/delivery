class AddListTypeToFood < ActiveRecord::Migration[5.0]
  def change
    add_reference :foods, :listtype, foreign_key: true
  end
end
