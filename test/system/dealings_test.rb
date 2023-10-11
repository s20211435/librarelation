require "application_system_test_case"

class DealingsTest < ApplicationSystemTestCase
  setup do
    @dealing = dealings(:one)
  end

  test "visiting the index" do
    visit dealings_url
    assert_selector "h1", text: "Dealings"
  end

  test "creating a Dealing" do
    visit dealings_url
    click_on "New Dealing"

    fill_in "Author name", with: @dealing.author_name
    fill_in "Condition", with: @dealing.condition
    fill_in "Isbn number", with: @dealing.isbn_number
    fill_in "Title", with: @dealing.title
    click_on "Create Dealing"

    assert_text "Dealing was successfully created"
    click_on "Back"
  end

  test "updating a Dealing" do
    visit dealings_url
    click_on "Edit", match: :first

    fill_in "Author name", with: @dealing.author_name
    fill_in "Condition", with: @dealing.condition
    fill_in "Isbn number", with: @dealing.isbn_number
    fill_in "Title", with: @dealing.title
    click_on "Update Dealing"

    assert_text "Dealing was successfully updated"
    click_on "Back"
  end

  test "destroying a Dealing" do
    visit dealings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dealing was successfully destroyed"
  end
end
