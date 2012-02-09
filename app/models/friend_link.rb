#coding: utf-8
class FriendLink < ActiveRecord::Base

  validates_length_of :title, :within => 4..20, :message => '连接标题必须在4-20个字符之间。'
  
end
