#coding: utf-8  
class ClassesController < ApplicationController
  
  def list
    @list=Article.find_article_by_type_id(params[:id])
    @types=Type.find_type_by_id(params[:id])
    @type=Type.find params[:id]
  end

  #  xml订阅
  def xml
    @list=Article.find(:all)
    respond_to do |format|
      format.html
      format.xml {render :xml =>@list.to_xml}
      format.json {render :json =>@list.to_json}
    end
  end
  
end
