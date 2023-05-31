require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user1 = User.create(id:1,email:"example1@example.com",password:"password",password_confirmation:"password",role_id:1)
    sign_in @user1
    @user2 = User.create(id:2,email:"example2@example.com",password:"password",password_confirmation:"password",role_id:1)
  end
  test "should get show" do
    get user_url(@user2)
    assert_response :success
  end
end
