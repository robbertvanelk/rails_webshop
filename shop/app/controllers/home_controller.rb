class HomeController < ApplicationController
  def index
  	@category = Category.all
  	@products = Product.order("products.count DESC").limit(3)
  end
end