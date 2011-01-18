class UsersController < ApplicationController
  before_filter :require_user
  before_filter :admin_user, :only => [:index]
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
     flash[:notice] = "Registration successful."
      redirect_to root_url
   else
      render :action => 'new'
   end
  end
  
  def index
    @users = User.all
  end

  def edit
    if current_user.admin? and params[:id] != "current"
      @user = User.find(params[:id])
    else
      @user = current_user
    end
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated profile."
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end
  def destroy
    @user = User.find(params[:id])
    if @user == current_user
      flash[:alert] = "You can not destroy yourself!"
    else
      @user.destroy 
      flash[:notice] = "Successfully destroyed user."
    end
    redirect_to users_path
  end
  
  private
  def admin_user
    unless current_user.admin?
      redirect_to user_edit_path(current_user.id)
    end
  end
end
