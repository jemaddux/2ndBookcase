json.array!(@articles) do |article|
  json.extract! article, :title, :body, :customer_id, :rating, :published
  json.url article_url(article, format: :json)
end
