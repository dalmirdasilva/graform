class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception
  before_action :apply_layout

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
    
    def apply_layout
      ApplicationController::layout (params.has_key? :layout) ? params[:layout] : 'application'
    end
    
    def set_javascript_var name, value
      @javascript_vars ||= {}
      @javascript_vars[name] = value
    end
    
    helper_method :apply_layout, :current_user, :logged_in?
end
