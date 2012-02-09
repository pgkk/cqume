#coding: utf-8
class CreateTypes < ActiveRecord::Migration
  def self.up
    create_table :types,:options => 'DEFAULT CHARSET=utf8' do |t|
      t.string :name,:null=>false #分类标题
      t.integer :parent_id        #父级编号
      t.integer :info             #相关说明
      t.string :url              #附属链接
      t.timestamps    
    end
  end

  def self.down
    drop_table :types
  end
end
