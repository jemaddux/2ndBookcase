require 'spec_helper'

describe AdminsController do

  let(:valid_attributes) { { "email" => "MyString" } }

  let(:valid_session) { {} }

  describe "GET index" do
  end

  describe "GET show" do
  end

  describe "GET new" do
    it "assigns a new admin as @admin" do
      get :new, {}, valid_session
      assigns(:admin).should be_a_new(Admin)
    end
  end

  describe "GET edit" do
  end

  describe "POST create" do
    describe "with valid params" do
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved admin as @admin" do
        Admin.any_instance.stub(:save).and_return(false)
        post :create, {:admin => { "email" => "invalid value" }}, valid_session
        assigns(:admin).should be_a_new(Admin)
      end

      it "re-renders the 'new' template" do
        Admin.any_instance.stub(:save).and_return(false)
        post :create, {:admin => { "email" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
    end

    describe "with invalid params" do
    end
  end

  describe "DELETE destroy" do
  end

end
