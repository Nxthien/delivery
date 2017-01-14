class PageController < ApplicationController
  def index
  	@restaurants = Restaurant.all
		@bearks = Listtype.all.find_all{|food| food.type_food.include?("Ăn sáng")}.take(8)
		@lunch = Listtype.all.find_all{|food| food.type_food.include?("Ăn trưa")}.take(8)
		@light = Listtype.all.find_all{|food| food.type_food.include?("Ăn vặt & Ăn nhẹ")}.take(8)
		@dinner = Listtype.all.find_all{|food| food.type_food.include?("Ăn tối")}.take(8)
  end

  def search
  	@restaurant = Restaurant.find_by_name(params[:search][:name])
    if @restaurant
      redirect_to restaurant_path(@restaurant)
    else
      flash[:danger] = "Restaurant not exist"
      redirect_to root_path
    end
  end

  def show
  end

end
