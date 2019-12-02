class UsersController < ApplicationController

  def show
    @user = current_user
    binding.pry
    @hosted_events = @user.hosted_events
    @attended_events = @user.attended_events
    @reviews = @user.movie_reviews
  end

end
