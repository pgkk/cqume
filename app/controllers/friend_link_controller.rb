#coding: utf-8
class FriendLinkController < UmeadminController

  layout 'adminlayout', :except => [:link]
 

  #添加友情链接
  def add
    @errors = {}
    if request.post?
      link = FriendLink.new(params[:data])
      if link.save
        flash[:message] = "添加成功！"
        redirect_to :action => 'index'
      else
        @errors = link.errors
      end
    end
  end


  #删除友情链接
  def remove
   FriendLink.delete(params[:id])
   flash[:message] = "删除成功！"
   redirect_to :action => 'index'
  end

  #显示所有连接
  def index
    @friend_links = FriendLink.find(:all)
  end

  def edit
    if request.post?
      FriendLink.update(params[:id], params[:data])
      flash[:message] = "修改成功!"
      redirect_to :action => 'index'
    end

    id = params[:id]
    if id
      begin
        @link = FriendLink.find(:first, id)
      rescue ActiveRecord::RecordNotFound
        redirect :action => 'index'
      end
    end
  end

  def link
    @friendlinks = FriendLink.find(:all)
    render "friend_link/link.rxml"
  end
end
