#coding: utf-8
# 类别控制器
class CategoryController < UmeadminController

    layout "adminlayout",:only=>"index"

  #欢迎
  def index
  end



  #类别列表
  def list
    @list = Category.find_by_code_sort
    @max_array = {}
    for s in @list
      @max_array[s.code.size.to_s] = s.code
    end
    p @max_array
  end


  
  #得到下一个兄弟ID
  def brother
    if request.xhr? && params[:id]!=nil
      p "========#{params[:id]}========="
      next_code = Category.find_next_brother(params[:id])
      render :text => "<input id=\"category_code\" value=\"#{next_code[:code].to_i+1}\"
                        name=\"category[code]\"
                       size=\"30\" type=\"text\" />
                       <a href=\"#\" onclick=\"Element.hide('addbox')\">关闭</a>"
    end
  end


  
  #得到下一个子ID
  def child
    if request.xhr? && params[:id]!=nil
      next_code = Category.find_next_child(params[:id])
      if next_code.blank?
        code = params[:id] + '0999'
        code = code.to_i
      else
        code = next_code[:code]
      end
      p "========#{code}========="
      render :text => "<input id=\"category_code\" value=\"#{code.to_i+1}\" name=\"category[code]\"
                       size=\"30\" type=\"text\" />
                       <a href=\"#\" onclick=\"Element.hide('addbox')\">关闭</a>"
    end
  end


  #添加类别，不区分兄弟和子类
  def add
    if request.xhr?
      if params[:category][:id].blank?
        category = Category.new(params[:category])
        category.name = category.code if category.name.blank?
        category.info = category.code if category.info.blank?
        category.url = category.code if category.url.blank?
        if category.save
          render :text => 'ok'
        else
          render :text => 'fail'
        end
      else
        category = Category.find(params[:category][:id])
        if category.update_attributes(params[:category])
          render :text => 'ok'
        else
          render :text => 'fail'
        end
      end
    end
  end





  #删除类别，注意如果删除父类，其下所有子类都将删除
  def remove
    unless params[:id].blank?
      if Category.delete_all_and_children(params[:id])
        render :text => 'ok'
      end
    end
  end


  #显示单个类别信息，导出为HTML
  def show
    category = Category.find_by_code(params[:id])
    render :text => "<tr><td>类别ID</td><td id=\"code_field\">
  <input id=\"category_code\" name=\"category[code]\" size=\"30\" type=\"text\" value='#{category.code}'/>
   <a href=\"#\" onclick=\"$(addbox).hide()\">关闭</a></td></tr>
  <tr><td>类别名字</td><td>
  <input id=\"category_name\" name=\"category[name]\" size=\"30\" type=\"text\" value='#{category.name}'/>
  <tr><td>URL</td><td>
  <input id=\"category_url\" name=\"category[url]\" size=\"30\" type=\"text\" value='#{category.url}'/>
  <input name=\"category[id]\" type=\"hidden\" value='#{category.id}'/>
  <tr><td>&nbsp;</td><td><input name=\"commit\" type=\"submit\" value=\"修改\" /></td></tr"
  end


  #相关类别下新闻
  def news
    @news = Article.find_all_by_type_id params[:id]
    @id = params[:id]
    @name = params[:name]
  end
  
end
