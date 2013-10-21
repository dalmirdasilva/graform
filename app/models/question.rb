class Question < ActiveRecord::Base
  belongs_to :form
  belongs_to :question_type
  has_many :options
  has_many :rules
  validates :text, presence: true
end
