class MembersController < ApplicationController
  before_filter :require_user
  def index
    @members = Member.all
  end
  
  def show
    @member = Member.find(params[:id])
  end
  
  def new
    @member = Member.new
  end
  
  def create
    @member = Member.new(params[:member])
    if @member.save
      flash[:notice] = t('controllers.members.created')
      redirect_to @member
    else
      render :action => 'new'
    end
  end
  
  def edit
    @member = Member.find(params[:id])
  end
  
  def update
    @member = Member.find(params[:id])
    if @member.update_attributes(params[:member])
      flash[:notice] = t('controllers.members.updated')
      redirect_to @member
    else
      render :action => 'edit'
    end
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    flash[:notice] = t('controllers.members.destroyed')
    redirect_to members_path
  end
end
