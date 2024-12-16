class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    # @users = User.joins(:following).where(following: { followed_id: current_user.id }).to_a
    all_users = User.all
    followed_users_array = []

    all_users.each do |user|
      user_rev = user.reviews
      user.following.where(followed_id: current_user.id).each do |follow|
        followed_user = follow.followed
        followed_user.define_singleton_method(:reviews) { user_rev }
        followed_users_array << followed_user
      end
    #   user_rev = user.reviews
    #   followed_users_array.concat(user.following.where(followed_id: current_user.id).to_a)
    end
    @users = followed_users_array
    @users = [User.first] if @users.empty?
  end
end
