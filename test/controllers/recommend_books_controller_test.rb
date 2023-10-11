require "test_helper"

class RecommendBooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recommend_book = recommend_books(:one)
  end

  test "should get index" do
    get recommend_books_url
    assert_response :success
  end

  test "should get new" do
    get new_recommend_book_url
    assert_response :success
  end

  test "should create recommend_book" do
    assert_difference('RecommendBook.count') do
      post recommend_books_url, params: { recommend_book: { ISBN_number: @recommend_book.ISBN_number, author_name: @recommend_book.author_name, recommend: @recommend_book.recommend, title: @recommend_book.title } }
    end

    assert_redirected_to recommend_book_url(RecommendBook.last)
  end

  test "should show recommend_book" do
    get recommend_book_url(@recommend_book)
    assert_response :success
  end

  test "should get edit" do
    get edit_recommend_book_url(@recommend_book)
    assert_response :success
  end

  test "should update recommend_book" do
    patch recommend_book_url(@recommend_book), params: { recommend_book: { ISBN_number: @recommend_book.ISBN_number, author_name: @recommend_book.author_name, recommend: @recommend_book.recommend, title: @recommend_book.title } }
    assert_redirected_to recommend_book_url(@recommend_book)
  end

  test "should destroy recommend_book" do
    assert_difference('RecommendBook.count', -1) do
      delete recommend_book_url(@recommend_book)
    end

    assert_redirected_to recommend_books_url
  end
end
