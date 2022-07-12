class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @events = Event.new
  end

  # POST /posts or /posts.json
  def create
    @event = current_user.events.build(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to root_path, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:title, :description, :date, :location)
    end
end
