class CustomersBooksOwnedsController < ApplicationController
  before_action :set_customers_books_owned, only: [:show, :edit, :update, :destroy]

  # GET /customers_books_owneds
  # GET /customers_books_owneds.json
  def index
    @customers_books_owneds = CustomersBooksOwned.all
  end

  # GET /customers_books_owneds/1
  # GET /customers_books_owneds/1.json
  def show
  end

  # GET /customers_books_owneds/new
  def new
    @customers_books_owned = CustomersBooksOwned.new
  end

  # GET /customers_books_owneds/1/edit
  def edit
  end

  # POST /customers_books_owneds
  # POST /customers_books_owneds.json
  def create
    @customers_books_owned = CustomersBooksOwned.new(customers_books_owned_params)

    respond_to do |format|
      if @customers_books_owned.save
        format.html { redirect_to @customers_books_owned, notice: 'Customers books owned was successfully created.' }
        format.json { render action: 'show', status: :created, location: @customers_books_owned }
      else
        format.html { render action: 'new' }
        format.json { render json: @customers_books_owned.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers_books_owneds/1
  # PATCH/PUT /customers_books_owneds/1.json
  def update
    respond_to do |format|
      if @customers_books_owned.update(customers_books_owned_params)
        format.html { redirect_to @customers_books_owned, notice: 'Customers books owned was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @customers_books_owned.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers_books_owneds/1
  # DELETE /customers_books_owneds/1.json
  def destroy
    @customers_books_owned.destroy
    respond_to do |format|
      format.html { redirect_to customers_books_owneds_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customers_books_owned
      @customers_books_owned = CustomersBooksOwned.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customers_books_owned_params
      params.require(:customers_books_owned).permit(:customer_id, :book_id)
    end
end
