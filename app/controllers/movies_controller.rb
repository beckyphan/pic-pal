class MoviesController < ApplicationController
  def home
  end

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path
    else
      render "create"
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def delete
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :genre, :image_url)
  end
end
