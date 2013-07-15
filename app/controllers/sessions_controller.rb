class SessionsController < ApplicationController
   def new
   end

   def create
      user = User.find_by(email: params[:session][:email])
      if user && user.authenticate(params[:session][:password])
         #Sign in user and redirect to the Posts page
         sign_in user
         redirect_back_or root_url
      else
         #Create an error message and rerender sign in form
         flash.now[:error] = 'Invalid email/password combination'
         render 'new'
      end
   end

   def destroy
      sign_out
      redirect_to root_url
   end

end
