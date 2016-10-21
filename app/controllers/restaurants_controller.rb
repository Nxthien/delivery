class RestaurantsController < ApplicationController
	def show
		@restaurant = Restaurant.find(params[:id])
		@types = @restaurant.listtypes.all
	end
	def order
		@food = Food.find(params[:food_id])
	end
end
