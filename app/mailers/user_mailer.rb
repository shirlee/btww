class UserMailer < ActionMailer::Base
  default :from => "bikecommuterchallenge@gmail.com"
  
   
  
  def password_email(user, pwd)
  @user = user
  @pwd = pwd
  @url = new_session_url(:host => ENV['HOST'])
  mail(:to => user.email, :subject => "Bike Commuter Challenge temporary password")
  end
  
  def email_confirmation(user)
  @user = user
  @url = new_session_url(:host => ENV['HOST'])
  mail(:to => user.email, :subject => "Bike Commuter Challenge temporary password")
  end
  
end
