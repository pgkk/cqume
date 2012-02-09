#coding: utf-8
class TypeController < UmeadminController
  layout 'adminlayout',:except => [:list,:view,:navigate,:list_all_type]
  before_filter :authorize, :except => [:navigate]   #登录验证过滤器
  

  # 
  def list
    if params[:id].nil?
      @list=Type.find_level_one_menu
      render :template=>"type/list_parent"
    else
      @list=Type.find_type_by_praent(params[:id])
    end
  end
  
  
  #得到所有的菜单
  def list_all_type
    @list=Type.find_menu
  end
  
  #得到新闻
  def list_news
    @list=Article.find_article_by_type_id(params[:id])
    @type=Type.find(params[:id])
  end
  
  #  添加新闻
  def add
   if request.post?
     @type=Type.new(params[:type])
     if @type.save
       flash[:msg]="添加新闻成功！"
     else
       flashp[:msg]="添加失败"
     end
    redirect_to :action=>:index
  else
    @type=Type.new
    if params[:method]=="child"
      @type.code=Type.generate_child_code(params[:id])
    else
      @type.code=Type.generate_code(params[:id])
    end
  end
  end
  
  # 
  def edit
    if request.post?
      if Type.update(params[:id], params[:type])
        flash[:msg]="编辑成功"
      else
        flash[:msg]="编辑失败"
      end
      redirect_to :action=>"index"  
    else
      @type=Type.find(params[:id])
    end
  end
  
  #  删除新闻
  def delete
    Type.delete(params[:id]);
    flash[:msg]="删除成功！"
    redirect_to :action=>"index"
  end
  
  
  def view
    @type=Type.find_type_by_code(params[:id])
    render :template=>"type/type_info"
  end
  
  
  def navigate
    @list=Type.find_order_by_code
    @cinemas = Cinema.find(:all,:select=>"id,name")
    render "type/navigate.rxml"
  end
  
end
