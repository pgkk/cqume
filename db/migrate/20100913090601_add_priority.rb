class AddPriority < ActiveRecord::Migration
  def self.up
    add_column(:messages, :priority_, :integer, :default=>100)
  end

  def self.down
    remove_column(:messgaes, :priority_)
  end
end
