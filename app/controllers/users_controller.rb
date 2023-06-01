class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @users = User.all_except(current_user)

    @room = Room.new
    @rooms = Room.public_rooms
    @room_name = get_name(@user, current_user)
    @single_room = Room.where(name: @room_name).first || Room.create_private_room([@user, current_user], @room_name)

    authorize @single_room

    @message = Message.new
    message_query = @single_room.messages.order(created_at: :desc)
    @pagy, messages = pagy(message_query, items: 50)
    @messages = messages.reverse
  end

  private
  def get_name(user1, user2)
    user = [user1, user2].sort
    "private_#{user[0].id}_#{user[1].id}"
  end

end
