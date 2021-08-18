class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "編集しました"
      redirect_to user_path(@user.id)
    else
      render 'edit'
    end
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
    params.require(:user).permit(:name, :introduction, :profile_image_id)
  end

end
