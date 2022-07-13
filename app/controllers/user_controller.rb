class UserController < ApplicationController
  before_action :authenticate_user!, only: %i[index show]

  def index
    @my_events = Event.joins(:going_to_event).where(going_to_events: {user_id: current_user.id}).or(Event.joins(:going_to_event).where(user_id: current_user.id))
  end

  def show
    @user_hosting = set_user.events.all.where('date > ?', DateTime.now)
    @user_going_to = Event.joins(:going_to_event).where(going_to_events: {user_id: set_user.id}).where('date > ?', DateTime.now)
    @username = set_user.username
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    User.find(params[:id])
  end
end
