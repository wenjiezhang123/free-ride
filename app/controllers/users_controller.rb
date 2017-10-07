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
    @user = User.find_by(email: "#{params[:user][:email]}")
    #@nickname_existed = !User.find_by(nickname: "#{params[:user][:nickname]}").nil?
    if @user
      render :json => {:data => @user, :status => 200, :email_already_exist => true } #:nickname_already_exist => @nickname_existed}
    else
      @user = User.create(user_params)
      if @user.valid?
        render :json => {:data => @user, :status => 200, :email_already_exist => false } #:nickname_already_exist => @nickname_existed }
      else
        render :json => {:data => nil, :status => 200}
      end
    end
  end

end
