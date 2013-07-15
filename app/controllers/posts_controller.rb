class PostsController < ApplicationController
   before_action :signed_in_user, only: [:edit, :update, :create, :new]

   def index
      @posts = Post.all
   end

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

      #Before filter
      def signed_in_user
         unless signed_in?
            store_location
            redirect_to signin_url, notice: "You must be signed in to complete this action.."
         end
      end

end
