class AddColumnRanking < ActiveRecord::Migration[6.1]
  def change
    add_column :rankings, :genre, :string
    add_column :rankings, :lending, :integer
    add_column :rankings, :book_number, :integer
  end
end
