class PrivateChatPolicy < ApplicationPolicy
  attr_reader :user, :room

  def initialize(user, room)
    @user = user
    @room = room
  end

  def show?
    user.admin? || participating_user
  end

  private
  # Find if the user is a participating user in the room (one of the two DMing users)
  def participating_user
    room.participants.where(user_id: user.id).first
  end
end