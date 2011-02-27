class Event < ActiveRecord::Base
  attr_accessible :name, :description, :event_date, :price, :currency, :public
  validates :event_date, :presence => true
  validate :date_created, :on => :create
  validates :name, :presence => true
  validates :description, :presence => true
  self.per_page = 10

  private
  def date_created
    if event_date?
      errors[:event_date] << "should be greater than today" if event_date <= Date.today
    end
  end
end
