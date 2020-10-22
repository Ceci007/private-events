class ApplicationController < ActionController::Base
  helper_method :current_user, :current_event, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_event
    @current_event ||= Event.find(session[:user_id]) if current_user
  end

  def logged_in?
    !current_user.nil?
  end

  def require_user
    return if logged_in?

    flash[:alert] = 'You must be logged in to perform that action.'
    redirect_to login_path
  end
end
