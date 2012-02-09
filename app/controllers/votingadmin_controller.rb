class VotingadminController < UmeadminController
  
  layout  'adminlayout'
  
  def add
    
    @errors = {}
    @return_data = {}
    
    if request.post?
      voting_instance = Voting.new()
      voting_instance.cat = params[:voting_data][:cat].to_i == 0 ? false : true
      voting_instance.name = params[:voting_data][:name]
      if voting_instance.save
        voting_options = params[:voting_data][:options]
        reg = Regexp.new('^value_([0-9]+)$')
        pairs = []
        voting_id = voting_instance.id
        voting_options.each_pair do |key, value|
          matcheds = reg.match(key.to_s)
          if matcheds
            pairs.push({:value => value, :counter => 0, :voting_id => voting_id , :color => voting_options['color_' + $1]})
          end
        end
        pairs.each do |entry|
          VotingsOptions.new(entry).save()
        end
        
        flash[:success_msg] = "添加成功!"
        redirect_to :action => 'index'
      else
        #render :text => 'aaaa'
      end
    end
  end
  
  def index
    @votings = Voting.find(:all)
  end
  
  def delete
    id = params[:id]
    Voting.delete(id)
    VotingsOptions.delete(:conditions => ["voting_id = ?", id])
    redirect_to :back
  end
  
  def edit
    
    @voting_data = Voting.getVoting(params[:id]) 
    @counter = @voting_data[:options].size
    
    if request.post?
      Voting.update(params[:id], {:cat => params[:voting][:cat] ? true : false , :name => params[:voting][:name]})
     
      opts = params[:voting][:option]
      if opts
        reg = Regexp.new('^value_([0-9]+)$')
        
        entries = []
        
        
        p '+++++++++++++++++++++++++++++++++++'
        p opts
        opts.each_pair do |k, v|
          if reg.match(k)
            pair = {}
            pair[:voting_id] = params[:id]
            pair[:value] = v
            pair[:color] = opts['color_' + $1.to_s]
            pair[:counter] = 0
            entries.push(pair)
          end
        end
        entries.each do |o|
          VotingsOptions.new(o).save
        end
        redirect_to :action => 'index'
      end
      
    end
  end
  
  def ajax_del_opt
    id = params[:id]
    VotingsOptions.delete(id)
    render :json => {}.to_json
  end
  
  def clear
    Voting.clear(params[:id])
    flash[:success_msg] = '操作成功。'
    redirect_to :action => 'index'
  end
  
  
end
