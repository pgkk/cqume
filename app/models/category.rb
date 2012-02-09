#coding: utf-8
class Category < ActiveRecord::Base

  # CODE排序打印全部类型
  def self.find_by_code_sort
    find(:all, :order => 'code')
  end

  #删除类别，和其下所有类别
  def self.delete_all_and_children(fatherid)
    delete_all "code like '#{fatherid}%'"
  end

  #得到下一个兄弟ID
  def self.find_next_brother(id)
    id = id.to_i
    max = id*10-1
    find(:first,:conditions => ['code >= ? and code < (?)',id,max],
         :select => 'code',
         :order => 'code desc')
  end


  #得到下一个子ID
  def self.find_next_child(id)
    str = "#{id}%"
    length = id.length+4
    find(:first,:conditions => ['code like ? and length(code) = ? ',str,length],
         :select => 'code',
         :order => 'code desc')
  end


end
