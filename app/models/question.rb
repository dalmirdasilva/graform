class Question < ActiveRecord::Base
  belongs_to :form
  belongs_to :question_type
  has_many :options, dependent: :destroy
  has_many :answers, :through => :options
  
  has_many :rules
  validates :text, presence: true
  
  def next_question
    form.questions.where("number > ?", number).order('number ASC').limit(1).first
  end
end
