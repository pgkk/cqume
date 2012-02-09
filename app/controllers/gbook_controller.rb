#coding: utf-8
class GbookController < ApplicationController

  before_filter :has_cinema_id, :except => [:index,:code_image,:message]

  @cinema_id = 0

  #留言板首页
  def index
    redirect_to '/'
  end


  #展示一个影院下所有留言
  def show
    @cinema_id = params[:id]
    @comments = Comment.find_all_comment_and_replay(@cinema_id)
  end


  #新建留言
  def create
     @comment = Comment.new
     @code = rand(10000)
     session[:noisy_image] = @code
  end


  #新建留言表单提交
  def createok
    if params[:comment][:title].blank? || params[:comment][:content].blank?
      flash[:comment_flash] = '正确填写表单！'
      redirect_to :action => 'create', :id => @cinema_id
    elsif params[:vaild_code].to_i != session[:noisy_image].to_i
      flash[:comment_flash] = '验证码错误！'
      redirect_to :action => 'create', :id => @cinema_id
    else
      comment = Comment.new(params[:comment])
      comment.ipaddress = request.remote_ip
      comment.orderid = Time.now.to_i.to_s
      if comment.save
        flash[:comment_flash] = '留言成功，稍候可见！'
      else
        flash[:comment_flash] = '留言失败！'
      end
      redirect_to :action => 'show', :id => @cinema_id
    end
  end


  # 图片验证码
  def code_image
    session[:noisy_image] = NoisyImage.new(6)
    image = session[:noisy_image].code_image
    send_data image, :type => 'image/jpeg', :disposition => 'inline'
  end


  # 头部，看片花，留言板等
  def message
    @gbooks = Cinema.find(:all)
    render 'gbook/message.rxml'
  end



  private

  def has_cinema_id
    begin
      if Cinema.find(params[:id]).blank?
        redirect_to '/'
      else
        @cinema_id = params[:id]
      end
    rescue ActiveRecord::RecordNotFound
      redirect_to '/'
    end
  end

  
end
