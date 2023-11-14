class AddColumnRecommendBook < ActiveRecord::Migration[6.1]
  def change
    add_column :recommend_books, :bookcover, :string
  end
end
