# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Gonpy::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => "kesonother@gmail.com",
  :password => "joseph",
  :domain => "localhost",
  :address => "smtp.sendgrid.net",
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}