json.array!(@customers_books_reads) do |customers_books_read|
  json.extract! customers_books_read, :customer_id, :book_id
  json.url customers_books_read_url(customers_books_read, format: :json)
end
