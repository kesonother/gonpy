class UserMailer < ActionMailer::Base
  default :from => "kesonother@gmail.com"
  include SendGrid
  sendgrid_category :use_subject_lines
  sendgrid_enable   :ganalytics, :opentrack

  def welcome_email(user)
    @user = user
    @url  = "http://example.com/login"
    mail(:to => user.email, :subject => "Welcome to My Awesome Site")
  end
  
  def welcome_message(user)
    sendgrid_category "Welcome"
    mail :to => user.email, :subject => "Welcome #{user.first_name} :-)"
  end

  def goodbye_message(user)
    sendgrid_disable :ganalytics
    mail :to => user.email, :subject => "Fare thee well :-("
  end
  
end
