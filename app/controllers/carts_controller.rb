class CartsController < ApplicationController
	before_action :authenticate_user!
	def create
		if current_user.present?
			@cart = Cart.create(cart_params)
			@cart.user_id = current_user.id
			@cart.save
			redirect_to user_list_cart_path
		else
			redirect_to restaurant_path(params[:restaurant_id])
		end
	end

	def user_list_cart 
		@carts = current_user.carts.all
	end

	private
	def cart_params
		params.require(:cart).permit!
	end
end
