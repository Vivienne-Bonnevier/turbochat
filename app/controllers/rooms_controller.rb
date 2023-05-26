class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :index_setup, only: [:index, :show]

  def index
  end

  def show
    @single_room = Room.find(params[:id]) if params[:id]
    @message = Message.new
    @messages = @single_room.messages.order(created_at: :asc)
  end

  def create
    @room = Room.create(room_params)
  end

  private
  def room_params
    params.require(:room).permit(:name)
  end

  def index_setup
    @room = Room.new
    @rooms = Room.public_rooms
    @users = User.all_except(current_user)
  end
end
