json.array!(@books) do |book|
  json.extract! book, :name, :description, :rating, :times_rated
  json.url book_url(book, format: :json)
end
