class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]
  before_filter :authorize, only: [:index, :show, :update, :destroy]

  def index
    @admins = Admin.all
  end

  def show
  end

  def book_checkout
    @books_checked_out = ReadingList.where(out_on_loan: true).count
    @reading_list = ReadingList.where(loan_out_date: nil).page(params[:page]).per_page(50)
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
