class UserMailer < ActionMailer::Base
  default :from => "newsletters@searleconsulting.com",
          :return_path => 'newsletters@searleconsulting.com'
  
  def registration_confirmation(user,url)
    @user = user
    @url = url
    #attachments["rails.png"] = File.read("#{Rails.root}/app/assets/images/rails.png")
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Application X [Membership] - Welcome!")
  end


  def subscription_confirmation(subscriber,url)
    @subscriber = subscriber
    @url = url
    #attachments["rails.png"] = File.read("#{Rails.root}/app/assets/images/rails.png")
    mail(:to => "#{subscriber.name} <#{subscriber.email}>", :subject => "Application X [Newsletter Subscription] - Thank you!")
  end
  
  def password_reset(user)  
    @user = user  
    mail :to => user.email, :subject => "Application X [Password Reset]"  
  end  
end
