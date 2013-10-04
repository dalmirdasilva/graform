class FormTypesController < ApplicationController
  before_action :set_form_type, only: [:show, :edit, :update, :destroy]
  before_action :login_required!, only: [:show, :edit, :update, :destroy]

  def index
    @form_types = FormType.all
  end

  def show
  end

  def new
    @form_type = FormType.new
  end

  def edit
  end

  def create
    @form_type = FormType.new(form_type_params)

    respond_to do |format|
      if @form_type.save
        format.html { redirect_to @form_type, notice: t('activerecord.successful.messages.form_type.created') }
        format.json { render action: 'show', status: :created, location: @form_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @form_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @form_type.update(form_type_params)
        format.html { redirect_to @form_type, notice: t('activerecord.successful.messages.form_type.updated') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @form_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @form_type.destroy
    respond_to do |format|
      format.html { redirect_to form_types_url }
      format.json { head :no_content }
    end
  end

  private
    
    def set_form_type
      @form_type = FormType.find(params[:id])
    end

    def form_type_params
      params.require(:form_type).permit(:code, :name)
    end
end
