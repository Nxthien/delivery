class PageController < ApplicationController
  def index
  	@restaurants = Restaurant.take(21)
		
  end
end
