#coding: utf-8
class CommentsController < UmeadminController

  layout 'adminlayout'

  def index
      @comments = Comment.find_all_subject(params[:id])
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @comments }
      end
  end




  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end




  def edit
    @comment = Comment.find(params[:id])
  end



  
  def create
    @comment = Comment.new(params[:comment])
    respond_to do |format|
      if @comment.save
        format.html { redirect_to(@comment, :notice => 'Comment was successfully created.') }
        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end


  # 回复
  def replay
    @old_comment = Comment.find(params[:oid])
    @comment = Comment.new(params[:comment])
    @comment.ipaddress = request.remote_ip
    @comment.orderid = @old_comment.orderid + '1000'
    @comment.cinema_id = @old_comment.cinema_id
    @comment.title = '[replay]'
    @comment.isreplay = 1
    if @comment.save
      @old_comment.update_attribute('isreplay', 1)
      render :text => 'ok'
    end
  end


  # 获得指定ORDERID的回复
  def get_replay
    if params[:id].blank?
      render :text => '参数错误，无法获得回复'
    else
      replay_orderid = params[:id] + '1000'
      @replay = Comment.find(:first, :conditions => ['orderid = ?',replay_orderid])
      if @replay.blank?
        render :text => '没有任何回复'
      else
        render :text => "<b class='replay_message'>#{@replay.content}</b>"
      end
    end
  end

  
  # PUT /comments/1
  # PUT /comments/1.xml
  def update
    @comment = Comment.find(params[:id])
    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to(comments_path, :notice => '编辑成功.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  
 
  def destroy
    @comment = Comment.find(params[:id])
    if @replay = Comment.find_by_orderid(@comment.orderid+'1000')
      @replay.destroy
    end
    @comment.destroy
    redirect_to "/comments/index/#{@comment.cinema_id}"
  end


  # 通过AJAX调用，删除留言
  def del
    if request.xhr?
      @comment = Comment.find(params[:id])
      if @replay = Comment.find_by_orderid(@comment.orderid+'1000')
        @replay.destroy
      end
      @comment.destroy
      render :text => 'ok'
    end
  end


end
