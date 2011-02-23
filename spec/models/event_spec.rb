require File.dirname(__FILE__) + '/../spec_helper'

describe Event do
  before(:each) do
  #:name, :description, :event_date, :price, :currency
    @attr = {:name => "Some Event", 
              :description => "Event description, \n bla bla", 
              :event_date => Time.now+3.days, :price => "500.00", :currency => "E"}
  end
  it "should be valid" do
    Event.new(@attr).should be_valid
  end
  it "should require a name" do
    Event.new(@attr.merge(:name => nil)).should_not be_valid
  end
  it "should have a date greater than today" do
    Event.new(@attr.merge(:event_date => Time.now - 1.day)).should_not be_valid
  end
  it "should have a description" do
    Event.new(@attr.merge(:description => nil)).should_not be_valid
  end
end
