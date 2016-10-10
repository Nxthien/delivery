class PageController < ApplicationController
  def index
  	@restaurants = Restaurant.take(21)
		@bearks = Listtype.all.find_all{|food| food.type_food.include?("Ăn sáng")}.take(8)
		@lunch = Listtype.all.find_all{|food| food.type_food.include?("Ăn trưa")}.take(8)
		@light = Listtype.all.find_all{|food| food.type_food.include?("Ăn vặt & Ăn nhẹ")}.take(8)
		@dinner = Listtype.all.find_all{|food| food.type_food.include?("Ăn tối")}.take(8)
  end
  def show
  end
end
