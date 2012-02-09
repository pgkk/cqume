class VotingsOptions < ActiveRecord::Base
  
  def self.increment(id)
    option = VotingsOptions.find(:first, :conditions => [" id = ?", id])
    option.counter += 1
    option.save
    true
  end
  
end
