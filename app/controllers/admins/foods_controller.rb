class Admins::FoodsController < ApplicationController
	layout "admin"
	def index
		@res = Restaurant.find(params[:restaurant_id])
		@type = Listtype.find(params[:list_type_id])
		@foods = @type.foods.all
	end
	def home
		@ress = Restaurant.all
		# if params[:value].present?
		# 	respond_to do |format|
		# 		format.html
		# 		@types = Listtype.find(params[:value])
		# 		format.js { render :json => @types }
		# 	end
		# end

	end
	def find_type
		@res = Restaurant.find(params[:restaurant_id])
		@types = @res.listtypes.all

	end
	def show
		@food = Food.find(params[:id])
	end
	def search
		if params[:list_type_id]
			@res = Restaurant.find(params[:restaurant_id])
			@type = @res.listtypes.find(params[:list_type_id])
			@foods = @type.foods.all
		end
	end
	def update
		@food = Food.find(params[:id]).update_attributes(foods_params)
		if @food
			flash[:success] = "Updated Complete"
			redirect_to admins_restaurant_list_type_foods_path(params[:restaurant_id], params[:list_type_id])
		else
			flash[:danger] = "Update Food Faild"
			redirect_to admins_restaurant_list_type_foods_path(params[:restaurant_id], params[:list_type_id])
		end
	end
	def create
		@food = Food.new(foods_params)
		if @food.save
			flash[:success] = "Created Food"
			redirect_to admins_restaurant_list_type_foods_path(params[:restaurant_id], params[:list_type_id])
		else
			flash[:danger] = "Created Food Fail"
			redirect_to admins_restaurant_list_type_foods_path(params[:restaurant_id], params[:list_type_id])
		end
	end
	def destroy
		@food = Food.find(params[:id]).destroy
		redirect_to admins_restaurant_list_type_foods_path(params[:restaurant_id], params[:list_type_id])
	end
	private

	def foods_params
		params.require(:food).permit(:name, :basicprice, :amount, :countorder, :bouns, :price, :image, :listtype_id)
	end
end
