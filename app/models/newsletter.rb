# == Schema Information
#
# Table name: newsletters
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  content    :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Newsletter < ActiveRecord::Base
  attr_accessible :content, :title
  validates :content, :length => { :maximum => 30 }
  has_many :subscriptions
end
