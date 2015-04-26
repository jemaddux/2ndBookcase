class CustomersBooksReadsController < ApplicationController
  before_action :set_customers_books_read, only: [:show, :edit, :update, :destroy]

  # GET /customers_books_reads (.json)
  def index
    @customers_books_reads = CustomersBooksRead.all
  end

  # GET /customers_books_reads/1 (.json)
  def show
  end

  # GET /customers_books_reads/new
  def new
    @customers_books_read = CustomersBooksRead.new
  end

  # GET /customers_books_reads/1/edit
  def edit
  end

  # POST /customers_books_reads (.json)
  def create
    @customers_books_read = CustomersBooksRead.new(customers_books_read_params)

    respond_to do |format|
      if @customers_books_read.save
        format.html { redirect_to @customers_books_read, notice: 'Customers books read was successfully created.' }
        format.json { render action: 'show', status: :created, location: @customers_books_read }
      else
        format.html { render action: 'new' }
        format.json { render json: @customers_books_read.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @customers_books_read.update(customers_books_read_params)
        format.html { redirect_to @customers_books_read, notice: 'Customers books read was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @customers_books_read.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers_books_reads/1 (.json)
  def destroy
    @customers_books_read.destroy
    respond_to do |format|
      format.html { redirect_to customers_books_reads_url }
      format.json { head :no_content }
    end
  end

  private
    def set_customers_books_read
      @customers_books_read = CustomersBooksRead.find(params[:id])
    end

    def customers_books_read_params
      params.require(:customers_books_read).permit(:customer_id, :book_id)
    end
end
