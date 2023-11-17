class NewBookSubController < ApplicationController
  def show_page
    @all_new_books = NewBook.all
  end
end
