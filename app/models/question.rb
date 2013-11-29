class Question < ActiveRecord::Base
  belongs_to :form
  belongs_to :question_type
  has_many :options, dependent: :destroy
  has_many :answers, :through => :options
  
  has_many :rules
  validates :text, presence: true
  
  def next_question(reply_id)
    higher_questions = form.questions.where("number > ?", number).order('number ASC')
    higher_questions.each do |question|
      reply_answers = question.answers.select { |answer| answer.reply_id = reply_id }
      unless reply_answers.empty?
        return question
      end
    end
    nil
  end
end
