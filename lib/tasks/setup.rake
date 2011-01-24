namespace :app do
  desc  "Setup admin user"
  task :setup => :environment do
    puts "This procedure will destroy everything in the database, are you sure? (Y/N)"
    confirm = STDIN.gets.chomp
    if confirm.upcase == 'Y'
      User.delete_all
      puts "Enter user name:"
      username = STDIN.gets.chomp
      puts "Enter your e-mail address:"
      email = STDIN.gets.chomp
      puts "Enter your password:"
      password = STDIN.gets.chomp
      puts "Password confirmation:"
      password_confirmation = STDIN.gets.chomp
      user = User.create!(:username => username, :email => email, 
            :password => password, :password_confirmation => password_confirmation)
    end 
  end
end