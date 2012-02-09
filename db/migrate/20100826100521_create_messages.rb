#coding: utf-8
class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages, :options => 'DEFAULT CHARSET=utf8' do |m|
      m.string    :film_name,  :null => false     # 片名
      m.string    :country,   :null => false      # 国家
      m.string    :film_type,    :null => false   # 类型
      m.integer   :film_length,  :null => false   # 片长
      m.string    :room,   :null => false         # 所属厅
      m.integer   :price,  :null => false         # 票价
      m.datetime  :stime,  :null => false         # 开演时间
      m.integer   :service_price,  :null => false # 如果是VIP，有服务费
      m.string    :note,  :null => true           # 备注
      m.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
