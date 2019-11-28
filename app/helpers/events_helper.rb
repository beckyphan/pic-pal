module EventsHelper

  def event_movie(movie_id)
    @movie_name = Movie.find_by_id(movie_id).name
  end
end
