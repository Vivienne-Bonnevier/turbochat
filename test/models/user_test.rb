require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    # Admin User
    @user1 = User.create(email:"example1@example.com",password:"password",password_confirmation:"password",role_id:2)
    # Moderator User
    @user2 = User.create(email:"example2@example.com",password:"password",password_confirmation:"password",role_id:3)
    # Other Users
    @user3 = User.create(email:"example3@example.com",password:"password",password_confirmation:"password",role_id:1)
    @user4 = User.create(email:"example4@example.com",password:"password",password_confirmation:"password",role_id:1)
  end

  test "user1 is an admin" do
    assert @user1.admin?
  end

  test "user2 is not an admin" do
    assert_not @user2.admin?
  end

  test "user3 is not an admin" do
    assert_not @user3.admin?
  end

  test "user1 is staff" do
    assert @user1.staff?
  end

  test "user2 is staff" do
    assert @user2.staff?
  end

  test "user3 is not staff" do
    assert_not @user3.staff?
  end

end
