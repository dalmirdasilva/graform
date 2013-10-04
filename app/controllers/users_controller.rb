class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :update]
  before_action :login_required!, only: [:edit, :update]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_url, notice: t('activerecord.successful.messages.user.created')
    else
      flash.now[:error] = @user.errors.full_messages
      render "new"
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to edit_user_path(@user), notice: t('activerecord.successful.messages.user.updated') }
        format.json { head :no_content }
      else
        flash.now[:error] = @user.errors.full_messages
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  
    def set_user
      @user = current_user
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
