#coding: utf-8
class CreateFriendLinks < ActiveRecord::Migration
  def self.up
    create_table :friend_links,:options => 'DEFAULT CHARSET=utf8'  do |t|
      t.string :title , :null => false, :default => '', :limit => 20
      t.string :url , :null => false, :default => ''
      t.timestamps
    end
  end

  def self.down
    drop_table :friend_links
  end
end
