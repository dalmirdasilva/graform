json.array!(@options) do |option|
  json.extract! option, :text
  json.url option_url(option, format: :json)
end
