class SessionsController < ApplicationController

  def create
    user = User.find_by_email(session_params[:email])
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to forms_url
    else
      flash.now.alert = 'Invalid email or password.'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: 'Logged out!'
  end

  private
  
    def session_params
      params.require(:session).permit(:email, :password)
    end
end

