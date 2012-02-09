#coding: utf-8
class Film < ActiveRecord::Base

  validates_presence_of :name, :message => '此字段不能为空'
  #validates_presence_of :category, :message => '此字段不能为空'
  validates_presence_of :director, :message => '此字段不能为空'
  validates_presence_of :actors, :message => '此字段不能为空'
  #validates_presence_of :img, :message => '此字段不能为空'
  validates_presence_of :description, :message => '此字段不能为空'
  #validates_presence_of :manufacture, :message => '此字段不能为空'
  validates_presence_of :country, :message => '此字段不能为空'
  #validates_presence_of :playwrighter, :message => '此字段不能为空'
  #validates_presence_of :global_released_date, :message => '此字段不能为空'
  validates_presence_of :released_date, :message => '此字段不能为空'
  
  validates_numericality_of :duration, :message => '此字段只能是数字'

  has_many :message    # 拥有多个影讯



  def find_all_messages_by_film()
    if self.id.nil?
      return nil
    end
    return get_messages
  end

  #当前一周内要上映的电影
  def self.get_week_relased(cinema_id=nil)
      return Film.find(:all, :conditions => ["status = 1 AND released_date < ? AND released_date > ?", 7.days.from_now, Time.now])
  end
  
  def self.get_relased(cinema_id=nil)
      return Film.find(:all, :conditions => ["status = 1 AND released_date < ? AND released_date > ?", 7.days.from_now, 2.months.ago])
  end

  #当前一个月的影片
  def self.get_current_month_relased
   # return Film.find(:all, :conditions => ["status = 1 AND released_date < ?", Time.now().next_month.strftime('%Y-%m-01 %H:%M:%S')])
   return Film.find(:all, :conditions => ["status = 1 AND released_date < ? AND name <> '午夜连场'", Time.now().next_month.strftime('%Y-%m-01 %H:%M:%S')])
  end

  #一个月之后的影片
  def self.get_one_month_later_relased
    #return Film.find(:all, :conditions => ["status = 1 AND released_date >= ?", Time.now().next_month.strftime('%Y-%m-01 %H:%M:%S')])
    #p Time.now().next_month.strftime('%Y-%m-01 %H:%M:%S')
    return Film.find(:all, :conditions => ["status = 1 AND released_date >= ? AND name <> '午夜连场'", Time.now().next_month.strftime('%Y-%m-01 %H:%M:%S')])
  end

  #今天要上映的一片
  def self.get_today_released
    return Film.find(:all, :conditions => ["status = 1 AND released_date LIKE ?", Time.now().strftime('%Y-%m-%d') + '%'])
  end
  

  private

  def get_messages
    return Message.find(:all, :conditions => ['film_id = ?', self.id])
  end

  
end
