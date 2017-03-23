class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:name] = @user.username
      session[:user_id] = @user.id
      redirect_to '/posts'
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to :back
    end
  end

  def login
    @user = User.find_by(username: params[:username], password: params[:password])
    if @user
      session[:name] = @user.username
      session[:user_id] = @user.id
      redirect_to '/posts'
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to :back
    end
  end

  def logout
    session.clear
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
