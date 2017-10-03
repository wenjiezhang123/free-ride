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
    @user = User.create(user_params)
    if @user.valid?
      render :json => {:data => @user, :status => 200}
    else
      render :json => {:data => nil, :status => 200}
    end
  end
end
