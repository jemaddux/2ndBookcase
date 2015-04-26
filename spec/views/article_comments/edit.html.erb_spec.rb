require 'spec_helper'

describe 'article_comments/edit' do
  before(:each) do
    @article_comment = assign(:article_comment, stub_model(ArticleComment,
      article_id: 1,
      customer_id: 1,
      active: false
    ))
  end
end
