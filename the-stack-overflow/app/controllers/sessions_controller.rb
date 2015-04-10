class SessionsController < ApplicationController

  def new
    render 'new'
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_url

    else
      flash[:danger] = 'Invalid username/password combination' # Not quite right!
      render 'new'
    end

    def destroy
     log_out
     redirect_to root_url
   end
end
