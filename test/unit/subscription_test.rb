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

require 'test_helper'

class SubscriptionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
