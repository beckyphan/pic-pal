class ToWatchesController < ApplicationController

  def create
    binding.pry
    @watch = ToWatch.create(to_watch_params)
    redirect_to movie_path(@watch.movie_id)
  end

  def update
    binding.pry
    @towatch = ToWatch.where(update_params)
    redirect_to movie_path(@towatch.movie_id)
  end

  private

  def to_watch_params
    params.require(:to_watch).permit(:watched, :movie_id, :user_id)
  end

  def update_params
    params.require(:to_watch).permit(:movie_id, :user_id)
  end
end
