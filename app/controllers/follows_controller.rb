class FollowsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    current_user.following.create(followed: @user)
    redirect_to @user
  end

  def destroy
    @user = User.find(params[:user_id]) # User to unfollow
    current_user.following.find_by(followed: @user).destroy # Remove the follow relationship
    redirect_to @user
  end
end
