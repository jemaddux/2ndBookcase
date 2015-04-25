require 'spec_helper'

describe 'article_ratings/index' do
  before(:each) do
    assign(:article_ratings, [
      stub_model(ArticleRating,
        article_id: 1,
        customer_id: 2,
        rating: 3,
        active: false
      ),
      stub_model(ArticleRating,
        article_id: 1,
        customer_id: 2,
        rating: 3,
        active: false
      )
    ])
  end

  it 'renders a list of article_ratings' do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select 'tr>td', text: 1.to_s, count: 2
    assert_select 'tr>td', text: 2.to_s, count: 2
    assert_select 'tr>td', text: 3.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
  end
end
