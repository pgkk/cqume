class AlterMessages < ActiveRecord::Migration
  def self.up
    remove_column :messages, :film_length
  end

  def self.down
  end
end
