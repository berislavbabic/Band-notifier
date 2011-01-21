class EventsController < ApplicationController
  before_filter :require_user
  def index
    @events = Event.paginate(:page => params[:page], :order => 'event_date')
  end
  def upcoming_events
    @events = Event.paginate(:conditions => ["event_date >= ?",Time.now], :order => 'event_date', :page => params[:page])
    render :action => 'index'    
  end

  def show
    @event = Event.find(params[:id])
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(params[:event])
    if @event.save
      flash[:notice] = "Successfully created event."
      redirect_to @event
    else
      render :action => 'new'
    end
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      flash[:notice] = "Successfully updated event."
      redirect_to @event
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "Successfully destroyed event."
    redirect_to events_path
  end
  	def mail_notify
  		session[:return_to] ||= request.referer
  		event = Event.find(params[:id])
	  	Member.all.each do |member|
			Notifier.event_notify(member, event).deliver
    	end
    	redirect_link = session[:return_to]
    	session[:return_to] = nil
    	redirect_to redirect_link
  	end
end
