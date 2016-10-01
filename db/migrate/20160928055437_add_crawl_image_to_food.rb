class AddCrawlImageToFood < ActiveRecord::Migration[5.0]
  def change
    add_column :foods, :crawl_image, :string
  end
end
