class UsersController < ApplicationController

  def user_params
    params.require(:user).permit(:name, :nickname, :password, :email, :phone, :is_driver?)
  end

  def index
  end

  def new

  end

  def show
  end

  def edit
    
  end

  def update
  end

  def destroy
  end

  # register a new user
  def create
    @email_existed = !User.find_by(email: "#{params[:user][:email]}").nil?
    #@nickname_existed = !User.find_by(nickname: "#{params[:user][:nickname]}").nil?
    @user = User.create(user_params)
    
    if @user.valid? && !@email_existed #&& !@nickname_existed
      render :json => {:data => @user, :status => 200, :email_already_exist => @email_existed } #:nickname_already_exist => @nickname_existed}
    elsif @user.valid?
      @user.destroy
      render :json => {:data => @user, :status => 200, :email_already_exist => @email_existed } #:nickname_already_exist => @nickname_existed }
    else
      @user.destroy
      render :json => {:data => nil, :status => 200}
    end
  end
  
end
