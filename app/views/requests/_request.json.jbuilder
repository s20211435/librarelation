json.extract! request, :id, :isbn_number, :title, :author_name, :reason, :grade, :class, :number, :name, :created_at, :updated_at
json.url request_url(request, format: :json)
