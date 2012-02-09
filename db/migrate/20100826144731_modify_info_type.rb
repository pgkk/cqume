#coding: utf-8
class ModifyInfoType < ActiveRecord::Migration
  def self.up
    change_column(:cinemas, :info, :string,:null=>false)
  end

  def self.down
    #rails ActiveRecord::IrreversibleMigration
  end
end
