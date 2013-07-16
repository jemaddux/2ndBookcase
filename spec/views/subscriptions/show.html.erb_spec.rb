require 'spec_helper'

describe "subscriptions/show" do
  before(:each) do
    @subscription = assign(:subscription, stub_model(Subscription,
      :plan_id => 1,
      :customer_id => 2,
      :stripe_card_token => "Stripe Card Token"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Stripe Card Token/)
  end
end
