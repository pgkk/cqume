#coding: utf-8
class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments,:options => 'DEFAULT CHARSET=utf8'  do |t|
      t.string  :title
      t.string  :content    , :null => false
      t.boolean :isreplay   , :default => false
      t.string  :orderid
      t.string  :ipaddress
      t.integer :cinema_id  , :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
