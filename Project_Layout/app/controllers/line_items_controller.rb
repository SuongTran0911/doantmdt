class LineItemsController < ApplicationController
	def index
	end
	def create

           @product = Product.find(params[:id])
        if !current_cart.line_items.exists?(:product_id => @product.id)
            @line_item = LineItem.create!(:cart => current_cart, :product => @product, :quantity => 1, :unit_price => @product.price)
        else
            current_cart.line_items.find_by_product_id(params[:id]).increment!(:quantity)
        end
            
        flash[:notice] = "Added #{@product.nameProduct} to cart."
        redirect_to root_path
    end
    
    def decrease
      current_cart.line_items.find_by_id(params[:id]).decrement!(:quantity)
        redirect_to carts_path
    end

    def increase
      current_cart.line_items.find_by_id(params[:id]).increment!(:quantity)
        redirect_to carts_path
    end
    
    def destroy
        current_cart.line_items.delete(params[:id])
        flash[:success] = "Item deleted"
        redirect_to carts_path
    end
end
