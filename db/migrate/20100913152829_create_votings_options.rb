class CreateVotingsOptions < ActiveRecord::Migration
  def self.up
    create_table :votings_options do |t|
     t.string :value, :null => false, :default => ''
      t.string :color, :null => false, :default => ''
      t.integer :counter, :null => false, :default => 0
      t.integer :voting_id, :null => false
    end
  end

  def self.down
    drop_table :votings_options
  end
end
