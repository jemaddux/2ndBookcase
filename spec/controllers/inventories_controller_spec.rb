require 'spec_helper'

describe InventoriesController do

  let(:valid_attributes) { { "book_id" => "1" } }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all inventories as @inventories" do
      inventory = Inventory.create! valid_attributes
      get :index, {}, valid_session
      assigns(:inventories).should eq([inventory])
    end
  end

  describe "GET show" do
    it "assigns the requested inventory as @inventory" do
      inventory = Inventory.create! valid_attributes
      get :show, {:id => inventory.to_param}, valid_session
      assigns(:inventory).should eq(inventory)
    end
  end

  describe "GET new" do
    it "assigns a new inventory as @inventory" do
      get :new, {}, valid_session
      assigns(:inventory).should be_a_new(Inventory)
    end
  end

  describe "GET edit" do
    it "assigns the requested inventory as @inventory" do
      inventory = Inventory.create! valid_attributes
      get :edit, {:id => inventory.to_param}, valid_session
      assigns(:inventory).should eq(inventory)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      xit "creates a new Inventory" do
        expect {
          post :create, {:inventory => valid_attributes}, valid_session
        }.to change(Inventory, :count).by(1)
      end

      xit "assigns a newly created inventory as @inventory" do
        post :create, {:inventory => valid_attributes}, valid_session
        assigns(:inventory).should be_a(Inventory)
        assigns(:inventory).should be_persisted
      end

      xit "redirects to the created inventory" do
        post :create, {:inventory => valid_attributes}, valid_session
        response.should redirect_to(Inventory.last)
      end
    end

    describe "with invalid params" do
      xit "assigns a newly created but unsaved inventory as @inventory" do
        Inventory.any_instance.stub(:save).and_return(false)
        post :create, {:inventory => { "book_id" => "invalid value" }}, valid_session
        assigns(:inventory).should be_a_new(Inventory)
      end

      xit "re-renders the 'new' template" do
        Inventory.any_instance.stub(:save).and_return(false)
        post :create, {:inventory => { "book_id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested inventory" do
        inventory = Inventory.create! valid_attributes
        Inventory.any_instance.should_receive(:update).with({ "book_id" => "1" })
        put :update, {:id => inventory.to_param, :inventory => { "book_id" => "1" }}, valid_session
      end

      it "assigns the requested inventory as @inventory" do
        inventory = Inventory.create! valid_attributes
        put :update, {:id => inventory.to_param, :inventory => valid_attributes}, valid_session
        assigns(:inventory).should eq(inventory)
      end

      it "redirects to the inventory" do
        inventory = Inventory.create! valid_attributes
        put :update, {:id => inventory.to_param, :inventory => valid_attributes}, valid_session
        response.should redirect_to(inventory)
      end
    end

    describe "with invalid params" do
      it "assigns the inventory as @inventory" do
        inventory = Inventory.create! valid_attributes
        Inventory.any_instance.stub(:save).and_return(false)
        put :update, {:id => inventory.to_param, :inventory => { "book_id" => "invalid value" }}, valid_session
        assigns(:inventory).should eq(inventory)
      end

      it "re-renders the 'edit' template" do
        inventory = Inventory.create! valid_attributes
        Inventory.any_instance.stub(:save).and_return(false)
        put :update, {:id => inventory.to_param, :inventory => { "book_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested inventory" do
      inventory = Inventory.create! valid_attributes
      expect {
        delete :destroy, {:id => inventory.to_param}, valid_session
      }.to change(Inventory, :count).by(-1)
    end

    it "redirects to the inventories list" do
      inventory = Inventory.create! valid_attributes
      delete :destroy, {:id => inventory.to_param}, valid_session
      response.should redirect_to(inventories_url)
    end
  end

end
