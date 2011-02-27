require File.dirname(__FILE__) + '/../spec_helper'

describe Event do
  before(:each) do
  #:name, :description, :event_date, :price, :currency
    @attr = {:name => "Some Event", 
              :description => "Event description, \n bla bla", 
              :event_date => Time.now+3.days, 
              :price => "500.00", :currency => "E", :public => false}
  end
  describe "Fields existence" do
    before(:each) do
      @event = Event.new
    end
    it "should have a name" do
      @event.should respond_to(:name)
    end
    it "should have a description" do
      @event.should respond_to(:description)
    end
    it "should have an event date" do
      @event.should respond_to(:event_date)
    end
    it "should have a price" do
      @event.should respond_to(:price)
    end
    it "should have a currency" do
      @event.should respond_to(:currency)
    end
    it "should be able to be public" do
      @event.should respond_to(:public)
    end
  end
  it "should be valid with good parameters" do
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
