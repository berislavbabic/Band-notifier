require File.dirname(__FILE__) + '/../spec_helper'

describe User do
  before(:each) do
    @attr = {:username => "pero", 
            :password => "password", 
            :password_confirmation => "password", 
            :email => "pero@pero.com"}
  end
  it "should be valid" do
    User.new(@attr).should be_valid
  end
  it "should require a username" do
    bad_user = User.new(@attr.merge(:username => nil))
    bad_user.should_not be_valid
  end
  it "should require a password" do
    bad_user = User.new(@attr.merge(:password => nil, :password_confirmation => nil))
    bad_user.should_not be_valid
  end
  it "should have matching passwords" do
    bad_user = User.new(@attr.merge(:password => "password", 
                                    :password_confirmation => "wrong_pass"))
    bad_user.should_not be_valid
  end
  it "should have an e-mail" do
    bad_user = User.new(@attr.merge(:email => nil))
    bad_user.should_not be_valid
  end
  it "should not have invalid e-mail" do
    bad_user = User.new(@attr.merge(:email => "email"))
    bad_user.should_not be_valid
  end
  it "should have valid e-mail" do
    user = User.new(@attr.merge(:email => "email@email.com"))
    user.should be_valid
  end

end
