class RestaurantsController < ApplicationController
	require 'will_paginate/array'
	def index
		@restaurants = Restaurant.all.paginate(:page => params[:page], :per_page => 30)	
	end

	def show
		@restaurant = Restaurant.find(params[:id])
		@types = @restaurant.listtypes.all
	end

	def order
		@food = Food.find(params[:food_id])
	end

	def search_type
		@results = Listtype.all.find_all{|food| food.type_food.include?(params[:type])}.paginate(:page => params[:page], :per_page => 30)
	end
end
