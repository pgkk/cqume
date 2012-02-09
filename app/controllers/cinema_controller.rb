#coding: utf-8
class CinemaController < UmeadminController
  
  layout 'adminlayout'  #将本控制器内所有视图包含进 ‘adminlayout’ 模板内
  
  #  影院信息首页
  def index
    @cinemas=Cinema.find(:all)  
  end
  
  
  
  #  添加影院信息
  def add
    if request.get?
      @cinema=Cinema.new
    else
      @cinema=Cinema.new(params[:cinema])
      if @cinema.save
        flash[:msg] = "添加成功"
        redirect_to :action=>"index"
      end
    end
   end
    
    
    #  删除影院信息
    def del
      if request.post?
        cinema=Cinema.find(params[:id])
        cinema.destroy;
        flash[:msg]="删除成功"
      else
        flash[:msg]="删除失败"
      end
      redirect_to :action=>"index"
    end
    
    #  编辑影院信息
    
    def edit
      if request.get?
        @cinema=Cinema.find(params[:id])
      else
        if Cinema.update(params[:id], params[:cinema])
          flash[:msg]="修改成功"
          redirect_to :action=>"index"
        end
      end
    end
    
    #  显示影院信息
    def show
      @cinema=Cinema.find(params[:id])
    end
    
    #得到所有影院标题 
    def list
      @cinemas=Cinema.find(:all)
      render :layout=>false
    end
    
  end