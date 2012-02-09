class VotingController < ApplicationController
  
  layout false
  
  def index
    @votings = Voting.find(:all)
  end
    
  def do_voting
    @errors = {}
    @voting_data = Voting.getVoting(params[:id])
   
    if request.post?
      if params[:voting_form] && params[:voting_form][:val]
        VotingsOptions.increment(params[:voting_form][:val].to_i)
        redirect_to '/voting/view/' + params[:id]
      end
      if params[:val]
        params[:val].each do |n|
          VotingsOptions.increment(n.to_i)
        end
        redirect_to '/voting/view/' + params[:id]
      else
        @errors[:missing_checkbox_val] = '至少提供一个值。'
      end
    end
  end
    
  def view
    @voting_data = Voting.getVoting(params[:id])
    @total = 0
    @voting_data[:options].each do |o|
      @total += o.counter
    end
  end
    
end
