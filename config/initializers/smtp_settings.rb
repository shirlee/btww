ActionMailer::Base.smtp_settings = {
 :address              => 'smtp.gmail.com',
 :port                 => 587,
 :domain               => 'gmail.com',
 :user_name            => ENV['MAIL_USERNAME'],
 :password             => ENV['MAIL_PASSWORD'],
 :authentication       => 'plain',
 :enable_starttls_auto => true

}

ActionMailer::Base.perform_deliveries = true 
ActionMailer::Base.raise_delivery_errors = true

ActionMailer::Base.delivery_method = :smtp