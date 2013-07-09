require 'spec_helper'

describe "subscriptions/new" do
  before(:each) do
    assign(:subscription, stub_model(Subscription,
      :plan_id => 1,
      :customer_id => 1,
      :stripe_card_token => "MyString"
    ).as_new_record)
  end

  it "renders new subscription form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", subscriptions_path, "post" do
      assert_select "input#subscription_plan_id[name=?]", "subscription[plan_id]"
      assert_select "input#subscription_customer_id[name=?]", "subscription[customer_id]"
      assert_select "input#subscription_stripe_card_token[name=?]", "subscription[stripe_card_token]"
    end
  end
end
