class CategoryController < ApplicationController
	def index
		@cat = true
		@category = Category.all
		c_id = params[:id]
		@catt = Category.find(c_id)
		@products = Product.where(:category_id => @catt.id)
	end

end
