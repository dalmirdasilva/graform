class Form < ActiveRecord::Base
  belongs_to :user
  has_many :questions
  has_many :replies
  validates :name, presence: true
  validates :description, presence: true
end
