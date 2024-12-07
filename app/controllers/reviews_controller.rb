class ReviewsController < ApplicationController
  def index
    @reviews = current_user.reviews.order(created_at: :desc)
  end

  def home
    @review = Review.new
  end

  def new
    @review = Review.new
    @review.user = User.first
  end

  def create
    @review = Review.new(review_params)
    @review.author = current_user
    @review.user = User.first

    if @review.save
      redirect_to home_path, notice: "You made someone happy today :)"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
