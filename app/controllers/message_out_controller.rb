#coding: utf-8
class MessageOutController < ApplicationController
  #今天正在上映的电影
  #message_out/today/cinema_id
  def today
    @list=Message.today(params[:id]);
    respond_to do |format|
      format.html
      format.xml {render :xml=>@list.to_xml}
      format.json {render :xml=>@list.to_json}
    end
  end
  
  #  明日上映的电影
  #message_out/tomorow/cinema_id
  def tomorow
        @list=Message.tomorow(params[:id])
        respond_to to |format|
        format.html
        format.xml {render :xml=>@list.to_xml}
        format.json {render :xml=>@list.to_json}
  end
end
