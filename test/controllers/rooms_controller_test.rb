require "test_helper"

class RoomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user1 = User.create(email:"example1@example.com",password:"password",password_confirmation:"password",role_id:1)
    sign_in @user1
  end
  test "should get index" do
    get rooms_path
    assert_response :success
  end
end
