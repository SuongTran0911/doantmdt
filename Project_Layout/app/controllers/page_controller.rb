class PageController < ApplicationController
  def home

  	#categories
  	@categories = Category.all
  	#product latest
  	@products = Product.order(id: :desc).take(12)
  	#product liked much
  	@recommend_products = Product.order(:cached_votes_score => :desc).take(12)  
  	# top 3 product liked much
  	@slider_products = Product.order(:cached_votes_score => :desc).take(3) 
  end

  def about
  end

  def contact
  end
end
