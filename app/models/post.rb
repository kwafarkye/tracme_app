class Post < ActiveRecord::Base
   has_many :comments, dependent: :destroy

   # Set the scope so the comments come out in most recent first order
   default_scope -> { order('created_at DESC') }
   #Validate that there is a title and info for this post
   validates(:title, presence: true, length: {maximum: 25})
   validates(:info, presence: true)
end
