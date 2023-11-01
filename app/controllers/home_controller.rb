class HomeController < ApplicationController
  def main_top
    all_new_books = NewBook.all
    random_id_array = all_new_books.pluck(:id).shuffle[0]
    @random_new_books = all_new_books.where(id: random_id_array)

    all_recommend_books = RecommendBook.all
    random_id_array = all_recommend_books.pluck(:id).shuffle[0]
    @random_recommend_books = all_recommend_books.where(id: random_id_array)
    @recommend_books = all_recommend_books.
  end
  
  
  
end
