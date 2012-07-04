class PasswordResetsController < ApplicationController
  def new
  end

  def create  
    user = User.find_by_email(params[:email])  
    user.send_password_reset if user  
    redirect_to root_path, :notice => "Email sent with password reset instructions."  
  end

  def edit  
    @user = User.find_by_password_reset_token!(params[:id])  
  end 

  def update  
    @user = User.find_by_password_reset_token!(params[:id])
    
    if @user.password_reset_sent_at < 2.hours.ago  
      flash[:alert] = "Password reset period has expired. Please try again!"  
      redirect_to new_password_reset_path
    elsif @user.update_attributes(params[:user])  
      flash[:success] = "Your password has been reset."  
      redirect_to signin_path 
    else  
      render :edit  
    end  
  end



end
