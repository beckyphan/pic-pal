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
    @events = []
    @events << Event.find_by(movie_id: @movie.id)

    @watched = ToWatch.where(user_id: current_user.id, movie_id: @movie.id)
    @new_watch = ToWatch.new
    @update_watched = @watched.first
  end

  def edit
    @movie = Movie.find_by_id(params[:id])
  end

  def update
    if @movie.update!(movie_params)
      redirect_to movie_path(@movie)
    else
      render "edit"
    end
  end

  def destroy
    @movie = Movie.find_by_id(params[:id])
    # consider dependencies e.g. events, reviews, etc.
    flash[:message] = "You have deleted #{@movie.name}."
    @movie.destroy
    redirect_to movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :genre, :image_url)
  end
end
