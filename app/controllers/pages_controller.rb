class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    unless current_user.nil?
    # @users = User.joins(:following).where(following: { followed_id: current_user.id }).to_a
      all_users = User.all
      followed_users_hash = {}

      all_users.each do |user|
        user_rev = user.reviews.where('created_at <= ?', 2.days.ago)
        user.following.where(follower_id: current_user.id).each do |follow|
          followed_user = follow.followed

          # Speichere die Reviews in einem Hash, statt sie als Singleton-Methode zu definieren
          followed_users_hash[followed_user] = user_rev
        end
      end

      # Extrahiere nur die User (Keys) aus dem Hash
      @users = followed_users_hash.keys

      # Default zu User.first, falls keine User gefunden wurden
      @users = [User.first] if @users.empty?
    end
  end
end
