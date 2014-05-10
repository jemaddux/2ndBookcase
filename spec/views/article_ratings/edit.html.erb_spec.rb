require 'spec_helper'

describe 'article_ratings/edit' do
  before(:each) do
    @article_rating = assign(:article_rating, stub_model(ArticleRating,
      :article_id => 1,
      :customer_id => 1,
      :rating => 1,
      :active => false
    ))
  end

  it 'renders the edit article_rating form' do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select 'form[action=?][method=?]', article_rating_path(@article_rating), 'post' do
      assert_select 'input#article_rating_article_id[name=?]', 'article_rating[article_id]'
      assert_select 'input#article_rating_customer_id[name=?]', 'article_rating[customer_id]'
      assert_select 'input#article_rating_rating[name=?]', 'article_rating[rating]'
      assert_select 'input#article_rating_active[name=?]', 'article_rating[active]'
    end
  end
end
