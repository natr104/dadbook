class ApplicationController < ActionController::Base

    helper_method :current_user
    before_action :require_login

    def require_login
        return redirect_to login_path unless session.include? :user_id
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
end
