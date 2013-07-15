class PostsController < ApplicationController
   def show
      #@post = Post.all
      @post = Post.find(params[:id])
   end

   def new
      #@post = Post.new(post_params)
   end

   def create
      @post = Post.new(post_params)
      if @post.save
         #Handle a successful save
         flash[:success] = "New post created"
         redirect_to @post
      else
         render 'new'
      end
   end

   def edit
      @post = Post.find(params[:id])
   end

   def update
      @post = Post.find(params[:id])
      if @post.update_attributes(post_params)
         flash[:success] = "Post has been updated"
         redirect_to root_url
         #Handle a successful update
      else
         render 'edit'
      end
   end

   private

      def post_params
         params.require(:post).permit(:title, :info)
      end

end
