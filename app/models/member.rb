class Member < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true, :format => { 
                    :with => /\b[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i},
                    :on => :create
end
