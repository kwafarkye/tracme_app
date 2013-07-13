class Post < ActiveRecord::Base
   #Validate that there is a title and info for this post
   validates(:title, presence: true, length: {maximum: 25})
   validates(:info, presence: true)
end
