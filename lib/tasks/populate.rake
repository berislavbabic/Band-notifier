require "faker"
namespace :db do
  desc  "Erase and fill database"
  task :populate => :environment do
    Event.delete_all
    Member.delete_all
    
    5.times do
      Member.create!(:first_name => Faker::Name.first_name,
                     :last_name => Faker::Name.last_name,
                     :email => Faker::Internet.email)
    end
    
      30.times do
        event = Event.new
        event.name = Faker::Lorem.words(3)
        event.description = Faker::Lorem.sentences(2)
        event.event_date = 45.days.ago+rand(90).days
        event.price = (500..2000)
        event.currency = "E"
        event.save        
      end
  end
end