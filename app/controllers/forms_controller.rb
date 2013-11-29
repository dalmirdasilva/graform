class FormsController < ApplicationController

  before_action :set_form, only: [:copy, :show, :edit, :update, :destroy, :editor, :report]
  before_action :login_required!, only: [:index, :show, :edit, :update, :destroy]
  
  def index
    @forms = current_user.forms
  end

  def editor
    apply_layout "application"
    @question_types = QuestionType.all
    @form = Form.find params[:form_id]
    set_javascript_var :form, @form
  end

  def show
  end

  def new
    @form = Form.new
  end

  def edit
  end
  
  def copy
    @form_clone = @form.dup
    @form_clone.save
    questions = @form.questions
    questions.each do |question|
      question_clone = question.dup
      question_clone.form_id = @form_clone.id
      question_clone.save
      options = question.options
      options.each do |option|
        option_clone = option.dup
        option_clone.question_id = question_clone.id
        option_clone.save
        rules = Rule.where(question_id: question.id, option_id: option.id)
        rules.each do |rule|
          rule_clone = rule.dup
          rule_clone.question_id = question_clone.id
          rule_clone.option_id = option_clone.id
          rule_clone.save
        end
      end
    end
    redirect_to controller: :forms, action: :index
  end

  def create
    @form = Form.new(form_params)
    @form.user = current_user
    respond_to do |format|
      if @form.save
        format.html { redirect_to form_editor_path(@form), notice: t('activerecord.successful.messages.form.created') }
        format.json { render action: 'editor', status: :created, location: @form }
      else
        flash.now[:error] = @form.errors.full_messages
        format.html { render action: 'new' }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @form.update(form_params)
        format.html { redirect_to @form, notice: t('activerecord.successful.messages.form.updated') }
        format.json { head :no_content }
      else
        flash.now[:error] = @form.errors.full_messages
        format.html { render action: 'edit' }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @form.destroy
    respond_to do |format|
      format.html { redirect_to forms_url }
      format.json { head :no_content }
    end
  end

  private

    def set_form
      @form = Form.find(params[:id] || params[:form_id])
    end

    def form_params
      p = params.require(:form).permit(:name, :description, :user_id, :form_type_id)
    end
end
