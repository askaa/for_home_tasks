class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def authorize
    redirect_to login_url, alert: 'Сначала залогиньтесь' if current_user.nil?
  end

  def author
    redirect_to root_url, alert: 'Неверный автор' unless current_user.id == Petition.find(params[:id]).user_id
  end

end

