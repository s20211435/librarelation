require "test_helper"

class NewBooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @new_book = new_books(:one)
  end

  test "should get index" do
    get new_books_url
    assert_response :success
  end

  test "should get new" do
    get new_new_book_url
    assert_response :success
  end

  test "should create new_book" do
    assert_difference('NewBook.count') do
      post new_books_url, params: { new_book: { arrival_day: @new_book.arrival_day, author_name: @new_book.author_name, book_number: @new_book.book_number, genre: @new_book.genre, isbn_number: @new_book.isbn_number, lending: @new_book.lending, title: @new_book.title } }
    end

    assert_redirected_to new_book_url(NewBook.last)
  end

  test "should show new_book" do
    get new_book_url(@new_book)
    assert_response :success
  end

  test "should get edit" do
    get edit_new_book_url(@new_book)
    assert_response :success
  end

  test "should update new_book" do
    patch new_book_url(@new_book), params: { new_book: { arrival_day: @new_book.arrival_day, author_name: @new_book.author_name, book_number: @new_book.book_number, genre: @new_book.genre, isbn_number: @new_book.isbn_number, lending: @new_book.lending, title: @new_book.title } }
    assert_redirected_to new_book_url(@new_book)
  end

  test "should destroy new_book" do
    assert_difference('NewBook.count', -1) do
      delete new_book_url(@new_book)
    end

    assert_redirected_to new_books_url
  end
end
