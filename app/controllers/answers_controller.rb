require 'form_resource'
require 'reply_resource'

class AnswersController < ApplicationController

  include FormResource
  include ReplyResource

  before_action :set_answer, only: [:show, :edit, :update, :destroy]
  before_action :login_required!, only: [:show, :edit, :update, :destroy]
  
  def index
    @answers = @reply.answers
  end

  def show
  end

  def new
    @answer = @reply.answers.new
  end

  def edit
  end

  def create
    @answer = @reply.answers.create(answer_params)

    respond_to do |format|
      if @answer.save
        format.html { redirect_to form_reply_answer_path(@form, @reply, @answer), notice: t('activerecord.successful.messages.answer.created') }
        format.json { render action: 'show', status: :created, location: @answer }
      else
        flash.now[:error] = @answer.errors.full_messages
        format.html { render action: 'new' }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to form_reply_answer_path(@form, @reply, @answer), notice: t('activerecord.successful.messages.answer.updated') }
        format.json { head :no_content }
      else
        flash.now[:error] = @answer.errors.full_messages
        format.html { render action: 'edit' }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to form_reply_answers_path(@form, @reply) }
      format.json { head :no_content }
    end
  end

  private
  
    def set_answer
      @answer = Answer.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit(:reply_id, :question_id, :option_id)
    end
end
