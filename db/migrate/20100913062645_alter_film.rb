class AlterFilm < ActiveRecord::Migration
  def self.up
    remove_column :films, :manufacture
    remove_column :films, :global_released_date
    remove_column :films, :playwrighter
    remove_column :films, :duration
  end

  def self.down
  end
end
