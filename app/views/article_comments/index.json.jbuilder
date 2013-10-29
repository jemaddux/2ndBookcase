json.array!(@article_comments) do |article_comment|
  json.extract! article_comment, :article_id, :customer_id, :active
  json.url article_comment_url(article_comment, format: :json)
end
