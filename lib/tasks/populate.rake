require "faker"
require "populator"
namespace :db do
  desc  "Erase and fill database"
  task :populate => :environment do
    Event.delete_all
    Member.delete_all
    
    Member.populate 1..5 do |member|
      member.first_name = Faker::Name.first_name
      member.last_name = Faker::Name.last_name
      member.email = Faker::Internet.email
    end
    Event.populate 1..30 do |event|
      event.name = Faker::Lorem.words(3)
      event.description = Faker::Lorem.sentences(2)
      event.event_date = 45.days.ago+rand(90).days
    end
  end
end