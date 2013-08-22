class Option < ActiveRecord::Base
  has_many :questions
  has_many :rules
  has_many :answers
end
