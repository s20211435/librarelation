class HomeController < ApplicationController
  def main_top
    all_new_books = NewBook.all
    random_id_array = all_new_books.pluck(:id).shuffle[0]
    @random_new_books = all_new_books.where(id: random_id_array)

    
  end
end
