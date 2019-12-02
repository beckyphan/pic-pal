module EventsHelper

  def event_movie(movie_id)
    @movie_name = Movie.find_by_id(movie_id).name
  end

  def commenting_username(user_id)
    @user = User.find_by_id(user_id)
    @user.username
  end
end
