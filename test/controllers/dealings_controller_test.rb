require "test_helper"

class DealingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dealing = dealings(:one)
  end

  test "should get index" do
    get dealings_url
    assert_response :success
  end

  test "should get new" do
    get new_dealing_url
    assert_response :success
  end

  test "should create dealing" do
    assert_difference('Dealing.count') do
      post dealings_url, params: { dealing: { author_name: @dealing.author_name, condition: @dealing.condition, isbn_number: @dealing.isbn_number, title: @dealing.title } }
    end

    assert_redirected_to dealing_url(Dealing.last)
  end

  test "should show dealing" do
    get dealing_url(@dealing)
    assert_response :success
  end

  test "should get edit" do
    get edit_dealing_url(@dealing)
    assert_response :success
  end

  test "should update dealing" do
    patch dealing_url(@dealing), params: { dealing: { author_name: @dealing.author_name, condition: @dealing.condition, isbn_number: @dealing.isbn_number, title: @dealing.title } }
    assert_redirected_to dealing_url(@dealing)
  end

  test "should destroy dealing" do
    assert_difference('Dealing.count', -1) do
      delete dealing_url(@dealing)
    end

    assert_redirected_to dealings_url
  end
end
