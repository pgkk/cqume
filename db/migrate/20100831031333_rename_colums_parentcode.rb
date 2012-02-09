#coding: utf-8
class RenameColumsParentcode < ActiveRecord::Migration
  def self.up
    rename_column(:types, :parent_id, :code)
  end

  def self.down
    rename_column(:types, :code, :parent_id)
  end
end
