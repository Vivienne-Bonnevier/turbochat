require "test_helper"

class ParticipantTest < ActiveSupport::TestCase
  #create 3 users
  setup do
    # Admin User
    @user1 = User.create(email:"example1@example.com",password:"password",password_confirmation:"password",role_id:2)
    # Users
    @user2 = User.create(email:"example2@example.com",password:"password",password_confirmation:"password",role_id:1)
    @user3 = User.create(email:"example3@example.com",password:"password",password_confirmation:"password",role_id:1)
  end

  test "user 2 should try accessing a chat between user 1 and user 2 and be successful" do

  end

  test "user 3 should try accessing a chat between user 1 and user 2 and be unsuccessful" do

  end

  test "user 1 (admin) should try accessing a chat between user 2 and user 3 and be successful" do

  end

end
