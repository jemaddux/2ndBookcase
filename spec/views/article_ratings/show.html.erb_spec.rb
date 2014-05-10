require 'spec_helper'

describe 'article_ratings/show' do
  before(:each) do
    @article_rating = assign(:article_rating, stub_model(ArticleRating,
      :article_id => 1,
      :customer_id => 2,
      :rating => 3,
      :active => false
    ))
  end

  it 'renders attributes in <p>' do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/false/)
  end
end
