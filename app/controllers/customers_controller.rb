class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  before_filter :authorize, only: [:show, :edit]

  def index
    @customers = Customer.all.page(params[:page]).per_page(50)
  end

  def show
  end

  def new
    @customer = Customer.new
  end

  def edit
  end

  def reading_list
    @books = current_customer.reading_list_books
  end

  def create
    @customer = Customer.create_customer(params)

    if @customer.save
      session[:customer_id] = @customer.id
      redirect_to new_subscription_path
    else
      render action: 'new'
    end
  end

  def update
    if @customer.update(customer_params)
      redirect_to @customer, notice: 'Customer was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @customer.destroy
    redirect_to customers_url
  end

  private
    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :email, :street_address, :city, :state, :zipcode, :account_status, :rental_plan)
    end
end
