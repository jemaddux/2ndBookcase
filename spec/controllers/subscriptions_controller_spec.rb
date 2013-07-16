require 'spec_helper'

describe SubscriptionsController do

  let(:valid_attributes) { { "plan_id" => "1" } }

  let(:valid_session) { {} }

  describe "GET index" do
    xit "assigns all subscriptions as @subscriptions" do
      subscription = Subscription.create! valid_attributes
      get :index, {}, valid_session
      assigns(:subscriptions).should eq([subscription])
    end
  end

  describe "GET show" do
    xit "assigns the requested subscription as @subscription" do
      subscription = Subscription.create! valid_attributes
      get :show, {:id => subscription.to_param}, valid_session
      assigns(:subscription).should eq(subscription)
    end
  end

  describe "GET new" do
    it "assigns a new subscription as @subscription" do
      get :new, {}, valid_session
      assigns(:subscription).should be_a_new(Subscription)
    end
  end

  describe "GET edit" do
    xit "assigns the requested subscription as @subscription" do
      subscription = Subscription.create! valid_attributes
      get :edit, {:id => subscription.to_param}, valid_session
      assigns(:subscription).should eq(subscription)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      xit "creates a new Subscription" do
        expect {
          post :create, {:subscription => valid_attributes}, valid_session
        }.to change(Subscription, :count).by(1)
      end

      xit "assigns a newly created subscription as @subscription" do
        post :create, {:subscription => valid_attributes}, valid_session
        assigns(:subscription).should be_a(Subscription)
        assigns(:subscription).should be_persisted
      end

      xit "redirects to the created subscription" do
        post :create, {:subscription => valid_attributes}, valid_session
        response.should redirect_to(Subscription.last)
      end
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
      xit "updates the requested subscription" do
        subscription = Subscription.create! valid_attributes
        Subscription.any_instance.should_receive(:update).with({ "plan_id" => "1" })
        put :update, {:id => subscription.to_param, :subscription => { "plan_id" => "1" }}, valid_session
      end

      xit "assigns the requested subscription as @subscription" do
        subscription = Subscription.create! valid_attributes
        put :update, {:id => subscription.to_param, :subscription => valid_attributes}, valid_session
        assigns(:subscription).should eq(subscription)
      end

      xit "redirects to the subscription" do
        subscription = Subscription.create! valid_attributes
        put :update, {:id => subscription.to_param, :subscription => valid_attributes}, valid_session
        response.should redirect_to(subscription)
      end
    end

    describe "with invalid params" do
      xit "assigns the subscription as @subscription" do
        subscription = Subscription.create! valid_attributes
        Subscription.any_instance.stub(:save).and_return(false)
        put :update, {:id => subscription.to_param, :subscription => { "plan_id" => "invalid value" }}, valid_session
        assigns(:subscription).should eq(subscription)
      end

      xit "re-renders the 'edit' template" do
        subscription = Subscription.create! valid_attributes
        Subscription.any_instance.stub(:save).and_return(false)
        put :update, {:id => subscription.to_param, :subscription => { "plan_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    xit "destroys the requested subscription" do
      subscription = Subscription.create! valid_attributes
      expect {
        delete :destroy, {:id => subscription.to_param}, valid_session
      }.to change(Subscription, :count).by(-1)
    end

    xit "redirects to the subscriptions list" do
      subscription = Subscription.create! valid_attributes
      delete :destroy, {:id => subscription.to_param}, valid_session
      response.should redirect_to(subscriptions_url)
    end
  end

end
