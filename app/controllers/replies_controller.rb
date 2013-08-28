require 'form_resource'
    
class RepliesController < ApplicationController
  include FormResource
  before_action :set_reply, only: [:show, :edit, :update, :destroy]
  before_action :login_required!, only: [:show, :edit, :update, :destroy]

  def index
    @replies = @form.replies
  end

  def show
  end

  def new
    @reply = @form.replies.build
  end

  def edit
  end

  def create
    @reply = @form.replies.build(reply_params)

    respond_to do |format|
      if @reply.save
        format.html { redirect_to form_reply_url(@form, @reply), notice: 'Reply was successfully created.' }
        format.json { render action: 'show', status: :created, location: @reply }
      else
        format.html do
          flash.now[:error] = @reply.errors.full_messages
          render action: 'new'
        end
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @reply.update(reply_params)
        format.html { redirect_to form_reply_url(@form, @reply), notice: 'Reply was successfully updated.' }
        format.json { head :no_content }
      else
        format.html do
          flash.now[:error] = @reply.errors.full_messages
          render action: 'edit'
        end
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @reply.destroy
    respond_to do |format|
      format.html { redirect_to form_replies_url(@form) }
      format.json { head :no_content }
    end
  end

  private
  
    def set_reply
      @reply = Reply.find(params[:id])
    end

    def reply_params
      params.require(:reply).permit(:form_id)
    end
end
