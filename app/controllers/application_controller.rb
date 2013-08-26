class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception

  layout 'application'

  private
  
    def login_required!
      redirect_to login_path, notice: 'You must be logged in.' unless logged_in?
    end
    
    def logged_in?
      not current_user.nil?
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id] rescue nil
    end
    
    helper_method :current_user, :logged_in?
end
