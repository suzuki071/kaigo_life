class RelationshipsController < ApplicationController

  def create
    following = current_user.relationships.build(follower_id: params[:user_id])
    following.save

    # @user = User.find(params[:following_id])
    # current_user.follow(@user)
    redirect_to request.referrer || root_path
  end

  def destroy
    following = current_user.relationships.find_by(follower_id: params[:user_id])
    following.destroy

    # @user = User.find(params[:id])
    # current_user.unfollow(@user)

    redirect_to request.referrer || root_path
  end

end
