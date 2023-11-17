require "test_helper"

class RankingsSubControllerTest < ActionDispatch::IntegrationTest
  test "should get show_page" do
    get rankings_sub_show_page_url
    assert_response :success
  end
end
