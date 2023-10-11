json.extract! recommend_book, :id, :ISBN_number, :title, :author_name, :recommend, :created_at, :updated_at
json.url recommend_book_url(recommend_book, format: :json)
