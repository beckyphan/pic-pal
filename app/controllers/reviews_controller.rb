class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def edit
  end

  def create
  end

  def update
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :movie_id, :title, :description, :rating)
  end 
end
