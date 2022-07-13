class UserController < ApplicationController
  before_action :authenticate_user!, only: %i[index show]

  def index
    @my_events = current_user.events.all
  end

  def show
    @user_events = set_user.events.all
    @username = set_user.username
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    User.find(params[:id])
  end
end
