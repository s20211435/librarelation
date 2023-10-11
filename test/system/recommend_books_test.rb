require "application_system_test_case"

class RecommendBooksTest < ApplicationSystemTestCase
  setup do
    @recommend_book = recommend_books(:one)
  end

  test "visiting the index" do
    visit recommend_books_url
    assert_selector "h1", text: "Recommend Books"
  end

  test "creating a Recommend book" do
    visit recommend_books_url
    click_on "New Recommend Book"

    fill_in "Isbn number", with: @recommend_book.ISBN_number
    fill_in "Author name", with: @recommend_book.author_name
    fill_in "Recommend", with: @recommend_book.recommend
    fill_in "Title", with: @recommend_book.title
    click_on "Create Recommend book"

    assert_text "Recommend book was successfully created"
    click_on "Back"
  end

  test "updating a Recommend book" do
    visit recommend_books_url
    click_on "Edit", match: :first

    fill_in "Isbn number", with: @recommend_book.ISBN_number
    fill_in "Author name", with: @recommend_book.author_name
    fill_in "Recommend", with: @recommend_book.recommend
    fill_in "Title", with: @recommend_book.title
    click_on "Update Recommend book"

    assert_text "Recommend book was successfully updated"
    click_on "Back"
  end

  test "destroying a Recommend book" do
    visit recommend_books_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Recommend book was successfully destroyed"
  end
end
