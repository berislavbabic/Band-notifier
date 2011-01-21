class PublicController < ApplicationController
  before_filter :check_mobile

  def index
  end
  def about
  end

private
  def check_mobile
    if mobile_device?
      redirect_to new_user_session_path
    end
  end
end
