class Admins::ListTypesController < ApplicationController
	layout "admin"
	before_action :types
	def index
		@res = Restaurant.find(params[:restaurant_id])
		@list_types = @res.listtypes.all
	end
	def home
		@res = Restaurant.all
		#@list_types = Listtype.all
	end
	def search
		@res = Restaurant.find(params[:restaurant_id])
		@list_types = @res.listtypes.all
	end
	def show
		@type = Listtype.find(params[:id ])
	end
	def create
		@type = Listtype.new(type_params)
		if @type.save
			flash[:success] = "Create A Type Food"
			redirect_to admins_restaurant_list_types_path(params[:restaurant_id])
		else
			flash[:danger] = " Create A Type Food Failed"
			redirect_to admins_restaurant_list_types_path(params[:restaurant_id])
		end
	end

	def update
		@type = Listtype.find(params[:id])
		@type.update_attributes(type_params)

		if @type.save
			flash[:success] = " Update Compleled"
			redirect_to admins_restaurant_list_types_path(params[:restaurant_id])
		else
			flash[:danger] = " Update Failed"
			redirect_to admins_restaurant_list_types_path(params[:restaurant_id])
		end	 	
	end 

	def destroy
		@type = Listtype.find(params[:id]).destroy
		redirect_to admins_restaurant_list_types_path(params[:restaurant_id])
	end

	private

		def types
			@types_name = ["Ăn sáng","Ăn trưa","Ăn xế","Ăn tối","Ăn vặt & Ăn nhẹ","Thức uống","Mì Bún Phở Cháo","Pizza & Hamburger" ,"Bánh & Kem" ,"Cơm gà & Cơm tấm","Thịt nướng & quay","Sushi & Sashimi" ,"Món chay","Cơm văn phòng","Lẩu","Trà sữa & Trà chanh",
	    "Hải sản","Bánh mì & Xôi","Thức ăn nhanh","Thực phẩm & Nguyên liệu","Trái cây sạch","Dimsum","Bún Chả Hà Nội","Bún Đậu Mắm Tôm","Rượu Vang","Gà Vịt Heo","Cơm gia đình","Mì Cay Hàn Quốc","Cháo ếch","Mì Quảng","Bánh Tráng Trộn","Bánh Trung Thu","Rau câu & Bánh Flan",
	    "Trà sữa ngon"]
	  end 

		def type_params
			params.require(:listtype).permit(:name, :type_food, :restaurant_id)
		end

end
