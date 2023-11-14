require "test_helper"

class NewBookSubControllerTest < ActionDispatch::IntegrationTest
  test "should get show_page" do
    get new_book_sub_show_page_url
    assert_response :success
  end
end
