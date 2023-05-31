class RoomPolicy < ApplicationPolicy
  attr_reader :user, :room

  def initialize(user, room)
    @user = user
    @room = room
  end

  def show?
    if room.is_private
      user.admin? || room.participants.where(user_id: user.id).first
    end
  end
end