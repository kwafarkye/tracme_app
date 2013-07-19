class AddAttachmentPimToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.attachment :pim
    end
  end

  def self.down
    drop_attached_file :posts, :pim
  end
end
