#coding: utf-8
class Type < ActiveRecord::Base
  validates_presence_of(:name, :message => "不能为空")
  has_many :article
  
  #  根据父级的code得到所有子级
  def self.find_type_by_praent(code)
    #    n=code.size/4
    #    for i in 0..n do
    #      a=code[i,i+4]
    #    end
    c=code[code.length-4<0?0:code.length-4,code.length]
    return Type.find(:all,:conditions=>["code like ?",c+"%"])    
  end
  
  #  生成同级code
  def self.generate_code(code)
    c=code[0,code.length-4]
    @type=Type.find(:first,:conditions=>["code like ?",c+"%"],:order=>"code desc")
    if @type.nil?
      return code.to_i+1
    else
      return @type.code.to_i+1
    end
  end
  
  
  #  生成子级code
  def self.generate_child_code(code)
    c=code[0,code.length]
    type=Type.find(:first,:conditions=>["code like ?",c+"____"],:order=>"code desc")
    unless type.nil?
      return type.code.to_i+1
    else
      return (code+"1000").to_i+1
    end
  end
  
#  根据code排序类别
  def self.find_order_by_code
    return Type.find(:all,:order=>"code asc")
  end
  
#  根据code得到菜单
  def self.find_type_by_code(code)
    return Type.find(:first,:conditions=>["code = ?",code])
  end
  
  #得到所有一级目录
  def self.find_level_one_menu
    return Type.find(:all,:conditions=>["code like '____'"],:order=>"code asc")
  end
  
  #得到所有菜单
  def self.find_menu
    return Type.find(:all,:order=>"code asc")
  end

#  得到所有同级菜单
  def self.find_sibling_by_code(code)
    return Type.find(:all,:conditions=>["code like ?",code.to(3)+"%"])
  end
  
  def self.find_type_by_id(id)
    type=Type.find(id);
    code=type.code[0,4]
    return Type.find(:all,:conditions=>["code like ?",code+"%"])
  end
  
end