class LeaguesController < ApplicationController

	def index
    @leagues = League.all
  end

  def show
    @league = League.find(params[:id])
    @standings = Array.new
    @fixtures = Array.new
    @teams = Array.new
    @round = 0
    @start_round = 1
    @last_round = 0
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
    @round = Fixture.where(time_x: 'Finished', league: @league.name).last[:round]
    (1..@round).each do |round|
      fixtures = @round > 1 ? Fixture.where(round: round, league: @league.name) :
                              Fixture.where(league: @league.name, time_x: "Finished")
      @fixturesX[round.to_s] = fixtures
    end

    # Output scheduled fixtures
    @fixturesY = Hash.new
    if @round > 1
      @start_round = @round + 1
      @last_round = Fixture.where(league: @league.name).last[:round]
      (@start_round..@last_round).each do |round|
        fixtures = Fixture.where(round: round, league: @league.name)
        @fixturesY[round.to_s] = fixtures
      end
    else
      @start_round = @last_round = 1
      @fixturesY['1'] = Fixture.where(round: 1, league: @league.name) - @fixturesX['1']
    end

  end

end
