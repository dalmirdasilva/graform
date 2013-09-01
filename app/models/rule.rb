class Rule < ActiveRecord::Base
  belongs_to :question, :class_name => "Question"
  belongs_to :next_question, :class_name => "Question"
  belongs_to :option
end
