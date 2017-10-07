class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]
  

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
    @user = User.find(params[:id])
  end

  def update
    @email_existed = !User.find_by(email: "#{params[:user][:email]}").nil?
    @user = User.find(params[:id])
    
    if @user.valid? && !@email_existed
      @user.update_attributes(user_params)
      render :json => { :updated? => true, :status => 200, :message => "Successful update!", :data => @user}
    else
      render :json => { :updated? => false, :status => 200, :message => "Email entered has been used!", :data => @user}
    end
  end

  def destroy
  end

  # register a new user
  def create
    @email_existed = !User.find_by(email: "#{params[:user][:email]}").nil?
    #@nickname_existed = !User.find_by(nickname: "#{params[:user][:nickname]}").nil?
    @user = User.create(user_params)
    
    if @user.valid? && !@email_existed #&& !@nickname_existed
      log_in @user
      render :json => {:data => @user, :status => 200, :email_already_exist => @email_existed } #:nickname_already_exist => @nickname_existed}
    elsif @user.valid?
      @user.destroy
      render :json => {:data => @user, :status => 200, :email_already_exist => @email_existed } #:nickname_already_exist => @nickname_existed }
    else
      @user.destroy
      render :json => {:data => nil, :status => 200}
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
