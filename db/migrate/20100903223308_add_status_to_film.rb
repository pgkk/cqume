#coding: utf-8
class AddStatusToFilm < ActiveRecord::Migration
  
  def self.up
    add_column :films, :status, :boolean, :null => false
  end
  
  def self.down
    remove_column :films, :status
  end
  
end