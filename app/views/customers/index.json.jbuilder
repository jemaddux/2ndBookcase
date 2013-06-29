json.array!(@customers) do |customer|
  json.extract! customer, :first_name, :last_name, :email, :street_address, :city, :state, :zipcode, :account_status, :rental_plan
  json.url customer_url(customer, format: :json)
end
