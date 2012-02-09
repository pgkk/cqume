#coding: utf-8
class CreateFilms < ActiveRecord::Migration
  def self.up
    create_table :films, :options => 'DEFAULT CHARSET=utf8' do |t|
      t.string :name 
      t.string :actors
      t.text :description
      t.string :img
      t.string :country
      t.string :manufacture
      t.string :director
      t.datetime :global_released_date
      t.datetime :released_date
      t.string :playwrighter
      t.integer :duration
      t.timestamps
    end
  end

  def self.down
    drop_table :films
  end
end
