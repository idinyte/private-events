class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @my_events = current_user.events.all
  end

  def show
    @user_events = set_user.events.all
    if current_user == set_user
      @username = 'My'
    else
      @username = set_user.username
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    User.find(params[:id])
  end
end
