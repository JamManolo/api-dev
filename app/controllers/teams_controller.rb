class TeamsController < ApplicationController

	def index
		@teams = Team.all
	end

	def show
		@team = Team.find(params[:id])
		@league = League.find_by(country: @team.country)

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
