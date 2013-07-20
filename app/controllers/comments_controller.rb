class CommentsController < ApplicationController
   before_action :signed_in_user, only: [:create, :destroy]

   def index
   end

   def create
      @comment = current_post.comments.build(comments_params)
      if @comment.save
         flash[:success] = "Comment Made"
         redirect_to post_url
      else
         render 'static_pages/home'
      end
   end

   def destroy
   end

   private

      def comments_params
         params.require(:comment).permit(:content)
      end

end