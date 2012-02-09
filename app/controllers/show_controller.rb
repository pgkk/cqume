#coding: utf-8

class ShowController < ApplicationController
  
  #取得所有影院的今日影讯和明日影讯
  def index
    
    cinemas_list = Cinema.find(:all)
    @messages_list = Array.new()
    
    cinemas_list.each do  |cinema|
      msg = {:cinema => cinema, :today => Message.today(cinema.id).pop, :tomorow => Message.tomorow(cinema.id).pop}
      @messages_list.push(msg)
    end
    s = @messages_list.size
    if s<3
      @rows=1
    else
      @rows = ((s % 3) != 0) ? (s / 3 + 1) : (s / 3)
    end

    #render :text => @rows
  end
  
  
end