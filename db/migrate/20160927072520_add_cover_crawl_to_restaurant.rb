class AddCoverCrawlToRestaurant < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :coverimage, :string
  end
end
