require File.dirname(__FILE__) + '/../spec_helper'

describe Member do
  before(:each) do
    @attr = {:first_name => "John", 
              :last_name => "Appleseed", 
              :email => "email@email.com"}
  end
  it "should be valid" do
    Member.new(@attr).should be_valid
  end
  it "should require a first_name" do
    bad_member = Member.new(@attr.merge(:first_name => nil))
    bad_member.should_not be_valid
  end
  it "should require a last name" do
    bad_member = Member.new(@attr.merge(:last_name => nil))
    bad_member.should_not be_valid
  end
  it "should require an email" do
    bad_member = Member.new(@attr.merge(:email => nil))
    bad_member.should_not be_valid
  end
  it "should require a valid email" do
    bad_member = Member.new(@attr.merge(:email => "pero12345"))
    bad_member.should_not be_valid
  end
end
