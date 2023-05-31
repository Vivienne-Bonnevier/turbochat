require "test_helper"

class RoomPolicyTest < ActionDispatch::IntegrationTest
#create 3 users
setup do
  # Admin User
  @user1 = User.create(id:1,email:"example1@example.com",password:"password",password_confirmation:"password",role_id:2)
  # Users
  @user2 = User.create(id:2,email:"example2@example.com",password:"password",password_confirmation:"password",role_id:1)
  @user3 = User.create(id:3,email:"example3@example.com",password:"password",password_confirmation:"password",role_id:1)

  #create rooms
  @room1 = Room.create_private_room([@user1, @user2], "private_1_2")
  @room2 = Room.create_private_room([@user2, @user3], "private_2_3")
end

test "user 2 should try accessing a chat (via users) between user 1 and user 2 and be successful" do
  sign_in @user2
  get user_url(@user1)
  assert_response :success
end

test "user 2 should try accessing a chat (via rooms) between user 1 and user 2 and be successful" do
  sign_in @user2
  get room_url(@room1)
  assert_response :success
end

# this needs to find some way to ensure its a bad response
test "user 3 should try accessing a chat (via rooms) between user 1 and user 2 and be unsuccessful" do
  sign_in @user3
  assert_raises(Pundit::NotAuthorizedError) {
    get room_url(@room1)
  }
end

test "user 1 (admin) should try accessing a chat (via rooms) between user 2 and user 3 and be successful" do
  sign_in @user1
  get room_url(@room2)
  assert_response :success
end

end
