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

  def show
    @movie = Movie.find_by_id(params[:id])
    @events= Event.all
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :genre, :image_url)
  end
end
