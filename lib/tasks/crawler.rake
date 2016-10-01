require 'open-uri'
require 'nokogiri'
task :crawl => :environment do
  n = 1
  while n < 10
    html = open("https://www.deliverynow.vn/ha-noi/danh-sach-dia-diem-giao-tan-noi-trang-#{n}").read
    nokogiri_object = Nokogiri::HTML(html)
    nokogiri_object.css("#list-page .container-list-restaurant .widget-list-restaurant").each do |restaurant|
      link_restaurant = restaurant.css(".info-list-restaurant a").attr("href").value
      if !link_restaurant.include? "{"
         link = "https://www.deliverynow.vn"+ link_restaurant
        info_restaurant = open(link).read
        nokogiri_restaurant = Nokogiri::HTML(info_restaurant)

        imagecrawl = nokogiri_restaurant.css("#detail-page .info-detail-restaurant .box-hot-restaurant .img-hot-restaurant img")
                                        .attr('src').value
        info_restaurant = nokogiri_restaurant.css("#detail-page .info-detail-restaurant .box-hot-restaurant .info-basic-hot-restaurant")
        type_restaurant = info_restaurant.css(".kind-restaurant").children.text.strip
        name = info_restaurant.css(".name-hot-restaurant").children.text.strip
        puts name
        address = info_restaurant.xpath("p[1]").text
        time_open = info_restaurant.xpath("p[2]/span[1]").text.slice(0..4)
        time_close = info_restaurant.xpath("p[2]/span[1]").text.slice(8..12)
        price_range = info_restaurant.xpath("p[2]/span[3]").text.strip
        if !Restaurant.where(name: name).present?
          restaurant = Restaurant.create(region: 1 ,name: name, type_restaurant: type_restaurant, address: address, time_open: time_open, time_close: time_close, price_range: price_range, coverimage: imagecrawl)
          menu_list = nokogiri_restaurant.css("#detail-page .container-content .container-menu-restaurant .kind-menu-restaurant .table-of-contents li")
          menu_list.each do | list_item |
            type_name = list_item.css("h2").text.strip
            id_type = list_item.css("a").attr("href").value.delete("#")
            if !restaurant.listtypes.where(name: type_name).present?
              type = restaurant.listtypes.create(name: type_name)
              menu_kind = nokogiri_restaurant.css("#detail-page .container-content .container-menu-restaurant .detail-menu-kind ##{id_type} .box-menu-detail")  
              menu_kind.each do |sp|
                img_crawl = sp.css(".img-food-detail img").attr("src").value
                name = sp.css(".name-food-detail .title-name-food h3").text.strip
                description = sp.css(".name-food-detail span")[0].text.strip
                basicprice = sp.css(".name-food-detail .rating-food .adding-food-cart span")[0].text.strip.to_i
                countorder = sp.css(".name-food-detail p span")[0].text.to_i
                if !type.foods.where(name: name).present?
                  food = type.foods.create(name: name, crawl_image: img_crawl, basicprice: basicprice, countorder: countorder, description: description)
                end
              end
            end
          end
        end
      end
    end
    n+=1
  end
end
