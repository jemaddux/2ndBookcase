require "spec_helper"

describe CustomersBooksReadsController do
  describe "routing" do

    it "routes to #index" do
      get("/customers_books_reads").should route_to("customers_books_reads#index")
    end

    it "routes to #new" do
      get("/customers_books_reads/new").should route_to("customers_books_reads#new")
    end

    it "routes to #show" do
      get("/customers_books_reads/1").should route_to("customers_books_reads#show", :id => "1")
    end

    it "routes to #edit" do
      get("/customers_books_reads/1/edit").should route_to("customers_books_reads#edit", :id => "1")
    end

    it "routes to #create" do
      post("/customers_books_reads").should route_to("customers_books_reads#create")
    end

    it "routes to #update" do
      put("/customers_books_reads/1").should route_to("customers_books_reads#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/customers_books_reads/1").should route_to("customers_books_reads#destroy", :id => "1")
    end

  end
end
