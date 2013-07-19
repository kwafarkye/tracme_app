class Comment < ActiveRecord::Base
   belongs_to :post
   validates :content, presence: true, length: { maximum: 100 }
   validates :post_id, presence: true
end
