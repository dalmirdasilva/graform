class QuestionTypesController < ApplicationController
  before_action :set_question_type, only: [:show, :edit, :update, :destroy]
  before_action :login_required!, only: [:show, :edit, :update, :destroy]

  def index
    @question_types = QuestionType.all
  end

  def show
  end

  def new
    @question_type = QuestionType.new
  end

  def edit
  end

  def create
    @question_type = QuestionType.new(question_type_params)

    respond_to do |format|
      if @question_type.save
        format.html { redirect_to @question_type, notice: 'Question type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @question_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @question_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @question_type.update(question_type_params)
        format.html { redirect_to @question_type, notice: 'Question type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @question_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @question_type.destroy
    respond_to do |format|
      format.html { redirect_to question_types_url }
      format.json { head :no_content }
    end
  end

  private
    
    def set_question_type
      @question_type = QuestionType.find(params[:id])
    end

    def question_type_params
      params.require(:question_type).permit(:name)
    end
end
