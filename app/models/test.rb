class Crawler
  def self.craw
    require 'nokogiri'
    require 'open-uri'
    html = open("http://manga.life/directory/").read
    nokogiri_object = Nokogiri::HTML(html)

    nokogiri_object.xpath("//div[@id='content']/p[@class='seriesList chapOnly']/a").each do |link_manga|
      link = link_manga.attr('href')
      linkmanga = link.slice(2,link.length)
      html_manga =open("http://manga.life#{linkmanga}").read
      nokogiri_manga = Nokogiri::HTML(html_manga)

      manga_link = nokogiri_manga.xpath("//div[@class='well']/div[@class='row']")
      banner = manga_link.xpath("//div[1]/img").attr('src').value
      name = manga_link.xpath("//div[2]/div[@class='row']/div[1]/h1").text
      info = manga_link.xpath("//div[2]/span[@class='details hidden-xs']")
      alter = info.xpath("//div[@class='row'][1]/div[1]/b").text
      if alter == "Alternate Names: "
        alternate_name = info.xpath("//div[@class='row'][1]/div[1]/b/following-sibling::text()").text.delete("\t").delete("\n")
        status = info.xpath("//div[@class='row'][5]/div[1]/b/following-sibling::text()").text.delete("\t").delete("\n")
        author = info.xpath("//div[@class='row'][3]/div").children[2].text
        genres = []
        n=0
        info.xpath("//div[@class='row'][6]/div/a").each do |genre|
          genres[n] = genre.text
          n+=1
        end
        updated_at = nokogiri_manga.xpath("//div[@class = 'well']/div[@class='list']/div[1]/div[2]").children[1].attr('datetime')
        desciption = info.xpath("//div[@class='row'][7]/div/div").text
        if Manga.count == 0 || !Manga.where(name: name).exists?
          manga = Manga.create(name: name ,alternate_name: alternate_name ,updated_at:updated_at,status: status ,genres: genres , desciption: desciption,banner: banner,author:author)
          list_chap = nokogiri_manga.xpath("//div[@class='well']/div[@class='list']/div[@class='row hidden-xs']").each do |chapter|
            chap_name = chapter.css('a').text.delete("\n").delete("\t")
            link_chap = chapter.css('a').attr('href')

            create_at = chapter.children[3].children[1].attribute("datetime").value
            html_chap = open("http://manga.life#{link_chap}").read
            nokogiri_c = Nokogiri::HTML(html_chap)
            link_chap1 = nokogiri_c.xpath("//div[@class='container mainPageContainer']/ol[@class='breadcrumb breadcrumb_nav hidden-xs']/li[2]/a").attr('href').value
            html_chapimage = open("http://manga.life#{link_chap1}").read
            nokogiri_image = Nokogiri::HTML(html_chapimage)
            n = 0
            images = []
            nokogiri_image.xpath("//p[@class='imagePage']//img").each do |image|
              images[n]=image.attr('src')
              n+=1
            end
            chap = manga.chaps.create(chap_name: chap_name , create_at: create_at , images: images)
          end
        elsif Manga.where(name:name).exists?
          list_chap = nokogiri_manga.xpath("//div[@class='well']/div[@class='list']/div[@class='row hidden-xs']").each do |chapter|
            chap_name = chapter.css('a').text.delete("\n").delete("\t")
            manga = Manga.where(name: name).first
            if manga.chaps.where(chap_name: chap_name).count == 0
              link_chap = chapter.css('a').attr('href')
              create_at = chapter.children[3].children[1].attribute("datetime").value
              html_chap = open("http://manga.life#{link_chap}").read
              nokogiri_c = Nokogiri::HTML(html_chap)
              link_chap1 = nokogiri_c.xpath("//div[@class='container mainPageContainer']/ol[@class='breadcrumb breadcrumb_nav hidden-xs']/li[2]/a").attr('href').value
              html_chapimage = open("http://manga.life#{link_chap1}").read
              nokogiri_image = Nokogiri::HTML(html_chapimage)
              n = 0
              images = []
              nokogiri_image.xpath("//p[@class='imagePage']//img").each do |image|
                images[n]=image.attr('src')
                n+=1
              end
              chap = manga.chaps.create(chap_name: chap_name , create_at: create_at , images: images)
            end
          end
        end
      end
      status = info.xpath("//div[@class='row'][4]/div[1]/b/following-sibling::text()").text.delete("\t").delete("\n")

      author = manga_link.xpath("//div[@class='well']/div[@class='row']//div[2]/span[@class='details hidden-xs']/div[@class='row'][2]").children[1].children.children[1].text
      genres = []
      n=0
      info.xpath("//div[@class='row'][5]/div/a").each do |genre|
        genres[n] = genre.text
        n+=1
      end
      updated_at = nokogiri_manga.xpath("//div[@class = 'well']/div[@class='list']/div[1]/div[2]").children[1].attr('datetime')
      desciption = info.xpath("//div[@class='row'][6]/div/div").text
      # if !Manga.where(updated_at: updated_at).exists?
      #    manga = Manga.where(updated_at: nil).first
      #    manga.update_attribute("updated_at",updated_at)
      #    puts "Done"
      #  end
      if Manga.count == 0 || !Manga.where(name: name).exists?
        manga = Manga.create(name: name ,alternate_name: alternate_name ,status: status ,genres: genres , desciption: desciption,banner: banner,author:author)
        list_chap = nokogiri_manga.xpath("//div[@class='well']/div[@class='list']/div[@class='row hidden-xs']").each do |chapter|
          chap_name = chapter.css('a').text.delete("\n").delete("\t")
          link_chap = chapter.css('a').attr('href')

          create_at = chapter.children[3].children[1].attribute("datetime").value
          html_chap = open("http://manga.life#{link_chap}").read
          nokogiri_c = Nokogiri::HTML(html_chap)
          link_chap1 = nokogiri_c.xpath("//div[@class='container mainPageContainer']/ol[@class='breadcrumb breadcrumb_nav hidden-xs']/li[2]/a").attr('href').value
          html_chapimage = open("http://manga.life#{link_chap1}").read
          nokogiri_image = Nokogiri::HTML(html_chapimage)
          n = 0
          images = []
          nokogiri_image.xpath("//p[@class='imagePage']//img").each do |image|
            images[n]=image.attr('src')
            n+=1
          end
          chap = manga.chaps.create(chap_name: chap_name , create_at: create_at , images: images)
        end
      elsif Manga.where(name:name).exists?
        list_chap = nokogiri_manga.xpath("//div[@class='well']/div[@class='list']/div[@class='row hidden-xs']").each do |chapter|
          chap_name = chapter.css('a').text.delete("\n").delete("\t")
          manga = Manga.where(name: name).first
          if manga.chaps.where(chap_name: chap_name).count == 0
            link_chap = chapter.css('a').attr('href')
            create_at = chapter.children[3].children[1].attribute("datetime").value
            html_chap = open("http://manga.life#{link_chap}").read
            nokogiri_c = Nokogiri::HTML(html_chap)
            link_chap1 = nokogiri_c.xpath("//div[@class='container mainPageContainer']/ol[@class='breadcrumb breadcrumb_nav hidden-xs']/li[2]/a").attr('href').value
            html_chapimage = open("http://manga.life#{link_chap1}").read
            nokogiri_image = Nokogiri::HTML(html_chapimage)
            n = 0
            images = []
            nokogiri_image.xpath("//p[@class='imagePage']//img").each do |image|
              images[n]=image.attr('src')
              n+=1
            end
            chap = manga.chaps.create(chap_name: chap_name , create_at: create_at , images: images)
          end
        end
      end
    end
  end
end
