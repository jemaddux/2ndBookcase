require 'spec_helper'

describe 'articles/index' do
  before(:each) do
    assign(:articles, [
      stub_model(Article,
        title: 'Title',
        body: 'MyText',
        customer_id: 1,
        rating: 1.5,
        published: false
      ),
      stub_model(Article,
        title: 'Title',
        body: 'MyText',
        customer_id: 1,
        rating: 1.5,
        published: false
      )
    ])
  end
end
