#coding: utf-8
class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles,:options => 'DEFAULT CHARSET=utf8' do |t|
      t.string :title,:null=>false  #标题
      t.text :content,:null=>false  #内容
      t.type_id :type,:null=>false  #分类编号
      t.string :author,:null=>true  #作者
      t.string :afrom,:null=>true   #文章来源
      t.integer :count,:default=>0  #点击量
      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
