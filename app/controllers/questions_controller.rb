require 'form_resource'

class QuestionsController < ApplicationController

  include FormResource
  
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :login_required!

  def index
    @questions = @form.questions
  end

  def show
  end

  def new
    @question = @form.questions.new(form_id: @form.id)
  end
  
  def new_from_type
    @question_type = QuestionType.find(params[:type_id])
    @question = @form.questions.new(form_id: @form.id)
    @question.text = "Pergunta..."
    @question.number = @form.max_question_number  + 1
    @question.question_type = @question_type
    if @question.save
      render partial: "questions/type/#{@question_type.code}/form"
    end
  end

  def edit
  end

  def create
    sleep 1
    @question = @form.questions.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to form_question_url(@form, @question), notice: t('activerecord.successful.messages.question.created') }
        format.json { render action: 'show', status: :created, location: @question }
      else
        flash.now[:error] = @question.errors.full_messages
        format.html { render action: 'new' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    sleep 1
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to form_question_url(@form, @question), notice: t('activerecord.successful.messages.question.updated') }
        format.json { render json: {status: 'OK'} }
      else
        flash.now[:error] = @question.errors.full_messages
        format.html { render action: 'edit' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    sleep 1
    @question.destroy
    respond_to do |format|
      format.html { redirect_to form_questions_url(@form) }
      format.json { render json: {status: 'OK'} }
    end
  end

  private
  
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:question_type_id, :text, :number)
    end
end
