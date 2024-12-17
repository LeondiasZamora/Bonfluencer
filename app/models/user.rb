class User < ApplicationRecord
  has_one_attached :photo
  has_many :reviews
  has_many :followers, class_name: 'Follow', foreign_key: 'followed_id', dependent: :destroy
  # Users that this user is following
  has_many :following, class_name: 'Follow', foreign_key: 'follower_id', dependent: :destroy

  # Convenience methods for easier access
  has_many :followers_users, through: :followers, source: :follower
  has_many :following_users, through: :following, source: :followed
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
