class ChangeInfoToText < ActiveRecord::Migration
  def change
   change_column :posts, :info, :text, :limit => 4294967295
  end
end
