class FormsController < ApplicationController

  before_action :set_form, only: [:show, :edit, :update, :destroy]
  before_action :login_required!, only: [:index, :show, :edit, :update, :destroy]
  
  def index
    @forms = current_user.forms
  end

  def show
  end

  def new
    @form = Form.new
  end

  def edit
  end

  def create
    @form = Form.new(form_params)
    @form.user = current_user
    respond_to do |format|
      if @form.save
        format.html { redirect_to @form, notice: 'Form was successfully created.' }
        format.json { render action: 'show', status: :created, location: @form }
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
        format.html { redirect_to @form, notice: 'Form was successfully updated.' }
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
      @form = Form.find(params[:id])
    end

    def form_params
      params.require(:form).permit(:name, :description, :user_id)
    end
end
