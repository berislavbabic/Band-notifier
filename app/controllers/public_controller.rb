class PublicController < ApplicationController
  before_filter :check_mobile

  def index
    @events = Event.find(:all, :conditions => {:public => true}, :order => 'event_date asc')
  end
  def about
  end

private
  def check_mobile
    if mobile_device?
      redirect_to login_path
    end
  end
end
