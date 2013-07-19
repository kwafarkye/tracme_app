class DropPostImagesTable < ActiveRecord::Migration
  def change
      drop_table :post_images
  end
end
