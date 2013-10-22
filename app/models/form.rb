class Form < ActiveRecord::Base
  belongs_to :user
  belongs_to :form_type
  has_many :questions
  has_many :replies
  validates :name, presence: true
  validates :description, presence: true
  
  def max_question_number
    Question.where(:form_id => id).order('number DESC').limit(1).first.number || 0
  rescue => e
    0
  end
  
  def public_link
    "/forms/#{id}/replies/new_of_type"
  end
  
  def first_question
    Question.where(:form_id => id).order('number ASC').limit(1).first
  rescue => e
    nil
  end
end
