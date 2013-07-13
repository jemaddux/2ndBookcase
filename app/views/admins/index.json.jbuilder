json.array!(@admins) do |admin|
  json.extract! admin, :email, :password_digest
  json.url admin_url(admin, format: :json)
end
