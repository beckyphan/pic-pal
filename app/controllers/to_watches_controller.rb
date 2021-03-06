class ToWatchesController < ApplicationController

  def create
    @watch = ToWatch.create(to_watch_params)
    redirect_to movie_path(@watch.movie_id)
  end

  def update
    @towatch = ToWatch.where(movie_id: params[:to_watch][:movie_id], user_id: current_user.id)
    @updated = @towatch.first
    @updated.watched = params[:to_watch][:watched]
    @updated.save!

    redirect_to movie_path(@towatch.first.movie_id)
  end

  private

  def to_watch_params
    params.require(:to_watch).permit(:watched, :movie_id, :user_id)
  end

  def watched_param
    params.require(:to_watch).permit(:watched, :movie_id)
  end
end
