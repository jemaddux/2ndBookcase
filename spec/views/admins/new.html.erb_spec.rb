require 'spec_helper'

describe 'admins/new' do
  before(:each) do
    assign(:admin, stub_model(Admin,
      email: 'MyString',
      password_digest: 'MyString'
    ).as_new_record)
  end
end
