json.array!(@series) do |series|
  json.extract! series, :title, :description, :author_id
  json.url series_url(series, format: :json)
end
