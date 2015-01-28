class ShoppingCartsController < ApplicationController
	before_filter :extract_shopping_cart

	def create
		@product = Product.find(params[:product_id])
		@shopping_cart.add(@product, @product.price)
		redirect_to shopping_cart_path
	end

	def show
		@cat = true
		@category = Category.all
	end

	def remove
		@name = params[:name]
		@p = Product.find_by(name: @name)
		@shopping_cart.remove(@p,1)
		redirect_to shopping_cart_path
	end

	def buy
		@order = Order.new	
		@products = Product.all
		@products.each do |p|
			@item = @shopping_cart.item_for(p)
			if @item != nil
				@count = p.count
				if @count == nil
					@count = 0
				end
				@order.product = p
				@extra = @shopping_cart.quantity_for(p)
				p.count = @count + @extra
				p.save
			else
			end
		end
		@order.user = current_user
		@order.save
		@shopping_cart.clear
		redirect_to @order
	end

	private
	def extract_shopping_cart
		shopping_cart_id = session[:shopping_cart_id]
		@shopping_cart = session[:shopping_cart_id] ? Cart.find(shopping_cart_id) : Cart.create
		session[:shopping_cart_id] = @shopping_cart.id
	end
end
