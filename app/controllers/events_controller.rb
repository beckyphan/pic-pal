class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
    @events = Event.all
    @movie = Movie.find_by_id(params[:movie_id])
    
    @movies = Movie.all
  end

  def create
    datetime_formatted = DateTime.new(
      datetime_params.values[0].to_i,
      datetime_params.values[1].to_i,
      datetime_params.values[2].to_i,
      datetime_params.values[3].to_i,
      datetime_params.values[4].to_i)

    @event = Event.create(event_params)

    if @event.update(datetime: datetime_params)
      redirect_to movie_path(@event.movie_id)
    else
      @event.destroy
      render "new"
    end
  end

  def show
    @event = Event.find_by_id(params[:id])
    @movie = Movie.find_by_id(@event.movie_id)
    @guestlists = Guestlist.all

    @comments = Comment.where(event_id: @event.id)
    @comment = Comment.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def event_params
    params.require(:event).permit(:title, :location, :host_id, :movie_id)
  end

  def datetime_params
    params.require(:event).permit("datetime(1i)", "datetime(2i)", "datetime(3i)", "datetime(4i)", "datetime(5i)")
  end
end
