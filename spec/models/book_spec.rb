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
    describe "mobi" do
      it "should be a mobi" do
        book.mobi_url = "url"
        book.mobi?.should == true
      end

      it "shouldn't be a mobi" do
        book.mobi_url = nil
        book.mobi?.should == false
      end

      it "shouldn't be a mobi" do
        book.mobi_url = ""
        book.mobi?.should == false
      end
    end

    describe "pdf" do
      it "should be a pdf" do
        book.pdf_url = "url"
        book.pdf?.should == true
      end

      it "shouldn't be a pdf" do
        book.pdf_url = nil
        book.pdf?.should == false
      end

      it "shouldn't be a pdf" do
        book.pdf_url = ""
        book.pdf?.should == false
      end
    end

    describe "epub" do
      it "should be a epub" do
        book.epub_url = "url"
        book.epub?.should == true
      end

      it "shouldn't be a epub" do
        book.epub_url = nil
        book.epub?.should == false
      end

      it "shouldn't be a epub" do
        book.epub_url = ""
        book.epub?.should == false
      end
    end

    describe "txt" do
      it "should be a txt" do
        book.txt_url = "url"
        book.txt?.should == true
      end

      it "shouldn't be a txt" do
        book.txt_url = nil
        book.txt?.should == false
      end

      it "shouldn't be a txt" do
        book.txt_url = ""
        book.txt?.should == false
      end
    end
  end
end
