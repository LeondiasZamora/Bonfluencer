class ReviewsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @reviews = @user.reviews.order(created_at: :desc)
  end

  def home
    @user = User.find(params[:id])
    @review = Review.new
  end

  def new
    @review = Review.new
    @review.user = User.find(params[:user_id])
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @review = @user.reviews.new(review_params) # Associate review with the correct user
    @review.author = current_user # Set the current user as the author of the review

    current_user.update(points: current_user.points + 1)

    if @review.save
      redirect_to user_reviews_path(@user), notice: "You made someone happy today :)"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
