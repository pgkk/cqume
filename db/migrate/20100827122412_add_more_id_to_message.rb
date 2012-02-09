#coding: utf-8
class AddMoreIdToMessage < ActiveRecord::Migration
  def self.up
    add_column :messages, :cinema_id, :integer, :null => false
    add_column :messages, :film_id, :integer, :null => false
  end

  def self.down
    remove_column :messages, :cinema_id
    remove_column :messages, :film_id
  end
end
