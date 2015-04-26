require 'spec_helper'

describe Book do
  let(:book){
    b = Book.new
    b.name = "A Game of Thrones"
    b.description = "In a land where summers can last decades and winters a lifetime, trouble is brewing. The cold it returning..."
    b.author = "George R.R. Martin"
    b.save!
    b
  }

  describe "book types" do
  end
end
