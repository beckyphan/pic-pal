class MoviesController < ApplicationController
  def home
  end

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def edit
  end

  def update
  end

  def create
  end

  def show
  end

  def delete
  end
end
