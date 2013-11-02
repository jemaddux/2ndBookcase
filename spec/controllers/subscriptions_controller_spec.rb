require 'spec_helper'

describe SubscriptionsController do

  let(:valid_attributes) { { "plan_id" => "1" } }

  let(:valid_session) { {} }

  describe "GET index" do
  end

  describe "GET show" do
  end

  describe "GET new" do
    it "assigns a new subscription as @subscription" do
      get :new, {}, valid_session
      assigns(:subscription).should be_a_new(Subscription)
    end
  end

  describe "GET edit" do
  end

  describe "POST create" do
    describe "with valid params" do
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved subscription as @subscription" do
        Subscription.any_instance.stub(:save).and_return(false)
        post :create, {:subscription => { "plan_id" => "invalid value" }}, valid_session
        assigns(:subscription).should be_a_new(Subscription)
      end

      it "re-renders the 'new' template" do
        Subscription.any_instance.stub(:save).and_return(false)
        post :create, {:subscription => { "plan_id" => "invalid value" }}, valid_session
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
