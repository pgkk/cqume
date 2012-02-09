#coding: utf-8
class AddColumnsTypeIdForArticle < ActiveRecord::Migration
  def self.up
    add_column(:articles, :type_id, :integer)
  end

  def self.down
    remove_column(:articles,:type_id)
  end
end
