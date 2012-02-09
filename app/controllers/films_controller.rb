#coding: utf-8
class FilmsController < ApplicationController
  
  #当前月要上映的影片
  def currentmonth
    @films = Film.get_current_month_relased
    respond_to do |format|
      format.html
      format.xml {render :xml=>@films.to_xml}
      format.json {render :json=>@films.to_json}
    end
  end
  
  #一周内要上映的影片
  def week
    @films = Film.get_week_relased
    respond_to do |format|
      format.html
      format.xml {render :xml=>@films.to_xml}
      format.json {render :json=>@films.to_json}
    end
  end
  
  #一个月之后的影片
  def onemonthlater
    @films = Film.get_one_month_later_relased
    respond_to do |format|
      format.html
      format.xml {render :xml=>@films.to_xml}
      format.json {render :json=>@films.to_json}
    end
  end
  
  def today
    @films = Film.get_today_released
    respond_to do |format|
      format.html
      format.xml {render :xml=>@films.to_xml}
      format.json {render :json=>@films.to_json}
    end
  end
  
  
  #  输出电影的影讯信息
  #  访问/film/data?f=1&c=1
  #  参数f为电影编号
  #  参数c为电影院编号(可选，为空则输出该电影的所有影讯)
  def data
#    cinema_id=params[:c] unless params[:c].blank? 
#    film_id=params[:f]
#    @films=Film.get_week_relased cinema_id
#    @list=Message.today_and_tomorow  film_id,cinema_id
#    @film=Film.find film_id 
    @films=Film.get_relased
    @messages=Message.today params[:c]
    @cinema=Cinema.find(params[:c])
  end

  
  #近明日影讯falsh显示页面
  #http://127.0.0.1:3000/films/hot?url=/films/data?c=1&f=1
  def hot
  end
  
end