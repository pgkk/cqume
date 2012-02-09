#coding: utf-8
class FrontController < ApplicationController
  def index
   @cinema=Cinema.find(:all)
 end
 
 
 def list
   @today=Message.today(params[:id])
   @tomorow=Message.tomorow(params[:id])
 end
end
