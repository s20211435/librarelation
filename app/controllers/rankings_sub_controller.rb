class RankingsSubController < ApplicationController
  def show_page
    @first_rankings = Ranking.find_by(book_rank: '1')
    @second_rankings = Ranking.find_by(book_rank: '2')
    @third_rankings = Ranking.find_by(book_rank: '3')
    @force_rankings = Ranking.find_by(book_rank: '4')
    @fifth_rankings = Ranking.find_by(book_rank: '5')
  end
end
