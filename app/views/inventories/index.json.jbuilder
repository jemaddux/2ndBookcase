json.array!(@inventories) do |inventory|
  json.extract! inventory, :book_id, :condition
  json.url inventory_url(inventory, format: :json)
end
