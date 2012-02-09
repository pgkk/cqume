#coding: utf-8
class ModifyTypesInfoColumnsType < ActiveRecord::Migration
  def self.up
     change_column(:types, :info, :string,:null=>true)
  end

  def self.down
    change_column(:types, :info, :integer)
  end
end
