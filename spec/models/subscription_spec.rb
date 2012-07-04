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

require 'spec_helper'

describe Subscription do
  pending "add some examples to (or delete) #{__FILE__}"
end
