require "application_system_test_case"

class NewBooksTest < ApplicationSystemTestCase
  setup do
    @new_book = new_books(:one)
  end

  test "visiting the index" do
    visit new_books_url
    assert_selector "h1", text: "New Books"
  end

  test "creating a New book" do
    visit new_books_url
    click_on "New New Book"

    fill_in "Arrival day", with: @new_book.arrival_day
    fill_in "Author name", with: @new_book.author_name
    fill_in "Book number", with: @new_book.book_number
    fill_in "Genre", with: @new_book.genre
    fill_in "Isbn number", with: @new_book.isbn_number
    fill_in "Lending", with: @new_book.lending
    fill_in "Title", with: @new_book.title
    click_on "Create New book"

    assert_text "New book was successfully created"
    click_on "Back"
  end

  test "updating a New book" do
    visit new_books_url
    click_on "Edit", match: :first

    fill_in "Arrival day", with: @new_book.arrival_day
    fill_in "Author name", with: @new_book.author_name
    fill_in "Book number", with: @new_book.book_number
    fill_in "Genre", with: @new_book.genre
    fill_in "Isbn number", with: @new_book.isbn_number
    fill_in "Lending", with: @new_book.lending
    fill_in "Title", with: @new_book.title
    click_on "Update New book"

    assert_text "New book was successfully updated"
    click_on "Back"
  end

  test "destroying a New book" do
    visit new_books_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "New book was successfully destroyed"
  end
end
