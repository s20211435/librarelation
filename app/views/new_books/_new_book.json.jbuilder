json.extract! new_book, :id, :isbn_number, :title, :author_name, :arrival_day, :lending, :book_number, :genre, :created_at, :updated_at
json.url new_book_url(new_book, format: :json)
