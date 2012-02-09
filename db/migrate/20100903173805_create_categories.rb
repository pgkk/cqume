#coding: utf-8
class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories, :options => 'DEFAULT CHARSET=utf8' do |t|
      t.string  :name,:null=>false  #分类标题
      t.integer :code               #父级编号
      t.integer :info               #相关说明
      t.string  :url                #附属链接
      t.timestamps
    end
  end

  def self.down
    drop_table :categories
  end
end
