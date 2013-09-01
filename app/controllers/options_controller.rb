require 'question_resource'

class OptionsController < ApplicationController
  include FormResource
  include QuestionResource
  before_action :set_option, only: [:show, :edit, :update, :destroy]
  before_action :login_required!, only: [:show, :edit, :update, :destroy]

  def index
    @options = @question.options
  end

  def show
  end

  def new
    @option = @question.options.new
  end

  def edit
  end

  def create
    text = option_params["text"]
    @option = Option.find_by_text(text)
    if @option
      @question.options << @option
      respond_to do |format|
        format.html { redirect_to form_question_option_url(@form, @question, @option), notice: 'Option was successfully reused.' }
        format.json { render action: 'show', status: :created, location: @option }
      end
    else
      @option = @question.options.create(option_params)
      respond_to do |format|
        if @option.save
          format.html { redirect_to form_question_option_url(@form, @question, @option), notice: 'Option was successfully created.' }
          format.json { render action: 'show', status: :created, location: @option }
        else
          flash.now[:error] = @option.errors.full_messages
          format.html { render action: 'new' }
          format.json { render json: @option.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @option.questions.size > 1
        @question.options.delete(@option)
        @option = @question.options.create(option_params)
      end
      if @option.update(option_params)
        format.html { redirect_to form_question_option_url(@form, @question, @option), notice: 'Option was successfully updated.' }
        format.json { head :no_content }
      else
        flash.now[:error] = @option.errors.full_messages
        format.html { render action: 'edit' }
        format.json { render json: @option.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @option.destroy
    respond_to do |format|
      format.html { redirect_to form_question_options_url(@form, @question) }
      format.json { head :no_content }
    end
  end

  private

    def set_option
      @option = Option.find(params[:id])
    end

    def option_params
      params.require(:option).permit(:text)
    end
end
