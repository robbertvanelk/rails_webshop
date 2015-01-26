class HomeController < ApplicationController
  def index
  	@cat = true
  	@category = Category.all
  	@products = Product.order("products.count DESC").limit(3)
  	@productsnew = Product.order("products.created_at DESC").limit(3)
  end
end
