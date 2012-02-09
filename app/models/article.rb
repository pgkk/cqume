#coding: utf-8
class Article < ActiveRecord::Base
  belongs_to :type,:foreign_key =>"type_id"
  #  根据类别得到所有的新闻  
  def self.find_article_by_type_id(type_id)
    return Article.find(:all,:conditions=>["type_id=?",type_id],:order=>"created_at desc")
  end
  
end
