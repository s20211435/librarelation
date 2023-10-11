class CreateRankings < ActiveRecord::Migration[6.1]
  def change
    create_table :rankings do |t|
      t.string :isbn_number
      t.string :title
      t.string :author_name
      t.integer :book_rank

      t.timestamps
    end
  end
end
