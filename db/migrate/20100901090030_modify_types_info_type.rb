#coding: utf-8
class ModifyTypesInfoType < ActiveRecord::Migration
  def self.up
    change_column(:types, :info, :string)
  end

  def self.down
    change_column(:types, :info, :integer)
  end
end
