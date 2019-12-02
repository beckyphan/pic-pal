class GuestlistsController < ApplicationController

  def create
    @attendee = Guestlist.create(attendee_params)

    redirect_to event_path(@attendee.event_id)
  end

  def destroy
    @attendee = Guestlist.find_by_id(params[:id])
    @event = Event.find_by_id(@attendee.event_id)
    @attendee.destroy

    redirect_to event_path(@event)
  end

  private

  def attendee_params
    params.require(:guestlist).permit(:event_id, :attendee_id)
  end

end
