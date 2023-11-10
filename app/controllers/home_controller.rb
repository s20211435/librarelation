class HomeController < ApplicationController
  def main_top
    all_new_books = NewBook.all
    random_id_array = all_new_books.pluck(:id).shuffle[0]
    @random_new_books = all_new_books.where(id: random_id_array)

    all_recommend_books = RecommendBook.all
    random_id_array = all_recommend_books.pluck(:id).shuffle[0]
    @random_recommend_books = all_recommend_books.where(id: random_id_array)
    
    @all_recommend_books = RecommendBook.all

    @first_rankings = Ranking.find_by(book_rank: '1')
    @second_rankings = Ranking.find_by(book_rank: '2')
    @third_rankings = Ranking.find_by(book_rank: '3')
  end
  
  
  
end
