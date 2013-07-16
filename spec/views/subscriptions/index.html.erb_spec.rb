require 'spec_helper'

describe "subscriptions/index" do
  before(:each) do
    assign(:subscriptions, [
      stub_model(Subscription,
        :plan_id => 1,
        :customer_id => 2,
        :stripe_card_token => "Stripe Card Token"
      ),
      stub_model(Subscription,
        :plan_id => 1,
        :customer_id => 2,
        :stripe_card_token => "Stripe Card Token"
      )
    ])
  end

  it "renders a list of subscriptions" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Stripe Card Token".to_s, :count => 2
  end
end
