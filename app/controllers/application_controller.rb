class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :require_user

  before_filter :prepare_for_mobile

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

  def mobile_device?
    if session[:mobile_param]
        session[:mobile_param] == "1"
    else
        request.user_agent =~ /Mobile|webOS/
    end
  end
  helper_method :mobile_device?

  def prepare_for_mobile
    session[:mobile_param] = params[:mobile] if params[:mobile]
    request.format = :mobile if mobile_device?
  end
end
