class ProductsController < ApplicationController
  layout 'admin' , except: :show
  before_action :authenticate_user! , except: :show
  before_action :set_product, only: [:show, :edit, :update, :destroy, :upvote, :downvote ]

  # GET /products
  # GET /products.json
  def index
    @search = Product.all.ransack(params[:q])
    @products = Product.all.order(id: :desc).page(params[:page]).per params[:limit]
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @categories = Category.all
    @product = Product.find(params[:id])
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to products_url, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to products_url, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def upvote 
    @product.upvote_by current_user
    redirect_to :back
  end  

  def downvote
    @product.downvote_by current_user
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:nameProduct, :price, :content,:address, :discount, :image_link, :image_list, :view, :user_id, :category_id)
    end
end