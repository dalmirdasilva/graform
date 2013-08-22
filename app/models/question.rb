class Question < ActiveRecord::Base
  belongs_to :form
  has_one :question_type
  has_many :rules
end
