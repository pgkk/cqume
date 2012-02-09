#coding: utf-8
class Message < ActiveRecord::Base
  
  belongs_to :cinema  #每个影讯属于一个影院
  belongs_to :film    # 拥有一个对应的影片
  #validates_presence_of :film_name, :country,:film_type, :price, :room, :stime,:message => '不能为空'
  #validates_numericality_of :price, :service_price ,  :message => '只能为正确数值'
         
  
  #今日影讯
  def self.today(cinema_id,film_id=nil)
    if film_id.nil?
      return Message.find(:all,
      :conditions=>["status = 1 AND cinema_id=? and stime like ?",cinema_id,Time.now.to_date.to_s+'%'],
      :order=>"film_name asc,priority_ desc,stime asc"
      );
    else
      return Message.find(:all,
      :conditions=>["status = 1 AND cinema_id=? and stime like ? and film_id=?",cinema_id,Time.now.to_date.to_s+'%',film_id],
      :order=>"film_name asc,priority_ desc,stime asc"
      );
    end
  end
  
  #明日影讯
  def self.tomorow(cinema_id,film_id=nil)
    if film_id.nil?
      return Message.find(:all,
      :conditions=>["status = 1 AND cinema_id=? and stime like ?",cinema_id,Time.now.tomorrow.to_date.to_s+'%'],
      :order=>"film_name asc,priority_ desc,stime asc"
      )
    else
      return Message.find(:all,
      :conditions=>["status = 1 AND cinema_id=? and stime like ? and film_id=?",cinema_id,Time.now.tomorrow.to_date.to_s+'%',film_id],
      :order=>"film_name asc,priority_ desc,stime asc"
      )
    end
  end

  
    #后日影讯
  def self.afterday(cinema_id,film_id=nil)
    if film_id.nil?
      return Message.find(:all,
      :conditions=>["status = 1 AND cinema_id=? and stime like ?",cinema_id,2.days.from_now.to_date.to_s+'%'],
      :order=>"film_name asc,priority_ desc,stime asc"
      )
    else
      return Message.find(:all,
      :conditions=>["status = 1 AND cinema_id=? and stime like ? and film_id=?",cinema_id,2.days.from_now.to_date.to_s+'%',film_id],
      :order=>"film_name asc,priority_ desc,stime asc"
      )
    end
  end
  
  #  即将上映
  def self.comesoon(cinema_id)
    return Message.find(:all,
    :conditions=>["status = 1 AND cinema_id=? and stime>?",cinema_id,48.hours.from_now],
    :order=>"stime ASC"
    )
  end
  
  #今明日影讯
  #film_id 电影的编号
  #cinema_id 电影院的编号
  def self.today_and_tomorow(film_id,cinema_id=nil)
    today=Time.now.at_beginning_of_day;
    if cinema_id.nil?
      return Message.find(:all,
      :conditions=>["status=1 and film_id=? and stime < ? and stime > ?",film_id,48.hours.since(today),today],
      :order =>"stime ASC"
      )
    else
      return Message.find(:all,
      :conditions=>["status=1 and cinema_id=? and film_id=? and stime < ? and stime > ?",cinema_id,film_id,48.hours.since(today),today],
      :order =>"stime ASC"
      )  
    end
  end
  
  # 显示最近100条
  def self.findLatest300
    return Message.find(:all,:order=>"stime desc",:limit=>100)
  end
  
end
