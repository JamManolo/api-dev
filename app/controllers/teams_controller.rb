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

  	# Output remaining fixtures
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
	end

end
