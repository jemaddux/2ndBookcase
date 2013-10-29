json.array!(@chapters) do |chapter|
  json.extract! chapter, :book_id, :title, :summary, :position
  json.url chapter_url(chapter, format: :json)
end
