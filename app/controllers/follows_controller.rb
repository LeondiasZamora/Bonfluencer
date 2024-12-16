class FollowsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @followers = User.where(followed: @user)
  end

  def create
    @user = User.find(params[:user_id])
    @user.following.create(followed: current_user)
    redirect_to @user
  end

  def destroy
    @user = User.find(params[:user_id]) # User to unfollow
    @user.following.find_by(followed: current_user).destroy # Remove the follow relationship
    redirect_to @user
  end

  def followers
    @user = User.find(params[:user_id])
  end
end
