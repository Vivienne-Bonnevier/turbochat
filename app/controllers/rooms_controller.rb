class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :index_setup, only: [:index, :show]

  def index
  end

  def show
    @single_room = Room.find(params[:id]) if params[:id]

    authorize @single_room

    @message = Message.new
    message_query = @single_room.messages.order(created_at: :desc)
    @pagy, messages = pagy(message_query, items: 20)
    @messages = messages.reverse
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
