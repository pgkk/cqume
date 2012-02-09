#coding: utf-8
class Comment < ActiveRecord::Base
  #validates_presence_of :title, :content, :message => '不能为空'

  #获得该影院下所有留言以及对应的回复，比如有回复才能显示
  def self.find_all_comment_and_replay(cinemaid)
    Comment.find(:all, :conditions => [ "cinema_id = ? and isreplay = 1", cinemaid],
                       :order => 'orderid asc')
  end

  # 返回某影院下所有留言，不包含回复
  def self.find_all_subject(cinemaid)
    Comment.find(:all, :conditions => ["title <> ? and cinema_id =? ","[replay]",cinemaid] )
  end

end
