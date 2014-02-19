json.array!(@announcements) do |announcement|
  json.extract! announcement, :id, :title, :content, :from, :to, :front_page
  json.url announcement_url(announcement, format: :json)
end
