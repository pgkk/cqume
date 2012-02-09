#coding: utf-8
class AddTypesFlag < ActiveRecord::Migration
  def self.up
    add_column(:types, :isMenu, :boolean, :default=>false)
  end

  def self.down
    remove_column(:types, :isMenu)
  end
end
