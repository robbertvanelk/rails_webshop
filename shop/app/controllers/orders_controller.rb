class OrdersController < ApplicationController
	def create

	end

	def show
		@order = Order.find(params[:id])
		@products = Product.where(id: @order.product_id).all.to_a
	end

	def index
		@user = current_user
		@orders = Order.where(user_id: @user.id).all.to_a
	end
end
