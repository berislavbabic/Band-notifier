require File.dirname(__FILE__) + '/../spec_helper'

describe Member do
  before(:each) do
    @attr = {:first_name => "John", 
              :last_name => "Appleseed", 
              :email => "email@email.com"}
  end
  describe "Fields validation" do
    before(:each) do
      @member= Member.new
    end
    it "should have a first name" do
      @member.should respond_to(:first_name)
    end
    it "should have a last name" do
      @member.should respond_to(:last_name)
    end
    it "should have an email" do
      @member.should respond_to(:email)
    end
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
    bad_member = Member.new(@attr.merge(:email => "wrong_email"))
    bad_member.should_not be_valid
  end
end
