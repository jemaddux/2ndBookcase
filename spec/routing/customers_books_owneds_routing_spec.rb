require "spec_helper"

describe CustomersBooksOwnedsController do
  describe "routing" do

    it "routes to #index" do
      get("/customers_books_owneds").should route_to("customers_books_owneds#index")
    end

    it "routes to #new" do
      get("/customers_books_owneds/new").should route_to("customers_books_owneds#new")
    end

    it "routes to #show" do
      get("/customers_books_owneds/1").should route_to("customers_books_owneds#show", :id => "1")
    end

    it "routes to #edit" do
      get("/customers_books_owneds/1/edit").should route_to("customers_books_owneds#edit", :id => "1")
    end

    it "routes to #create" do
      post("/customers_books_owneds").should route_to("customers_books_owneds#create")
    end

    it "routes to #update" do
      put("/customers_books_owneds/1").should route_to("customers_books_owneds#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/customers_books_owneds/1").should route_to("customers_books_owneds#destroy", :id => "1")
    end

  end
end
