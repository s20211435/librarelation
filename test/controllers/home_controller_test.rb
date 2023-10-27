require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get main_top" do
    get home_main_top_url
    assert_response :success
  end
end
