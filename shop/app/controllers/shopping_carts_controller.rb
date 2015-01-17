class ShoppingCartsController < ApplicationController
	before_filter :extract_shopping_cart

	def create
		@product = Product.find(params[:product_id])
		@shopping_cart.add(@product, @product.price)
		redirect_to shopping_cart_path
	end

	def show
		@category = Category.all
	end

	def remove
		@name = params[:name]
		@p = Product.find_by(name: @name)
		@shopping_cart.remove(@p,1)
		puts "hallo"
		puts @p

		redirect_to shopping_cart_path
	end

	def buy
		@products = Product.all
		@products.each do |p|
			@item = @shopping_cart.item_for(p)
			if @item != nil
				@count = p.count
				if @count == nil
					@count = 0
				end
				@extra = @shopping_cart.quantity_for(p)
				p.count = @count + @extra
				p.save
				puts "aantal"
				puts p.count
			else
			end
		end
		@shopping_cart.clear
		redirect_to home_index_path
	end

	private
	def extract_shopping_cart
		shopping_cart_id = session[:shopping_cart_id]
		@shopping_cart = session[:shopping_cart_id] ? Cart.find(shopping_cart_id) : Cart.create
		session[:shopping_cart_id] = @shopping_cart.id
	end
end
