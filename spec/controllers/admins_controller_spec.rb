require 'spec_helper'

describe AdminsController do

  let(:valid_attributes) { { "email" => "MyString" } }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all admins as @admins" do
      admin = Admin.create! valid_attributes
      get :index, {}, valid_session
      assigns(:admins).should eq([admin])
    end
  end

  describe "GET show" do
    it "assigns the requested admin as @admin" do
      admin = Admin.create! valid_attributes
      get :show, {:id => admin.to_param}, valid_session
      assigns(:admin).should eq(admin)
    end
  end

  describe "GET new" do
    it "assigns a new admin as @admin" do
      get :new, {}, valid_session
      assigns(:admin).should be_a_new(Admin)
    end
  end

  describe "GET edit" do
    it "assigns the requested admin as @admin" do
      admin = Admin.create! valid_attributes
      get :edit, {:id => admin.to_param}, valid_session
      assigns(:admin).should eq(admin)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Admin" do
        expect {
          post :create, {:admin => valid_attributes}, valid_session
        }.to change(Admin, :count).by(1)
      end

      it "assigns a newly created admin as @admin" do
        post :create, {:admin => valid_attributes}, valid_session
        assigns(:admin).should be_a(Admin)
        assigns(:admin).should be_persisted
      end

      it "redirects to the created admin" do
        post :create, {:admin => valid_attributes}, valid_session
        response.should redirect_to(Admin.last)
      end
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
      it "updates the requested admin" do
        admin = Admin.create! valid_attributes
        Admin.any_instance.should_receive(:update).with({ "email" => "MyString" })
        put :update, {:id => admin.to_param, :admin => { "email" => "MyString" }}, valid_session
      end

      it "assigns the requested admin as @admin" do
        admin = Admin.create! valid_attributes
        put :update, {:id => admin.to_param, :admin => valid_attributes}, valid_session
        assigns(:admin).should eq(admin)
      end

      it "redirects to the admin" do
        admin = Admin.create! valid_attributes
        put :update, {:id => admin.to_param, :admin => valid_attributes}, valid_session
        response.should redirect_to(admin)
      end
    end

    describe "with invalid params" do
      it "assigns the admin as @admin" do
        admin = Admin.create! valid_attributes
        Admin.any_instance.stub(:save).and_return(false)
        put :update, {:id => admin.to_param, :admin => { "email" => "invalid value" }}, valid_session
        assigns(:admin).should eq(admin)
      end

      it "re-renders the 'edit' template" do
        admin = Admin.create! valid_attributes
        Admin.any_instance.stub(:save).and_return(false)
        put :update, {:id => admin.to_param, :admin => { "email" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested admin" do
      admin = Admin.create! valid_attributes
      expect {
        delete :destroy, {:id => admin.to_param}, valid_session
      }.to change(Admin, :count).by(-1)
    end

    it "redirects to the admins list" do
      admin = Admin.create! valid_attributes
      delete :destroy, {:id => admin.to_param}, valid_session
      response.should redirect_to(admins_url)
    end
  end

end
