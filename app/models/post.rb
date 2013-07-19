class Post < ActiveRecord::Base
   #Validate that there is a title and info for this post
   validates(:title, presence: true, length: {maximum: 25})
   validates(:info, presence: true)

   # Take in a photo from the photo model
   #has_one :post_image
   accepts_nested_attributes_for :post_image

   #attr_accessible :pim
   #has_attached_file :pim,
   #                  :url => "/images/:basename.:extension",
   #                  :path => ":rails_root/public/images/:basename.:extension",
   #                  :default_url => "/images/missing.png"
   # validates_attachment_presence :pim
end
