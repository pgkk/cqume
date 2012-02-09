#coding: utf-8
class CreateCinemas < ActiveRecord::Migration
  def self.up
    create_table :cinemas, :options => 'DEFAULT CHARSET=utf8' do |t|
      t.string :name, :null => false  #影院名称 
      t.string :address,  :null => false  #影院地址
      t.string :phone,  :null => true     #联系电话
      t.integer :hall,  :null=>false, :default=>0 #放映厅数量
      t.integer :info,  :null=>false              #介绍
      t.timestamps
    end
  end
  
  def self.down
    drop_table :cinemas
  end
end
