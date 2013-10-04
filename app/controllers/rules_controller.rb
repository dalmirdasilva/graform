require 'form_resource'
require 'question_resource'

class RulesController < ApplicationController

  include FormResource
  include QuestionResource

  before_action :set_rule, only: [:show, :edit, :update, :destroy]
  before_action :login_required!, only: [:show, :edit, :update, :destroy]

  def index
    @rules = @question.rules
  end

  def show
  end

  def new
    @rule = @question.rules.new
  end

  def edit
  end

  def create
    @rule = @question.rules.create(rule_params)

    respond_to do |format|
      if @rule.save
        format.html { redirect_to form_question_rule_path(@form, @question, @rule), notice: t('activerecord.successful.messages.rule.created') }
        format.json { render action: 'show', status: :created, location: @rule }
      else
        format.html do
          flash.now[:error] = @rule.errors.full_messages
          render action: 'new'
        end
        format.json { render json: @rule.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @rule.update(rule_params)
        format.html { redirect_to form_question_rule_path(@form, @question, @rule), notice: t('activerecord.successful.messages.rule.updated') }
        format.json { head :no_content }
      else
        format.html do
          flash.now[:error] = @rule.errors.full_messages
          render action: 'edit'
        end
        format.json { render json: @rule.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @rule.destroy
    respond_to do |format|
      format.html { redirect_to form_question_rules_path(@form, @question) }
      format.json { head :no_content }
    end
  end

  private
  
    def set_rule
      @rule = Rule.find(params[:id])
    end

    def rule_params
      params.require(:rule).permit(:question_id, :next_question_id, :option_id)
    end
end
