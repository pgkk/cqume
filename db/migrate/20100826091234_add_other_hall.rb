#coding: utf-8
class AddOtherHall < ActiveRecord::Migration
  def self.up
    add_column(:cinemas, :viphall, :integer, :default=>0) #放映厅数量
    add_column(:cinemas, :loverhall, :integer,:default=>0)  #情侣放映厅数量
    add_column(:cinemas, :imaxhall, :integer, :default=>0) #imax放映厅数量
  end

  def self.down
    remove_column(:cinemas, :viphall)
    remove_column(:cinemas, :loverhall)
    remove_column(:cinemas, :imaxhall)
  end
end
