class Question < ActiveRecord::Base
  has_and_belongs_to_many :options
  belongs_to :form
  belongs_to :question_type
  has_many :rules
  validates :text, presence: true
end
