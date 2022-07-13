class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[show create]

  def index
    @events = Event.all.order(date: :asc).where('date > ?', DateTime.now).limit(9)
  end

  def new
    @events = Event.new
  end

  # GET /tweeets/1 or /tweeets/1.json
  def show
    @events = Event.find(params[:id])
    @going = @events.attendees.limit(6)
  end

  # POST /posts or /posts.json
  def create
    @events = current_user.events.build(event_params)

    respond_to do |format|
      if @events.save
        format.html { redirect_to root_path, location: @event }
      else
        flash.now[:alert] = @events.errors.full_messages.first
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    GoingToEvent.all.where(event_id: params[:id]).destroy_all
    Event.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: "Event removed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:title, :description, :date, :location)
    end
end
