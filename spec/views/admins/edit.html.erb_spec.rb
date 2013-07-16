require 'spec_helper'

describe "admins/edit" do
  before(:each) do
    @admin = assign(:admin, stub_model(Admin,
      :email => "MyString",
      :password_digest => "MyString"
    ))
  end
end
