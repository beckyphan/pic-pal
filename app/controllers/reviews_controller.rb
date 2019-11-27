class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def edit
    @review = Review.find_by_id(params[:id])
    @movie = Movie.find_by_id(@review.movie_id)
  end

  def create
    @review = Review.new(review_params)

    if @review.save!
      redirect_to movie_path(@review.movie_id)
    else
      render "movie/new"
    end
  end

  def update
  end

  private

  def review_params
    params.require(:review).permit(:reviewer_id, :movie_id, :title, :description, :rating)
  end
end
