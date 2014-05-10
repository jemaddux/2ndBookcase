require 'spec_helper'

describe 'article_comments/index' do
  before(:each) do
    assign(:article_comments, [
      stub_model(ArticleComment,
        :article_id => 1,
        :customer_id => 2,
        :active => false
      ),
      stub_model(ArticleComment,
        :article_id => 1,
        :customer_id => 2,
        :active => false
      )
    ])
  end

  it 'renders a list of article_comments' do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select 'tr>td', :text => 1.to_s, :count => 2
    assert_select 'tr>td', :text => 2.to_s, :count => 2
    assert_select 'tr>td', :text => false.to_s, :count => 2
  end
end
