require "test_helper"

class DealingControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get dealing_top_url
    assert_response :success
  end
end
