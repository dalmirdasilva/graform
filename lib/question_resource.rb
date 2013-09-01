
module QuestionResource
  include FormResource

  def self.included(klass)
    klass.instance_eval do
      before_filter :load_question
    end
  end

  private

  def load_question
    @question = Question.find(params[:question_id]) rescue nil
    redirect_to questions_url, notice: 'The question does not exist.' unless @question
  end
end

