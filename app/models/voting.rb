class Voting < ActiveRecord::Base
  
  def self.getVoting(id)
    data = {}
    voting = Voting.find(:first, :conditions => ["id = ?", id])
    options = VotingsOptions.find(:all, :conditions => ["voting_id = ?",  id])
   
    data[:voting] = voting
    data[:options] = options
    
    return data
  end
  
  def self.clear(id)
    if id.nil?
      return
    end
    id = id.to_i
    if id <= 0
      return
    end
    ActiveRecord::Base.connection.execute("UPDATE votings_options SET counter = 0 WHERE voting_id = #{id}")
  end
  
end
