class RelationshipsController < ApplicationController

  def create
    following = current_user.relationships.build(follower_id: params[:user_id])
    following.save
    @users = User.find(params[:user_id])
  end

  def destroy
    following = current_user.relationships.find_by(follower_id: params[:user_id])
    following.destroy
    @users = User.find(params[:user_id])
  end

end
