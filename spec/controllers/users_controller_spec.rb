require File.dirname(__FILE__) + '/../spec_helper'

describe UsersController do
  before(:each) do
    @attr = {:username => "pero", 
            :password => "password", 
            :password_confirmation => "password", 
            :email => "pero@pero.com"}
  end

  render_views

  it "new action should not render new template if not logged in" do
    get :new
    response.should_not render_template(:new)
  end
end
