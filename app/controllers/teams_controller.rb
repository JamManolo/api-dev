class TeamsController < ApplicationController

	def index
		@teams = params[:country].nil? ? Team.all : Team.find_by(country: params[:country])
	end

	def show
		@team = Team.find(params[:id])

		@league = League.find_by(league_id: @team.league_id) unless @team.league_id == "0"
		@league = "unknown" if @league.nil?
		
		@competitions = League.find_by(league_id: @team.competitions) unless @team.competitions == "0"
		@competitions = "unknown" if @competitions.nil?

		# Output completed fixtures
		# Sort out domestic fixtures vs competitions
		# JMC - usage of :all is apparently deprecated
    @fixturesX = Fixture.find(:all,
    	{
    		conditions:
    		[
		    	"time_x != ? AND
		    	 (home_team_id = ? OR away_team_id = ?)",
		    	 '', @team.team_id, @team.team_id
	    	]
	    }
  	)
  	@round = @fixturesX.last.nil? ? 0 : @fixturesX.last[:round]
  	
  	@fix_leagueX = Array.new
  	@fix_compX   = Array.new
  	@fix_otherX  = Array.new
  	@fixturesX.each do |fix|
  		logger.debug "f_id:, '#{fix.league_id}', l_id: '#{@team.league_id}', comps: '#{@team.competitions}'"
  		if fix.league_id == @team.league_id
  			@fix_leagueX << fix
  		elsif @team.competitions.include? fix.league_id.to_s
  			@fix_compX << fix
  		else
  			logger.debug "comps = '#{@competitions}', fid = '#{fix.league_id}'"
  			@fix_otherX << fix
  		end
  	end

  	# Output remaining fixtures
  	# Sort out domestic fixtures vs competitions
  	# JMC - usage of :all is apparently deprecated
    @fixturesY = Fixture.find(:all,
    	{
    		conditions:
    		[
		    	"time_x = ? AND
		    	 (home_team_id = ? OR away_team_id = ?)",
		    	 '', @team.team_id, @team.team_id
	    	]
	    }
  	)

  	@fix_leagueY = Array.new
  	@fix_compY   = Array.new
  	@fix_otherY  = Array.new
  	@fixturesY.each do |fix|
  		if fix.league_id.to_i == @team.league_id.to_i
  			@fix_leagueY << fix
  		elsif @team.competitions.include? fix.league_id.to_s
  			@fix_compY << fix
  		else
  			@fix_otherY << fix
  		end
  	end

  end

end
