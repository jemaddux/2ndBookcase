require 'spec_helper'

describe "subscriptions/edit" do
  before(:each) do
    @subscription = assign(:subscription, stub_model(Subscription,
      :plan_id => 1,
      :customer_id => 1,
      :stripe_card_token => "MyString"
    ))
  end

  it "renders the edit subscription form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", subscription_path(@subscription), "post" do
      assert_select "input#subscription_plan_id[name=?]", "subscription[plan_id]"
      assert_select "input#subscription_customer_id[name=?]", "subscription[customer_id]"
      assert_select "input#subscription_stripe_card_token[name=?]", "subscription[stripe_card_token]"
    end
  end
end
