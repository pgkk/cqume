#coding: utf-8
class UmeadminController < ApplicationController
  
  before_filter :authorize, :except => [:login, :loginok, :out,:check_login_state, :link]   #登录验证过滤器
  
  def login
    @return_url = params[:return_url]
  end
  
  
  #登录
  def loginok
    if params[:username] == 'ume###1688' && params[:password] == 'ume,3000'
      session[:superman] = 'boss,##$!@#'
      if params[:return_url].nil?
        redirect_to :controller => 'cinema', :action => 'index'
      else
        redirect_to params[:return_url]
      end
    else
      flash[:login_flash] = '用户名密码错误!'
      redirect_to :controller => 'cinema' , :action => 'index'
    end
  end
  
  
  
  #安全退出
  def out
    session[:superman] = nil
    redirect_to :controller => 'cinema', :action => 'index'
  end
  
  #检查登录状态
  def check_login_state
    #    authorize
    if(session[:expire_time].nil?||Time.now>=session[:expire_time])
      session[:superman]=nil
    end
    if session[:superman].nil?
      render :text=>"false"
    else
      render :text=>"true"
    end
  end
  
  private
  
  # 验证登录信息
  def authorize
    #    如果过期时间为空，则添加现在的时间
        if session[:expire_time].nil?
          session[:expire_time]=1.minutes.from_now
        end
    #    检查登录是否过期
    if(Time.now>=session[:expire_time])
      session[:superman]=nil
    end
    if session[:superman].nil?
      redirect_to :controller => 'umeadmin', :action => 'login', :return_url => request.request_uri
    end
    session[:expire_time] = 30.minutes.from_now
  end
end
