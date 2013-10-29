json.array!(@article_ratings) do |article_rating|
  json.extract! article_rating, :article_id, :customer_id, :rating, :active
  json.url article_rating_url(article_rating, format: :json)
end
