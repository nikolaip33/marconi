class ApplicationController < ActionController::Base

    private
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
    
    def logged_in?
        !!current_user
    end

    def admin?
        logged_in? && current_user.admin
    end

    helper_method :current_user, :logged_in?
end
