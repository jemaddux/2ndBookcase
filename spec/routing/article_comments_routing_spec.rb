require "spec_helper"

describe ArticleCommentsController do
  describe "routing" do

    it "routes to #index" do
      get("/article_comments").should route_to("article_comments#index")
    end

    it "routes to #new" do
      get("/article_comments/new").should route_to("article_comments#new")
    end

    it "routes to #show" do
      get("/article_comments/1").should route_to("article_comments#show", :id => "1")
    end

    it "routes to #edit" do
      get("/article_comments/1/edit").should route_to("article_comments#edit", :id => "1")
    end

    it "routes to #create" do
      post("/article_comments").should route_to("article_comments#create")
    end

    it "routes to #update" do
      put("/article_comments/1").should route_to("article_comments#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/article_comments/1").should route_to("article_comments#destroy", :id => "1")
    end

  end
end
