class AttachmentsController < ApplicationController
   before_action :signed_in_user, only: [:create, :destroy]

   def index
   end

   def create
      @attachment = current_post.attachments.build(attachments_params)
      if @attachment.save
         flash[:success] = "Attachments Added"
         redirect_to root_url
      else
         render 'static_pages/home'
      end
   end

   def destroy
   end

   private

      def attachments_params
         params.require(:attachment).permit(:image, :caption)
      end

end