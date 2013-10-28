class TeamsController < ApplicationController

	def index
		@teams = params[:country].nil? ? Team.all : Team.find_by(country: params[:country])
	end

	def show
		@team = Team.find(params[:id])

		@league = League.find_by(league_id: @team.league_id) unless @team.league_id == "0"
    @round = @league.nil? ? 0 : @league.latest_round
    @fix_leagueX = Array.new
    @fix_leagueY = Array.new
    @fix_compX = Hash.new
    @fix_compY   = Hash.new
    @competitions = Array.new
    @team.competitions.each do |comp|
      @fix_compX[comp] = Array.new
      @fix_compY[comp] = Array.new
      @competitions << League.find_by(league_id: comp) 
    end

		# Get completed fixtures, sorting out domestic fixtures vs competitions
		# JMC - usage of :all is apparently deprecated
    Fixture.find(:all,
    	{
    		conditions:
    		[
		    	"time_x != ? AND
		    	 (home_team_id = ? OR away_team_id = ?)",
		    	 '', @team.team_id, @team.team_id
	    	]
	    }
  	).each do |fix|
  		if @team.league_id.to_i == fix.league_id.to_i
  			@fix_leagueX << fix
  		elsif @team.competitions.include? fix.league_id.to_s
  			@fix_compX[fix.league_id.to_s] << fix
  		end
  	end

  	# Get remaining fixtures, sorting out domestic fixtures vs competitions
    Fixture.find(:all,
    	{
    		conditions:
    		[
		    	"time_x = ? AND
		    	 (home_team_id = ? OR away_team_id = ?)",
		    	 '', @team.team_id, @team.team_id
	    	]
	    }
  	).each do |fix|
      if @team.league_id.to_i == fix.league_id.to_i
  			@fix_leagueY << fix
  		elsif @team.competitions.include? fix.league_id.to_s
  			@fix_compY[fix.league_id.to_s] << fix
  		end
  	end

  end

end
