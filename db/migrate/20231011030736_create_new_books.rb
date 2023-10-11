class CreateNewBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :new_books do |t|
      t.string :isbn_number
      t.string :title
      t.string :author_name
      t.date :arrival_day
      t.integer :lending
      t.integer :book_number
      t.string :genre

      t.timestamps
    end
  end
end
