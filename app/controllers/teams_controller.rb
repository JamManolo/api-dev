class TeamsController < ApplicationController

	def index
		@teams = params[:country].nil? ? Team.all : Team.find_by(country: params[:country])
	end

	def show
		@team = Team.find(params[:id])
		@league = League.find_by(league_id: @team.league_id) unless @team.league_id == "0"
    @round = @league.nil? ? 0 : @league.latest_round

    # Initialize view data structures
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

    # Get completed and remaining fixtures, sorting out domestic league vs competitions
    Fixture.all.each do |fix|
      if [fix.home_team_id, fix.away_team_id].include? @team.team_id
        fix_league = fix.time_x != '' ? @fix_leagueX : @fix_leagueY
        fix_comp   = fix.time_x != '' ? @fix_compX   : @fix_compY
        if @team.league_id.to_i == fix.league_id.to_i
          fix_league << fix
        elsif @team.competitions.include? fix.league_id.to_s
          fix_comp[fix.league_id.to_s] << fix
        end
      end
    end

  end

end
