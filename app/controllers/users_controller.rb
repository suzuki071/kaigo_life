class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end
  
  def following
    @user = User.find(params[:id])
    @users = @user.following
    render 'show'
  end
  
  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show'
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction)
  end

end
