json.extract! book, :id, :title, :author, :page_count, :published_on, :created_at, :updated_at
json.url book_url(book, format: :json)
