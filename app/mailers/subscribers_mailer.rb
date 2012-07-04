class SubscribersMailer < ActionMailer::Base
    default :from => "newsletters@searleconsulting.com",
            :return_path => 'newsletters@searleconsulting.com'
    
    def weekly_newsletter(subscriber)
      @subscriber = subscriber

      mail(:to => "#{subscriber.name} <#{subscriber.email}>", :subject => "Weekly Newsletter")  
    end    
end

