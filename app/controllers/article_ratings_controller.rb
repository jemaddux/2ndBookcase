class ArticleRatingsController < ApplicationController
  before_action :set_article_rating, only: [:show, :edit, :update, :destroy]

  # GET /article_ratings
  # GET /article_ratings.json
  def index
    @article_ratings = ArticleRating.all
  end

  # GET /article_ratings/1
  # GET /article_ratings/1.json
  def show
  end

  # GET /article_ratings/new
  def new
    @article_rating = ArticleRating.new
  end

  # GET /article_ratings/1/edit
  def edit
  end

  # POST /article_ratings
  # POST /article_ratings.json
  def create
    @article_rating = ArticleRating.new(article_rating_params)

    respond_to do |format|
      if @article_rating.save
        format.html { redirect_to @article_rating, notice: 'Article rating was successfully created.' }
        format.json { render action: 'show', status: :created, location: @article_rating }
      else
        format.html { render action: 'new' }
        format.json { render json: @article_rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /article_ratings/1
  # PATCH/PUT /article_ratings/1.json
  def update
    respond_to do |format|
      if @article_rating.update(article_rating_params)
        format.html { redirect_to @article_rating, notice: 'Article rating was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @article_rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /article_ratings/1
  # DELETE /article_ratings/1.json
  def destroy
    @article_rating.destroy
    respond_to do |format|
      format.html { redirect_to article_ratings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article_rating
      @article_rating = ArticleRating.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_rating_params
      params.require(:article_rating).permit(:article_id, :customer_id, :rating, :active)
    end
end
