class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]
  before_filter :authorize, only: [:index, :show, :update, :destroy]

  def index
    @admins = Admin.all
  end

  def show
  end

  def checkout_book
    # inventory = first_available_inventory(params["book_id"])
    # inventory.checked_out = true
    # inventory.save

    # reading_list = ReadingList.find(params["reading_list_id"])
    # reading_list.loan_out_date = Date.today
    # reading_list.loan_out_condition = inventory.condition
    # reading_list.inventory_id = inventory.id
    # reading_list.out_on_loan = true
    # reading_list.save
    Book.checkout_book(params)

    redirect_to :back
  end

  def check_in_book
    i = Inventory.find(params[:inventory_id])
    i.checked_out = false
    i.condition = params[:returned_condition]
    i.in_circulation = false if params[:returned_condition] == "retired"
    i.save

    rl_dataset = ReadingList.where(out_on_loan: true)
    rl = rl_dataset.find_by_inventory_id(params[:inventory_id])

    rl.returned_date = Date.today
    rl.out_on_loan = false
    rl.in_list = false
    if params[:returned_condition]
      rl.returned_condition = params[:returned_condition]
    else
      rl.returned_condition = rl.loan_out_condition
    end
    rl.save

    redirect_to :back
  end

  def book_checkout
    @books_checked_out = ReadingList.where(out_on_loan: true).count
    @reading_list = ReadingList.where(loan_out_date: nil).page(params[:page]).per_page(20)
  end

  def book_check_in
    @books_checked_out = ReadingList.where(out_on_loan: true).page(params[:page]).per_page(20)
  end

  def new
    @admin = Admin.new
  end

  def edit
  end

  def create
    @admin = Admin.create_admin(params)

    if @admin.save
      session[:admin_id] = @admin.id
      redirect_to root_url, notice: 'Admin was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @admin.update(admin_params)
      redirect_to @admin, notice: 'Admin was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @admin.destroy
    redirect_to admins_url
  end

  private
    def set_admin
      @admin = Admin.find(params[:id])
    end

    def admin_params
      params.require(:admin).permit(:email, :password_digest)
    end
end
