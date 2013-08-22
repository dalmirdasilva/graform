json.array!(@answers) do |answer|
  json.extract! answer, :reply_id, :question_id, :option_id
  json.url answer_url(answer, format: :json)
end
