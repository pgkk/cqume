#coding: utf-8
class TempController < ApplicationController
  #沙坪坝电影院  
  #  /temp/shapingba
  def shapingba
    @today=Message.today(3)
    @tomorow=Message.tomorow(3)
    #@news=Article.find_article_by_type_id(10001000) #该影院下所有新闻
    @news = Type.find_by_code(10001003).article
    render :template=>"temp/yingxun"
  end
  
  #江北影院
  #  /temp/jiangbei  
  def beibei
    @today=Message.today(2)
    @tomorow=Message.tomorow(2)
    #@news=Article.find_article_by_type_id(10001001) #该影院下所有新闻
    @news = Type.find_by_code(10001002).article
    render :template=>"temp/yingxun"
  end


  #今日影讯
  #/temp/cinema/cinema_id
  def cinema
    id=params[:id]
    @today=Message.today(id)
    @tomorow=Message.tomorow(id)
    render :template=>"temp/yingxun"
  end
  
  
  #即将上映
  #/temp/comesoon/cinema_id
  def comesoon
   id=params[:id]
    @m=Message.comesoon(id);
    render :text => @m.size
  end
  
  
end
