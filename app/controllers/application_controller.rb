class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :find_current_user

  helper_method :is_logged_in?

  def find_current_user
    @current_user = (User.find(session[:user_id]) if is_logged_in?)
  end

  def check_login
    redirect_to new_session_path unless is_logged_in?
  end

  def is_logged_in?
    session[:user_id].present?
  end

  def check_admin
    @current_user = find_current_user
    unless @current_user.present? && @current_user.is_admin?
      redirect_to root_path
  end
end

  def find_admin_user
    @current_user = find_current_user
    @current_user if @current_user.present? && @current_user.is_admin?
  end
end
