class AlterFilmsAddColumnDuration < ActiveRecord::Migration
  def self.up
    add_column :films, :duration, :integer, :default => 0
  end

  def self.down
    remove_column :films, :duration
  end
end
