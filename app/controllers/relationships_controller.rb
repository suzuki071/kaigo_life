class RelationshipsController < ApplicationController

  def create
    @user = User.find(params[:following_id])
    current_user.follow(@user)
    
    following = current_user.relationships.build(follower_id: params[:user_id])
    following.save
    redirect_to request.referrer || root_path
  end

  def destroy
    @user = User.find(params[:id])
    current_user.unfollow(@user)
    
    following = current_user.relationships.find_by(follower_id: params[:user_id])
    following.destroy
    redirect_to request.referrer || root_path
  end

end
