class UserSessionsController < ApplicationController
  
  def new
    @user_session = UserSession.new
  end
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = t('controllers.sessions.login')
      redirect_to upcoming_path
    else
      render :action => 'new'
    end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = t('controllers.sessions.logout')
    redirect_to root_url
  end
end
