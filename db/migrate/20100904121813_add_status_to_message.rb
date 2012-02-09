#coding: utf-8
class AddStatusToMessage < ActiveRecord::Migration
  
  def self.up
    add_column :messages, :status, :boolean, :null => false
  end
  
  def self.down
    remove_column :status
  end
  
end