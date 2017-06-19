#encoding=UTF-8
class CrawlerController < ApplicationController
  def scoreLanding
    p "scoreLanding"+"-"*10
    keyword=params[:keyword]
    puts "-"*20
    puts "搜索："+keyword

    @listHash=SearchCrawler.landingSearch keyword
    @listHash.each do |hash|
      p hash
    end
  end
end
