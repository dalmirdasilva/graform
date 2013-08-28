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

  def edit
  end

  def create
    @question = @form.questions.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to form_question_url(@form, @question), notice: 'Question was successfully created.' }
        format.json { render action: 'show', status: :created, location: @question }
      else
        format.html { render action: 'new' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to form_question_url(@form, @question), notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to form_questions_url(@form) }
      format.json { head :no_content }
    end
  end

  private
  
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:question_type_id, :statement)
    end
end
