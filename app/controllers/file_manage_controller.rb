#coding: utf-8
class FileManageController < UmeadminController
  protect_from_forgery :except => :index
  skip_before_filter :verify_authenticity_token
  #  上传图片
  def uploadImage
    file_name='/images/static-data_/'+upload_file(params[:upload])
    render :text=>file_name+"<script type=\"text/javascript\">window.parent.CKEDITOR.tools.callFunction(2,'#{file_name}');</script>"
  end
  
  private 
  #  上传图片文件  
  def upload_file(file)
    if file
      allows_extname = ['.jpg', '.png', '.jpeg','.gif']
      if file.size > 2000000
        return false
      end
      if allows_extname.index(File.extname(file.original_filename)).nil?
        return false
      end
      
      final_filename = Time.now.strftime('%Y%m%d%H%M%S') + '_' + rand(1000000).to_s+File.extname(file.original_filename)
      File.open("#{RAILS_ROOT}/public/images/static-data_/#{final_filename}", "wb") do |f|
        f.write(file.read)
      end
      return final_filename
    end
    return false
  end
end
