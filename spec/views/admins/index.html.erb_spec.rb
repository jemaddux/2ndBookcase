require 'spec_helper'

describe 'admins/index' do
  before(:each) do
    assign(:admins, [
      stub_model(Admin,
        email: 'Email',
        password_digest: 'Password Digest'
      ),
      stub_model(Admin,
        email: 'Email',
        password_digest: 'Password Digest'
      )
    ])
  end

  it 'renders a list of admins' do
    render
    assert_select 'tr>td', text: 'Email'.to_s, count: 2
    assert_select 'tr>td', text: 'Password Digest'.to_s, count: 2
  end
end
