ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "example.com",
  :user_name            => "babinho@example.com",
  :password             => "secret",
  :authentication       => "plain",
  :enable_starttls_auto => true
}