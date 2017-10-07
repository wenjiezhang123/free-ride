class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :change_status]
  before_action :correct_user, only: [:edit, :update, :change_status]


  def user_params
    params.require(:user).permit(:name, :nickname, :password, :email, :phone, :is_driver?)
  end

  def index
  end

  def change_status
    @user = User.find(params[:id])

    if @user.valid?
      @user.update_attributes(user_params)
      render :json => { :updated? => true, :status => 200, :message => "Status has been changed", :data => @user}
    else
      render :json => {:data => nil, :status => 200}
    end
  end

  def new
  end

  def show
  end

  def update
    if !User.find_by(email: "#{params[:user][:email]}").nil?
      if params[:id] != User.find_by(email: "#{params[:user][:email]}").id.to_s
        @email_existed = true
      end
    else
      @email_existed = false
    end

    @user = User.find(params[:id])

    if @user.valid? && !@email_existed
      @user.update_attributes(user_params)
      render :json => { :updated? => true, :status => 200, :message => "Successful update!", :data => @user }
    elsif @user.valid?
      render :json => { :updated? => false, :status => 200, :message => "Email entered has been used!", :data => @user }
    else
      render :json => { :data => nil, :status => 200, :message => "Invalid user id!" }
    end
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

  def logged_in_user
    render :json => { :updated? => false, :status => 200, :message => "Please log in!" } unless logged_in?
  end

  def correct_user
    @user = User.find(params[:id])
    render :json => { :updated? => false, :status => 200, :message => "You are not allowed edit other users." } unless @user == current_user
  end

end
