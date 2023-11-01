class HomeController < ApplicationController
  def main_top
    all_new_books = NewBook.all
    random_id_array = all_new_books.pluck(:id).shuffle[0]
    @random_new_books = all_new_books.where(id: random_id_array)

    all_rankings = Ranking.all
    @first_rankings = Ranking.where(book_rank: '1')
    @second_rankings = Ranking.where(book_rank: '2')
    @third_rankings = Ranking.where(book_rank: '3')
  end
end
