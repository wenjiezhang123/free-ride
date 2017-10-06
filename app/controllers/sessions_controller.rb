class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email]) 
    if user && (user.password == params[:session][:password])
      log_in user
      render :json => {:login_status => true,:status => 200, :message => "Successful log in!"}
    else
      render :json => {:login_status => false, :status => 200, :message => "Invalid email/password combination!"}
    end
  end
  
  def destroy
      log_out
      render :json => {:login_status => false, :status => 200, :message => "Just log out!"}
  end

end