class OptionsController < ApplicationController
  before_action :set_option, only: [:show, :edit, :update, :destroy]
  before_action :login_required!, only: [:show, :edit, :update, :destroy]

  def index
    @options = Option.all
  end

  def show
  end

  def new
    @option = Option.new
  end

  def edit
  end

  def create
    @option = Option.new(option_params)

    respond_to do |format|
      if @option.save
        format.html { redirect_to @option, notice: 'Option was successfully created.' }
        format.json { render action: 'show', status: :created, location: @option }
      else
        format.html { render action: 'new' }
        format.json { render json: @option.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @option.update(option_params)
        format.html { redirect_to @option, notice: 'Option was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @option.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @option.destroy
    respond_to do |format|
      format.html { redirect_to options_url }
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
