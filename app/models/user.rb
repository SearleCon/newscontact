# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  password_digest :string(255)
#  subscription    :boolean
#  remember_token  :string(255)
#  admin           :boolean
#

class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation, :subscription, :password_reset_sent_at
  has_secure_password
  
  #has_one :subscriptions
  
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  
  before_create { generate_token(:password_reset_token) }  
    
 

  validates :name, presence: true, length: { maximum: 50 }#, :on => :create
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }#, :on => :create
  validates :password, presence: true, length: { minimum: 6 }#, :on => :create
  validates :password_confirmation, presence: true#, :on => :create

  

  def send_password_reset  
    generate_token(:password_reset_token)  
    #self.password_reset_sent_at = Time.zone.now
    #@person.update_column(:some_attribute, 'value')
    self.update_attribute(:password_reset_sent_at,Time.zone.now)
    #self.update_column(:password_reset_sent_at, Time.zone.now)
    #save!  
    UserMailer.password_reset(self).deliver  
  end

  private
  
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

    #def generate_token
    #  self.token = Digest::SHA1.hexdigest([Time.now, rand].join)
    #end

    def generate_token(column)  
      begin  
        self[column] = SecureRandom.urlsafe_base64  
      end while User.exists?(column => self[column])  
    end    
 

end


