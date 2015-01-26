class CategoryController < ApplicationController
	def index
		@cat = true
		@category = Category.all
		c_id = params[:id]
		@cat = Category.find(c_id)
		@products = Product.where(:category_id => @cat.id)
	end

end
