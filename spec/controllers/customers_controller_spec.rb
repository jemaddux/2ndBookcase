require 'spec_helper'

describe CustomersController do

  let(:valid_attributes) { {
    "first_name" => "first_name",
    "last_name" => "last_name",
    "street_address" => "123 Main",
    "city" => "derptown",
    "state" => "GA",
    "zipcode" => "30030",
    "password" => "password",
    "password_confirmation" => "password",
    "email" => "some@email.com"
  } }

  let(:valid_session) { {} }

  describe "GET index" do
    xit "assigns all customers as @customers" do
      customer = Customer.create! valid_attributes
      get :index, {}, valid_session
      assigns(:customers).should eq([customer])
    end
  end

  describe "GET show" do
    xit "assigns the requested customer as @customer" do
      customer = Customer.create! valid_attributes
      get :show, {:id => customer.to_param}, valid_session
      assigns(:customer).should eq(customer)
    end
  end

  describe "GET new" do
    it "assigns a new customer as @customer" do
      get :new, {}, valid_session
      assigns(:customer).should be_a_new(Customer)
    end
  end

  describe "GET edit" do
    xit "assigns the requested customer as @customer" do
      customer = Customer.create! valid_attributes
      get :edit, {:id => customer.to_param}, valid_session
      assigns(:customer).should eq(customer)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Customer" do
        expect {
          post :create, {:customer => valid_attributes}, valid_session
        }.to change(Customer, :count).by(1)
      end

      it "assigns a newly created customer as @customer" do
        post :create, {:customer => valid_attributes}, valid_session
        assigns(:customer).should be_a(Customer)
        assigns(:customer).should be_persisted
      end

      xit "redirects to the created customer" do
        post :create, {:customer => valid_attributes}, valid_session
        response.should redirect_to(Customer.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved customer as @customer" do
        Customer.any_instance.stub(:save).and_return(false)
        post :create, {:customer => { "first_name" => "invalid value", "password" => "password", "password_confirmation" => "password", "email" => "some@email.com" }}, valid_session
        assigns(:customer).should be_a_new(Customer)
      end

      it "re-renders the 'new' template" do
        Customer.any_instance.stub(:save).and_return(false)
        post :create, {:customer => { "first_name" => "invalid value", "password" => "password", "password_confirmation" => "password", "email" => "some@email.com" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      xit "updates the requested customer" do
        customer = Customer.create! valid_attributes
        Customer.any_instance.should_receive(:update).with({ "first_name" => "MyString" })
        put :update, {:id => customer.to_param, :customer => { "first_name" => "MyString" }}, valid_session
      end

      xit "assigns the requested customer as @customer" do
        customer = Customer.create! valid_attributes
        put :update, {:id => customer.to_param, :customer => valid_attributes}, valid_session
        assigns(:customer).should eq(customer)
      end

      xit "redirects to the customer" do
        customer = Customer.create! valid_attributes
        put :update, {:id => customer.to_param, :customer => valid_attributes}, valid_session
        response.should redirect_to(customer)
      end
    end

    describe "with invalid params" do
      xit "assigns the customer as @customer" do
        customer = Customer.create! valid_attributes
        Customer.any_instance.stub(:save).and_return(false)
        put :update, {:id => customer.to_param, :customer => { "first_name" => "invalid value" }}, valid_session
        assigns(:customer).should eq(customer)
      end

      xit "re-renders the 'edit' template" do
        customer = Customer.create! valid_attributes
        Customer.any_instance.stub(:save).and_return(false)
        put :update, {:id => customer.to_param, :customer => { "first_name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    xit "destroys the requested customer" do
      customer = Customer.create! valid_attributes
      expect {
        delete :destroy, {:id => customer.to_param}, valid_session
      }.to change(Customer, :count).by(-1)
    end

    xit "redirects to the customers list" do
      customer = Customer.create! valid_attributes
      delete :destroy, {:id => customer.to_param}, valid_session
      response.should redirect_to(customers_url)
    end
  end

end
