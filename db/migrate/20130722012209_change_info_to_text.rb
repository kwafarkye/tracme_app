class ChangeInfoToText < ActiveRecord::Migration
  def change
   change_column :posts, :info, :text, :limit => 1073741824
  end
end
