#coding: utf-8
class ModifyTypesCodeDefault < ActiveRecord::Migration
  def self.up
    change_column(:types, :code, :string, :default=>1000)
  end

  def self.down
    change_column(:types, :code, :integer)
  end
end
