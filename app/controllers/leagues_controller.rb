class LeaguesController < ApplicationController

	def index
    @leagues = League.all
  end

  def show
    @league = League.find(params[:id])
    @standings = Array.new
    @fixtures = Array.new
    @teams = Array.new
    @start_round = 1
    @end_round = 0
    season = '1314'

    xmlsoccer_client = XMLsoccerHTTP::RequestManager.new({
      api_key: JSON.parse(File.open('xmlsoccer_config.json').read)['api_key'],
      api_type: "Demo"
    })
    
    # Problem with team data for leagues 40 (Ukranian) and 41 (Russian)
    #
    unless false # [40, 41].include?(@league.league_id)
      # xml_doc = Nokogiri::XML(
      #   xmlsoccer_client.get_all_teams_by_league_and_season(params[:id], season).body)
      xml_doc = Nokogiri::XML(File.open("XML-NEW/Teams-league-#{@league.league_id}-#{season}.xml").read)
      xml_doc.xpath("//XMLSOCCER.COM").first.add_namespace_definition(nil, "http://xmlsoccer.com/Team")
      namespace = 'xmlns:'

      xml_doc.xpath("//#{namespace}Team").each do |node|
        @teams << { team_id:       node.xpath("#{namespace}Team_Id").text,
                    country:       node.xpath("#{namespace}Country").text,
                    name:          node.xpath("#{namespace}Name").text,
                    stadium:       node.xpath("#{namespace}Stadium").text,
                    home_page_url: node.xpath("#{namespace}HomePageURL").text,
                    wiki_link:     node.xpath("#{namespace}WIKILink").text }
      end
    end

    # League standings
    # xml_doc = Nokogiri::XML(
    #   xmlsoccer_client.get_league_standings_by_season(@league.league_id, season).body)
    xml_doc = Nokogiri::XML(File.open("XML-NEW/Standings-league-#{@league.league_id}-#{season}.xml").read)
    xml_doc.xpath("//XMLSOCCER.COM").first.add_namespace_definition(nil, "http://xmlsoccer.com/LeagueStanding")
    namespace = 'xmlns:'
    xml_doc.xpath("//#{namespace}TeamLeagueStanding").each do |node|
      @standings << { team:            node.xpath("#{namespace}Team").text,
                      team_id:         node.xpath("#{namespace}Team_Id").text,
                      played:          node.xpath("#{namespace}Played").text,
                      played_at_home:  node.xpath("#{namespace}PlayedAtHome").text,
                      played_away:     node.xpath("#{namespace}PlayedAway").text,
                      won:             node.xpath("#{namespace}Won").text,
                      draw:            node.xpath("#{namespace}Draw").text,
                      lost:            node.xpath("#{namespace}Lost").text,
                      number_of_shots: node.xpath("#{namespace}NumberOfShots").text,
                      yellow_cards:    node.xpath("#{namespace}YellowCards").text,
                      red_cards:       node.xpath("#{namespace}RedCards").text,
                      goals_for:       node.xpath("#{namespace}Goals_For").text,
                      goals_against:   node.xpath("#{namespace}Goals_Against").text,
                      goal_difference: node.xpath("#{namespace}Goal_Difference").text,
                      points:          node.xpath("#{namespace}Points").text,
                    }
    end

    # Output results (completed fixtures)
    @fixturesX = Hash.new
    @latest_round = @league.latest_round

    if @latest_round > 1
      (1..@latest_round).each do |round|
        fixtures = Fixture.where(round: round, league_id: @league.league_id) 
        @fixturesX[round.to_s] = fixtures
      end
    else
      @fixturesX['1'] = Fixture.where(league_id: @league.league_id, time_x: "Finished")
    end

    # Output scheduled fixtures
    @fixturesY = Hash.new
    @final_round = @league.final_round

    if @final_round > 1
      @start_round = @latest_round + 1
      @end_round = @league.final_round
      (@start_round..@end_round).each do |round|
        fixtures = Fixture.where(round: round, league_id: @league.league_id)
        @fixturesY[round.to_s] = fixtures
      end
    elsif @final_round == 1
      @start_round = @end_round = 1
      @fixturesY['1'] = Fixture.where(round: 1, league_id: @league.league_id) - @fixturesX['1']
    else # @final_round == 0
      @start_round = @end_round = 1
      @fixturesY['1'] = Fixture.where(league_id: @league.league_id) - @fixturesX['1']
      @latest_round = 1
    end

  end

end
