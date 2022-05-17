require "test_helper"

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get users" do
    get users_path
    assert_response :success
  end
end
