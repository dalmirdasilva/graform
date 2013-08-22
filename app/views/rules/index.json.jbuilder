json.array!(@rules) do |rule|
  json.extract! rule, :question_id, :next_question_id, :option_id
  json.url rule_url(rule, format: :json)
end
