class GuestlistsController < ApplicationController

  def create
    @attendee = Guestlist.create(attendee_params)

    redirect_to event_path(@attendee.event_id)
  end

  def destroy
  end

  private

  def attendee_params
    params.require(:guestlist).permit(:event_id, :attendee_id)
  end

end
