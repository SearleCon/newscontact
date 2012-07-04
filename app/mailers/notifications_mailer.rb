class NotificationsMailer < ActionMailer::Base
  default from: "no-reply@appx.com"
  default :to => "hellraiser.u1@gmail.com"

  def new_message(message)
    @message = message
    mail(:subject => "Application X [Contact Us] - #{message.subject}  [#{message.name}]")
  end  
  
end
