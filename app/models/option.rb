class Option < ActiveRecord::Base
  has_and_belongs_to_many :questions
  has_many :rules
  has_many :answers
end
