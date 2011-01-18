class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :require_user

private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  def require_user
    unless current_user
      flash[:alert]="Morate biti logirani da bi vidjeli podatke"
      redirect_to root_path
    end
  end
end
