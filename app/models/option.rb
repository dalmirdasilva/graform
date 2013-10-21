class Option < ActiveRecord::Base
  belongs_to :question
  has_many :rules
  has_many :answers
  validates :text, presence: true
end
