class PostsController < ApplicationController
   before_action :signed_in_user, only: [:edit, :update, :create, :new, :destroy]
   #before_action :admin_user, only: :destroy

   def index
      @posts = Post.paginate(page: params[:page], per_page: 3).order('id DESC')
   end

   def show
      #@post = Post.all
      @post = Post.find(params[:id])
      # Set the current post so that the comments controller has access to it
      set_current_post @post

      # We want to know who the current user is
      @current = current_user

      # Variable for uploading images
      @attachment = @post.attachments.build
      @attachments = @post.attachments
      #@attachments = @post.attachments.paginate(page: params[:page], per_page: 3)
      # Variable for making comments
      @comment = @post.comments.build
      @comments = @post.comments.paginate(page: params[:page], per_page: 3)
   end

   def new
      @post = Post.new
      #@post.build_attachment
      #@post.attachments.build
      #3.times { @post.attachments.build }
   end

   def create
      @post = Post.new(post_params)
      #Attachment.create(params[:attachment])
      if @post.save
         #Handle a successful save
         flash[:success] = "New post created"
         redirect_to @post
      else
         render 'new'
      end

      #@attach.save
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

   def destroy
      Post.find(params[:id]).destroy
      flash[:success] = "Post has been deleted"
      redirect_to posts_url
   end

   private

      def post_params
         params.require(:post).permit(:title, :info)
      end

      #Before filter

end
