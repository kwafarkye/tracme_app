class ChangeInfoToTextToPost < ActiveRecord::Migration
  def change
   change_column :posts, :info, :text, :limit => 1073741820
  end
end
