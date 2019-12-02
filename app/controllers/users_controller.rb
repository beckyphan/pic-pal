class UsersController < ApplicationController

  def show
    @user = current_user

    @hosted_events = @user.hosted_events
    @attended_events = @user.attended_events

    @reviews = @user.movie_reviews
    @movies_reviewed = @user.reviewed_movies
  end

end
