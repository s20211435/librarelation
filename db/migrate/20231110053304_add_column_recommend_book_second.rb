class AddColumnRecommendBookSecond < ActiveRecord::Migration[6.1]
  def change
    add_column :recommend_books, :id_coppy, :integer
  end
end
