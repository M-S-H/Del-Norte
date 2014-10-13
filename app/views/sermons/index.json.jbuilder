json.array!(@sermons) do |sermon|
  json.extract! sermon, :id
  json.url sermon_url(sermon, format: :json)
end
