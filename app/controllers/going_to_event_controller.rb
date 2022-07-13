class GoingToEventController < ApplicationController
  def attend
    @event = Event.find(params[:id])
    @attending = GoingToEvent.new
    @attending.event_id = @event.id
    @attending.user_id = current_user.id
    if @attending.save
      flash[:notice] = "Enrolled"
    else
      flash[:alert] = "Something went wrong"
    end
    redirect_to @event
  end

  def destroy
    @event = Event.find(params[:id])
    @event.attendees.delete(current_user)
    redirect_to @event
  end
end
