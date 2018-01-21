class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def destroy
    @user = current_user.id
    @user.destroy
    
    redirect_to users_url
  end
  
  def follow
    @user = User.find(params[:user_id])
    current_user.follow(@user)
    redirect_to users_path
  end
  
  def unfollow
    @user = User.find(params[:user_id])
    current_user.stop_following(@user)
    redirect_to users_path
  end
end
