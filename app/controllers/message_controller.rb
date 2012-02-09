#coding: utf-8
class MessageController < UmeadminController
  skip_before_filter :verify_authenticity_token
  layout 'adminlayout'
  
  # 列表
  def list
    @cinema = Cinema.find(params[:id])
    unless @cinema.nil?
#      @message = @cinema.message.find(:all, :conditions => ['status = 1'],:order=>"stime desc")
        @message=@cinema.message.paginate(:page=>params[:page],:per_page=>20,:order=>"priority_ desc")
    end
  end
  
  
  
  # 建立影讯
  def add
    @errors = {}
    message = nil
    # @online_films = Film.find_online_films()  #得到所有上线影片名和ID
    @online_films = Film.find(:all)  #得到所有上线影片名和ID
    @cinema = Cinema.find(params[:id])
    #检查是否有电影信息，没有则无法添加影讯
    if @online_films.size==0
      flash[:message_flash]="请先添加影片信息！"
      redirect_to :action => 'list', :id => @cinema.id
    end
    #检查是否是post过来的请求
    if request.post?
      language = params[:language]
      
      message = Message.new(params[:message])
      message.stime = (params[:days] + ' ' + message.stime.to_s)

      
      
      message.status = true
      message.film_name = message.film_name + '(' + language + ')'
      
      if message.save
       
        flash[:message_flash] = '成功发布影讯！您可以继续发布下一条。'
        flash[:prev_film_id] = params[:message][:film_id]
        redirect_to :back
        #redirect_to :action => 'list', :id => message.cinema_id
      end
      @errors = message.errors

      #@errors = @message.errors
      #redirect_to :action => 'list', :id => @message.cinema_id
      
    end
  end
  
  
  
  # 删除影讯
  def del
    if params[:id].nil? || params[:cid].nil?
      redirect_to :back
    else
      if Message.delete(params[:id])
        flash[:message_flash] = '成功删除影讯！'
      else
        flash[:message_flash] = '删除影讯失败！'
      end
      redirect_to :action => 'list' ,:id => params[:cid]
    end
  end
  
  
  #批量删除影讯 
  def batch_del
    if params[:xid].blank?
      flash[:message_flash]="<span style='color:red'>尚未选择任何影讯</span>"
    else
        a=params[:xid].to_a
      if a.size!=0
        a.each do |x|
          Message.delete(x)
        end
        flash[:message_flash]="<span style='color:red'>批量删除影讯成功</span>"
      end  
    end
        redirect_to :action=>'list',:id=>params[:cid]
    
  end
  
  # 修改影讯
  def edit
    @film_id = nil
    @films = Film.find(:all)
    if request.get?
      @message = Message.find(params[:id])    
      @cinema = Cinema.find(params[:cid])
      @st = @message.stime.strftime('%H:%M:%S')
      @film_id = @message.film_id
    else
      
      params[:message][:stime] = params[:days] + ' ' + params[:message][:stime]
      if Message.update(params[:id], params[:message])
        
        flash[:message_flash]="修改成功"
        redirect_to :action => "list" , :id => params[:message][:cinema_id]
      end
    end
    
    
  end
  
  
  
  # 编辑影讯
  def edit2
    if params[:id].nil? || params[:cid].nil?
      redirect_to :back
    else
      if request.post?
        if @message.save
          flash[:message_flash] = '成功发布影讯！'
          redirect_to :action => 'list', :id => @message.cinema_id
        end
        if Message.update(params[:id], params[:message])
          flash[:message_flash]="修改成功"
          redirect_to :action=>"list", :id => params[:id]
        end
      else
        @message = Message.find(params[:id])
        @cinema = @message.cinema
      end
    end
  end


  #今日影讯
  def today
    @cinema = Cinema.find(params[:id])
    @message = Message.today(params[:id]).paginate(:page=>params[:page],:per_page=>20,:order=>"film_name asc,priority_ desc,stime desc")
    render 'message/list'
  end



  #明日影讯
  def tomorow
    @cinema = Cinema.find(params[:id])
    @message = Message.tomorow(params[:id]).paginate(:page=>params[:page],:per_page=>20,:order=>"film_name asc,priority_ desc,stime desc")
    render 'message/list'
  end
  
  #后日影讯
  def afterday
    @cinema = Cinema.find(params[:id])
    @message = Message.afterday(params[:id]).paginate(:page=>params[:page],:per_page=>20,:order=>"film_name asc,priority_ desc,stime desc")
    render 'message/list'
  end
  
  
  #更新今日影讯到明日
  def cp_today_to_tomorow
    @list=Message.today(params[:id])
    @list.each {|x|
      y=x.clone
      y.stime=x.stime.tomorrow
      y.save
    }
    flash[:message_flash]="<script>alert(\"影讯复制成功\")</script>"
    redirect_to :action=>:list,:id=>params[:id]
  end
  
  #更新今日影讯到后天
  def cp_today_to_afterday
    @list=Message.today(params[:id])
    @list.each {|x|
      y=x.clone
      y.stime=x.stime.tomorrow.tomorrow
      y.save
    }
    flash[:message_flash]="<script>alert(\"影讯复制成功\")</script>"
    redirect_to :action=>:list,:id=>params[:id]
  end
  
  #排序
  def priority_up
    Message.update_counters(params[:id], :priority_=>params[:n].to_i)
    render :text=>"ok"
  end


  ################################
  # 新建影讯
  def new
    @errors = {}
    message = nil
    @online_films = Film.find(:all,:select => 'id,name',:order=>'released_date desc')  #得到所有上线影片名和ID
    @cinema_id = params[:id]
    #检查是否有电影信息，没有则无法添加影讯
    if @online_films.size==0
      flash[:message_flash]="请先添加影片信息！"
      redirect_to :action => 'list', :id => params[:id]
    end
    #检查是否是post过来的请求
    if request.post?
      language = params[:language]
      message = Message.new(params[:message])
      message.stime = (params[:days] + ' ' + message.stime.to_s)
      message.status = true
      message.film_name = message.film_name + '(' + language + ')' if !(language.index('none'))

      response = ""
      for f in @online_films
        if f.id==(params[:message][:film_id]).to_i
          response += "<option selected value=#{f.id}>#{f.name}</option>"
        else
          response += "<option value=#{f.id}>#{f.name}</option>"
        end
      end
      if message.save
        render :text => response
      else
        render :text => response, :status => 500
      end
      @errors = message.errors
    end
  end
  
 
  # 修改影讯
  def modify
    @film_id = nil
    @films = Film.find(:all,:select => 'id,name',:order=>'released_date desc')
    if request.get?
      @message = Message.find(params[:id])
      @cinema = Cinema.find(params[:cid])
      @st = @message.stime.strftime('%H:%M')
      @md = @message.stime.strftime('%Y-%m-%d')
      @film_id = @message.film_id
    else
      params[:message][:stime] = params[:days] + ' ' + params[:message][:stime]
      params[:message][:film_name] = params[:message][:film_name].gsub "(配音版)", ''
      params[:message][:film_name] = params[:message][:film_name].gsub "(字幕版)", ''
      params[:message][:film_name] = params[:message][:film_name].gsub "(none)", ''

      params[:message][:film_name] +=  '(' + params[:language] + ')' unless params[:language]=='none'
      if Message.update(params[:id], params[:message])
        flash[:message_flash]="修改成功"
        redirect_to :action => "list" , :id => params[:message][:cinema_id]
      end
    end
  end
  
  
  #影讯管理
  def list_m
    t=params[:t]
    id=params[:id]
    flash[:t]=t
    if t=="0"
        redirect_to :action=>:list,:id=>id
      elsif t=="1"
        redirect_to :action=>:today,:id=>id
      elsif t=="2"
        redirect_to :action=>:tomorow,:id=>id
      elsif t=="3"
        redirect_to :action=>:afterday,:id=>id
    end
  end
  
end