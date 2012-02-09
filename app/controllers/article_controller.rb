#coding: utf-8
class ArticleController < UmeadminController

  layout 'adminlayout'

  #  发布新闻
  def post
    if request.post?
      @article=Article.new(params[:article])
      @types=Type.find_sibling_by_code(@article.type.code)
      @article.author="UME" if @article.author.blank?
      @article.afrom="ume"
      cache=render_to_string :template=>"article/template1",:layout=>false
      if @article.url.blank?
        @article.url=write(cache)
      end
      #@article.content=@article.url
      if @article.save
        flash[:msg]="新闻发布成功"
        if params[:t].blank?
          redirect_to :action=>"list"
        else
          redirect_to :controller=>"type",:action=>"list_news",:id=>params[:t]
        end
      end
      
    else
      @type=Type.find_menu
      @article=Article.new
      @cname=params[:cname]
      @cid=params[:cid]
    end
  end
  
  
  #  修改新闻
  def edit
    if request.post?
      Article.delete(params[:id])
      @article=Article.new(params[:article])
      @types=Type.find_sibling_by_code(@article.type.code)
      @article.author="UME" if @article.author.blank?
      @article.afrom="ume"
      cache=render_to_string :template=>"article/template1",:layout=>false
      delete_file(@article)
      @article.url=write(cache)
      content=render_to_string :template=>"article/template1"
      puts content
      #@article.content=@article.url
      if @article.save
        flash[:msg]="修改成功"
        if params[:t].blank?
          redirect_to :action=>"list"
        else
          redirect_to :action=>"list_news",:controller=>"type",:id=>params[:t]
        end
      end
    else
      @type=Type.find_menu
      @article=Article.find(params[:id])
    end
  end
  
  
  #  删除新闻
  def delete
    a=Article.find(params[:id])
    delete_file(a)
    Article.destroy(a.id)
    flash[:msg]="删除成功"
    redirect_to :action=>"list"
  end
  
  #  查看新闻
  #article/list
  def list
#    @list=Article.find(:all,:order=>"created_at desc")
    @list=Article.paginate :page=>params[:page],:per_page=>20,:order=>"created_at desc"
  end
  
  #查看新闻
  def view
    @article=Article.find(params[:id])
    #    @article.count += 1
    #    @article.save
    render :template=>"article/yingxun"
  end
  
  #预览
  def preview
      @article=Article.new(params[:article])
      @types=Type.find_sibling_by_code(@article.type.code)
      @article.author="admin"
      @article.afrom="ume"
      @article.url=write(@article)
      render :template=>"article/template1",:layout=>false
  end
  
  
  def index
    redirect_to :action=>"list"
  end
  
  
  private
  #  写入文件
  def write(string)
    d=Time.now.strftime('%Y%m%d')
    dir = "#{RAILS_ROOT}/public/news/"+d
    file_name = rand(1000000).to_s
    #如果文件夹不存在，则建立文件夹
    unless File.directory? dir
      Dir.mkdir(dir)
    end
    file=File.new("#{dir}/#{file_name}.html", "w")
    file.puts(string )
    file.close
    return "/news/#{d}/#{file_name}.html"
  end
  
  
  #  删除文件
  def delete_file(article)
    file="#{RAILS_ROOT}/public#{article.url}"
    if File.file? file
      File.delete(file)
    end
  end
  
  

  
end
