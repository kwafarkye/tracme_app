class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.integer :post_id
      t.string :caption

      t.timestamps
    end
  end
end
