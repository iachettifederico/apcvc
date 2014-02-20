json.array!(@essays) do |essay|
  json.extract! essay, :id, :title, :file, :authors, :abstract
  json.url essay_url(essay, format: :json)
end
