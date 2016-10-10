# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

types_name = ["Ăn sáng","Ăn trưa","Ăn xế","Ăn tối","Ăn vặt & Ăn nhẹ","Thức uống","Mì Bún Phở Cháo","Pizza & Hamburger" ,"Bánh & Kem" ,"Cơm gà & Cơm tấm","Thịt nướng & quay","Sushi & Sashimi" ,"Món chay","Cơm văn phòng","Lẩu","Trà sữa & Trà chanh",
	    "Hải sản","Bánh mì & Xôi","Thức ăn nhanh","Thực phẩm & Nguyên liệu","Trái cây sạch","Dimsum","Bún Chả Hà Nội","Bún Đậu Mắm Tôm","Rượu Vang","Gà Vịt Heo","Cơm gia đình","Mì Cay Hàn Quốc","Cháo ếch","Mì Quảng","Bánh Tráng Trộn","Bánh Trung Thu","Rau câu & Bánh Flan",
	    "Trà sữa ngon"]
Listtype.all.each do |type|
	
	type.update_attributes(type_food: types_name.sample(3) )
	puts "Done"
end
