require 'spec_helper'

describe "customers/show" do
  before(:each) do
    @customer = assign(:customer, stub_model(Customer,
      :first_name => "First Name",
      :last_name => "Last Name",
      :email => "Email",
      :street_address => "Street Address",
      :city => "City",
      :state => "State",
      :zipcode => "Zipcode",
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Email/)
    rendered.should match(/Street Address/)
    rendered.should match(/City/)
    rendered.should match(/State/)
    rendered.should match(/Zipcode/)
  end
end
