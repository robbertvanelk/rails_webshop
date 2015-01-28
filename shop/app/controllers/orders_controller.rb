class OrdersController < ApplicationController
	def create

	end

	def show
		@cat = true
		@category = Category.all
		@order = Order.find(params[:id])
		@products = Product.where(id: @order.product_id).all.to_a
	end

	def index
		@cat = true
		@category = Category.all
		@user = current_user
		@orders = Order.where(user_id: @user.id).all.to_a
	end
end
