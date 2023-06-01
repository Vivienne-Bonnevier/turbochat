require "test_helper"

class ParticipantTest < ActiveSupport::TestCase

  setup do
  @user1 = User.create(id:1,email:"example1@example.com",password:"password",password_confirmation:"password",role_id:1)
  @user2 = User.create(id:2,email:"example2@example.com",password:"password",password_confirmation:"password",role_id:1)

  @room1 = Room.create_private_room([@user1, @user2], "private_1_2")
  end

  test "private chat should have two participants" do
    assert_equal @room1.participants.size, 2
  end

  test "private chat should have user1 as a participant" do
    assert_equal @room1.participants.where("user_id = '#{@user1.id}'").first.user, @user1
  end

  test "private chat should have user2 as a participant" do
    assert_equal @room1.participants.where("user_id = '#{@user2.id}'").first.user, @user2
  end

  test "private chat should have different users as participants" do
    assert_not_equal @room1.participants.first, @room1.participants.last
  end

end
