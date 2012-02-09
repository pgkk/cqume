#coding: utf-8
class ArticleOutController < ApplicationController
  #  article_out/list/format.xml
  #  xml   json 输出
  def list
    @list=Article.find(:all)
    respond_to do |format|
      format.html
      format.xml {render :xml =>@list.to_xml}
      format.json {render :json =>@list.to_json}
    end
  end
end
