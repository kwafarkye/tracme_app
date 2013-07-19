class RemoveColumns < ActiveRecord::Migration
  def change
      remove_column :posts, :photo_content_type
      remove_column :posts, :photo_updated_at
      remove_column :posts, :photo_file_size
  end
end
