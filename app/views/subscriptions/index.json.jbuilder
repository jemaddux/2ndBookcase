json.array!(@subscriptions) do |subscription|
  json.extract! subscription, :plan_id, :customer_id, :stripe_card_token
  json.url subscription_url(subscription, format: :json)
end
