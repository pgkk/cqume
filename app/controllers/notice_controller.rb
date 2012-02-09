# coding: utf-8
# 前台－中长期预告
class NoticeController < ApplicationController
  
  def index
    @current_month_films = Film.get_current_month_relased
    @later_month_films = Film.get_one_month_later_relased
  end

end
