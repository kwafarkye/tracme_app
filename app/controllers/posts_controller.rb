class PostsController < ApplicationController
   before_action :signed_in_user, only: [:edit, :update, :create, :new]
   before_action :admin_user, only: :destroy

   def index
      @posts = Post.paginate(page: params[:page], per_page: 3).order('id DESC')
   end

   def show
      #@post = Post.all
      @post = Post.find(params[:id])
      @current = current_user
   end

   def new
      #@post = Post.new(post_params)
      #@post = Post.build
      #@post.build_photo
   end

   def create
      @post = Post.new(post_params)
      @post.post_image = post_image.build(params[:post_image])
      #@photo = post_image.build(params[:post_image])
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

   def destroy
      Post.find(params[:id]).destroy
      flash[:success] = "Post has been deleted"
      redirect_to posts_url
   end

   private

      def post_params
         params.require(:post).permit(:title, :info, post_image_attributes: [:image])
      end

      #Before filter
      def signed_in_user
         unless signed_in?
            store_location
            redirect_to signin_url, notice: "You must be signed in to complete this action.."
         end
      end

      def admin_user
         unless current_user.admin?
            redirect_to root_url, notice: "You must be an admin to complete this task"
         end
      end

end
