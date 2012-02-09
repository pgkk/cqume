class AlterMessagesAddColumnFilmLength < ActiveRecord::Migration
  def self.up
    add_column :messages, :film_length, :integer, :null => false
  end

  def self.down
    remove_column :messages, :film_length
  end
end
