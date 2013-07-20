module PostsHelper
   @remember_id = 2

   def set_current_post(post)
      PostsHelper.setId(post.id)
      self.current_post = post
   end

   def current_post=(cpid)
      @current_post = cpid
   end

   def current_post
      @current_post = Post.find(PostsHelper.getId)
   end

   def PostsHelper.getId
      @remember_id
   end

   def PostsHelper.setId(x)
      @remember_id = x
   end

end
