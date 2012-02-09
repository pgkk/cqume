#coding: utf-8
class Cinema < ActiveRecord::Base

  has_many :message   #影院下拥有多条影讯
  validates_presence_of(:name, :message => "电影院名称不能为空")
  validates_presence_of(:address, :message => "电影院地址不能为空")

end
