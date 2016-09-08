class Admins::RestaurantsController < ApplicationController
	layout "admin"
	def index
		@restaurants = Restaurant.all
	end
	
	def show
		@restaurant = Restaurant.find(params[:id])
	end
	def new
		@restaurant = Restaurant.new		
	end
	def edit
		@restaurant = Restaurant.find(params[:id])
	end
	def create
		@restaurant = Restaurant.new(res_params)
		if @restaurant.save
			flash[:success] = "Created Restaurant"
			redirect_to admins_restaurants_path
		else
			flash[:danger] = "Create Restaurant Fail"
			redirect_to admins_restaurants_path
		end
	end
	def destroy
		@restaurant = Restaurant.find(params[:id]).destroy
		redirect_to admins_restaurants_path
	end
	def update
		@restaurant = Restaurant.find(params[:id])
		@restaurant.update_attributes(res_params)
		if @restaurant.save
			flash[:success] = "Updated Restaurant"
			redirect_to admins_restaurants_path
		else
			flash[:danger] = "Update Restaurant Fail" 
			redirect_to edit_admins_restaurant_path
		end
	end

	private

	def res_params
		params.require(:restaurant).permit(:region, :name, :type_restaurant, :address, :time_open, :time_close, :price_range)
	end
end
