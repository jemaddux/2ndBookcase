require 'json'
require 'net/http'
require 'open-uri'

class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]
  before_action :authorize, only: [:index, :show, :update, :destroy]

  def index
    @admins = Admin.all
  end

  def show
  end

  def checkout_book
    Book.checkout_book(params)
    redirect_to :back
  end

  def check_in_book
    Book.check_in_book(params)
    redirect_to :back
  end

  def book_checkout
    @books_checked_out = ReadingList.where(out_on_loan: true).count
    @reading_list = ReadingList.where(loan_out_date: nil).page(params[:page]).per_page(20)
  end

  def book_check_in
    @books_checked_out = ReadingList.where(out_on_loan: true).page(params[:page]).per_page(20)
  end

  def get_new_books
    access_key = "OQJO27UT"
    uri =  "http://www.isbndb.com/api/books.xml"
    uri += "?access_key=#{access_key}&index1=title&value1=thief+of+time"
    @books = Hash.from_xml(open(uri))["ISBNdb"]["BookList"]["BookData"]
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
