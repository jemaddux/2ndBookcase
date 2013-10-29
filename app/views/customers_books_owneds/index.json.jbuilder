json.array!(@customers_books_owneds) do |customers_books_owned|
  json.extract! customers_books_owned, :customer_id, :book_id
  json.url customers_books_owned_url(customers_books_owned, format: :json)
end
