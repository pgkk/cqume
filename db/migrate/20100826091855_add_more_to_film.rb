#coding: utf-8
class AddMoreToFilm < ActiveRecord::Migration
  def self.up
    add_column :films, :category, :string
  end

  def self.down
    remove_column :films, :category
  end
end
