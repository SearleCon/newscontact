require 'spec_helper'

describe "subscriptions/new" do
  before(:each) do
    assign(:subscription, stub_model(Subscription,
      :newsletter_id => 1,
      :user_id => 1,
      :active => false
    ).as_new_record)
  end

  it "renders new subscription form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => subscriptions_path, :method => "post" do
      assert_select "input#subscription_newsletter_id", :name => "subscription[newsletter_id]"
      assert_select "input#subscription_user_id", :name => "subscription[user_id]"
      assert_select "input#subscription_active", :name => "subscription[active]"
    end
  end
end
