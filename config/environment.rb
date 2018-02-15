# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
BlastDoor::Application.initialize!
ActionMailer::Base.smtp_settings = {
    :user_name => 'osplaza3222',
    :password => 'Shadow32',
    :domain => 'blastdoor.io',
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
}