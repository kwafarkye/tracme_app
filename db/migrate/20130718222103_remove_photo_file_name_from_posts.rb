class RemovePhotoFileNameFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :photo_file_name, :posts
  end
end
