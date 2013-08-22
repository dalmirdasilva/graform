json.array!(@forms) do |form|
  json.extract! form, :name, :description, :user_id
  json.url form_url(form, format: :json)
end
