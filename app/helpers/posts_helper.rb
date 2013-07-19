module PostsHelper
   def set_current_post(post)
      @remember_id = post.id
      self.current_post = post
   end

   def current_post=(cpid)
      @current_post = cpid
   end

   def current_post
      @current_post = Post.find(2)
   end

end
