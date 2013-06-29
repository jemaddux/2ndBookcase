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
      :account_status => "Account Status",
      :rental_plan => "Rental Plan"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Email/)
    rendered.should match(/Street Address/)
    rendered.should match(/City/)
    rendered.should match(/State/)
    rendered.should match(/Zipcode/)
    rendered.should match(/Account Status/)
    rendered.should match(/Rental Plan/)
  end
end
