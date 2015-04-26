require 'spec_helper'

describe 'admins/show' do
  before(:each) do
    @admin = assign(:admin, stub_model(Admin,
      email: 'Email',
      password_digest: 'Password Digest'
    ))
  end

  
end
