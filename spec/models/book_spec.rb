require 'spec_helper'

describe Book do
  let(:book){
    b = Book.new
    b.save!
    b
  }

  describe "book types" do
    it "should be a mobi" do
     book.mobi?.should == true
    end

    xit "shouldn't be a mobi" do

    end
  end
end
