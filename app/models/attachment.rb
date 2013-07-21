class Attachment < ActiveRecord::Base
   belongs_to :post
   validates :post_id, presence: true
   validates :caption, length: { maximum: 10 }

   has_attached_file :image,
                     :styles => { thumb: "100x100>", medium: "300x300>", large: "600x600" }#,
                     #:default_url => "/images/:style/missing.png",
                     #:url => "/images/:style/:basename.:extension",
                     #:path => ":rails_root/public/system/images/:style/:basename.:extension"
                     #:default_url => "images/missing.png"

   validates_attachment_presence :image

end
