#coding: utf-8  

#require 'iconv'


class FilmController < UmeadminController

  layout 'adminlayout'
   
  def upload_file(file)

    if file
      allows_extname = ['.jpg', '.png', '.jpeg']
      #p "========#{file.size}========"
      if file.size > 2000000
       # p "file more than big"
        return false
      end
      
      #p "========#{File.extname(Iconv.iconv('GB2312//IGNORE', 'UTF-8//IGNORE', file.original_filename).to_s)}========"
      #p '.'.concat(file.original_filename.split('.')[0].to_s)
      #p '==============================================='
      if allows_extname.index(File.extname(file.original_filename).to_s).nil?
        #p file.original_filename
        return false
      end

      final_filename = Time.now.strftime('%Y%m%d%H%M%S') + '_' + rand(1000000).to_s + File.extname(file.original_filename)
      File.open("#{RAILS_ROOT}/public/images/static-data_/#{final_filename}", "wb") do |f|
        f.write(file.read)
      end
      return final_filename
    end
    return false
  end


  #添加电影
  def add
    @errors = {}
    @return_data = {}
    if request.post?
      #film = Film.new([:film_data])
      film_data = params[:film_data]
      categories = params[:categories]
      @return_data = film_data
      if categories.nil?
        @errors[:categories] = "你必须选择至少一个影片类别！"
      end

      image_name = upload_file(film_data[:img])
      if !image_name
        @errors[:image] = "你必须提供一张图片，并且图片大小应该在100KB以下，上传的图片名称必须是英文字母和数字组成。！"
      end
      
      if @errors.size == 0
        film = Film.new(film_data)
        film.status = true
        film.img = image_name
        film.category = categories.join('/')
        if film.save
          flash[:success] = "恭喜你，添加成功！！"
          redirect_to :action => 'index'
        end
        @errors[:save_error] = "程序错误！！"

        @errors.each_pair do |key, val|
          film.errors.add(key, val)
        end
        @errors = film.errors
       
      end
    end

  end

  # 显示所有影片
  def index
    @films = Film.paginate :page=>params[:page],:per_page=>10,:order=>"id desc"
  end


  #删除指定的影片
  def delete
    if Film.delete(params[:id])
      redirect_to :action => 'index'
    end
  end


  #编辑影片
  def edit
    @errors = {}
    @film = nil
    @return_data = {}
    begin
        @film = Film.find(params[:id])
        @categories = @film.category.split('/')
    rescue ActiveRecord::RecordNotFound
        @errors["not_found"] = "对不起！你要编辑的影片不存在！！"
    end
    
    if request.post?
      @film.update_attributes(params[:film_data])
      @film.update_attribute('category', params[:categories].join('/'))
      if @film.errors.empty?
        flash[:update_success_message] = "影片编辑成功."
        redirect_to  :action => 'index'
      end
      @errors.each_pair do |key, val|
        @film.errors.add(key, val)
      end
      @errors = @film.errors
      @return_data = params[:film_data]
    end
  end


  def ajaxload
    film_id = params[:id]
    render :json => Film.find(film_id).to_json
  end
  
  def changestatus
    id = params[:id]
    
    if id
      film = Film.find(:first, id)
      film.toggle('status')
      film.save()
      messages = film.find_all_messages_by_film()
      if messages
        messages.each do |message|
          message.toggle('status')
          message.save()
        end
      end
      
      render :json => film.status ? "下线" : "上线"
    end
  end

  def messages
    id = params[:id]
    film = Film.find(id)
    if !film.nil?
      @messages = film.find_all_messages_by_film()
    else
      ##
    end
  end
  
  
  def xml
    
  end
  
end
