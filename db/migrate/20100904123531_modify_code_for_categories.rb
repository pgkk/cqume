#coding: utf-8
class ModifyCodeForCategories < ActiveRecord::Migration
  def self.up
    change_column(:categories, :code, :string, :null=>false)
  end
  
  def self.down
    change_column(:categories, :code, :integer)
  end
end
