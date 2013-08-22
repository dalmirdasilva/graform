class Form < ActiveRecord::Base
  belongs_to :user
  has_many :questions
  has_many :replies
end
