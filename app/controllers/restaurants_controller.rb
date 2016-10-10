class RestaurantsController < ApplicationController
	def show
		@restaurant = Restaurant.find(params[:id])
		@types = @restaurant.listtypes.all
	end
end
