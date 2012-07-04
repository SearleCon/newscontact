class ContactController < ApplicationController

  def new
    #if signed_in?
    #  @message = Message.new(:name => current_user.name, :email => current_user.email)  
    #else
      @message = Message.new  
    #end
  end

  def create
    @message = Message.new(params[:message])
    
    if @message.valid?
      NotificationsMailer.new_message(@message).deliver
      redirect_to(root_path, :notice => "Thank you! Your message was successfully sent.")
    else
      #flash.now.alert = "Please fill all fields."
      render :new
    end
  end

end
