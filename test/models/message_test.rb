require "test_helper"

class MessageTest < ActiveSupport::TestCase
  setup do
    @user1 = User.first
    @user2 = User.find(2)
    @admin = User.find(3)
    @room = Room.create(name:"messagetestroom",is_private:false)
  end

  test "messages created successfully" do
    message1 = @user1.messages.create(body:"test1", room_id:@room.id)
    message2 = @user1.messages.create(body:"test2", room_id:@room.id)
    assert_equal @room.messages.size, 2
  end

  test "admin can read messages but should not be able to send one in pm" do
    @dm = Room.create_private_room([@user1, @user2], "private_1_2")
    message1 = @user1.messages.create(body:"test1", room_id:@dm.id)
    message2 = @user2.messages.create(body:"test2", room_id:@dm.id)
    # testing that admin can access room elsewhere. this just tests that the admin cannot dm
    message3 = @admin.messages.create(body:"test3", room_id:@dm.id)
    assert_equal @dm.messages.size, 2
  end

end
