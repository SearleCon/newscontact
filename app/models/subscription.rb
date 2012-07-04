# == Schema Information
#
# Table name: subscriptions
#
#  id            :integer         not null, primary key
#  newsletter_id :integer
#  user_id       :integer
#  active        :boolean
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#

class Subscription < ActiveRecord::Base
  attr_accessible :active, :newsletter_id, :user_id
  belongs_to :users
  belongs_to :newsletters
  
end
