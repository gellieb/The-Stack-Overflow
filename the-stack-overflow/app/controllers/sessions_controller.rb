class SessionsController < ApplicationController

  def new
    render 'new'
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path
    else
      flash[:danger] = 'Invalid username/password combination' # Not quite right!
      render 'new'
    end
  end

    def destroy
     log_out
     redirect_to root_path
   end
end
