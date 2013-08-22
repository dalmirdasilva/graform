json.array!(@questions) do |question|
  json.extract! question, :type_id, :statement
  json.url question_url(question, format: :json)
end
