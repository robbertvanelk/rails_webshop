class ProductController < ApplicationController
	def index
		@cat = true
		@category = Category.all
		p_id = params[:id]
		@product = Product.find(p_id)
	end

end
