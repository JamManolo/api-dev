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

    # Handle 'competition' leagues (16, 17) and 'conference' leagues (20)
    if @league.league_id == 16
      @group_names = ('A'..'H').to_a
      @team_group_map = {
        "140"=>"A", "71"=>"D",  "17"=>"A",  "220"=>"B", "170"=>"C", "314"=>"B", "531"=>"C", "436"=>"D",
        "155"=>"H", "75"=>"H",  "78"=>"F",  "68"=>"E",  "123"=>"F", "15"=>"E",  "145"=>"G", "846"=>"G",
        "548"=>"G", "57"=>"F",  "188"=>"H", "54"=>"H",  "9"=>"F",   "537"=>"G", "425"=>"E", "375"=>"E",
        "543"=>"D", "154"=>"B", "87"=>"B",  "74"=>"A",  "131"=>"C", "18"=>"D",  "192"=>"C", "549"=>"A",
      }
    elsif @league.league_id == 17
      @group_names = ('A'..'L').to_a
      @team_group_map = {
        "141"=>"A", "83"=>"E",  "230"=>"F", "184"=>"B", "770"=>"F", "864"=>"A", "194"=>"C", "379"=>"B",
        "366"=>"D", "390"=>"C", "202"=>"D", "855"=>"E", "76"=>"J",  "60"=>"H",  "138"=>"I", "21"=>"K",
        "362"=>"G", "865"=>"J", "165"=>"L", "858"=>"L", "380"=>"K", "851"=>"G", "538"=>"I", "529"=>"H",
        "426"=>"K", "550"=>"D", "394"=>"L", "900"=>"A", "183"=>"L", "130"=>"I", "151"=>"H", "443"=>"G",
        "412"=>"J", "372"=>"H", "195"=>"G", "212"=>"J", "857"=>"I", "417"=>"K", "133"=>"F", "19"=>"A", 
        "12"=>"D",  "404"=>"C", "542"=>"E", "419"=>"F", "359"=>"C", "534"=>"E", "848"=>"B", "401"=>"B",
        "854"=>"A",
      }
    elsif @league.league_id == 20
      @month_names = [ 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', ]
      @group_names = [ "Western", "Eastern" ]
      @team_group_map = {
        "571"=>"Eastern", "572"=>"Eastern", "573"=>"Eastern", "574"=>"Eastern", "578"=>"Eastern",
        "580"=>"Eastern", "582"=>"Eastern", "584"=>"Eastern", "586"=>"Eastern", "589"=>"Eastern",
        "575"=>"Western", "576"=>"Western", "577"=>"Western", "579"=>"Western", "581"=>"Western",
        "583"=>"Western", "585"=>"Western", "587"=>"Western", "588"=>"Western",
      }
    end

    @teamsX = Hash.new
    @standingsX = Hash.new
    if [16, 17, 20].include? @league.league_id
      @group_names.each do |group_name|
        @teamsX[group_name] = Array.new
        @standingsX[group_name] = Array.new
      end
    else
      @teamsX['domestic_league'] = Array.new
      @standingsX['domestic_league'] = Array.new
    end

    domestic_league_name = domestic_league_link = ''
    competition_group_name = 'domestic_league'

    xml_doc = Nokogiri::XML(File.open("XML-NEW/Teams-league-#{@league.league_id}-#{season}.xml").read)
    xml_doc.xpath("//XMLSOCCER.COM").first.add_namespace_definition(nil, "http://xmlsoccer.com/Team")
    namespace = 'xmlns:'

    xml_doc.xpath("//#{namespace}Team").each do |node|
      
      if ["16", "17",].include?(@league.league_id.to_s) 
        team = Team.find_by(team_id: node.xpath("#{namespace}Team_Id").text)
        if team.league.downcase == "unknown"
          domestic_league_name = "(#{team.country})"
          domestic_league_link = countries_url(country: team.country)
        else
          domestic_league_name = team.league
          domestic_league_link = league_url(League.find_by(league_id: team.league_id))
        end
        competition_group_name = @team_group_map[team.team_id.to_s]
      elsif @league.league_id == 20
        competition_group_name = @team_group_map[node.xpath("#{namespace}Team_Id").text]
      end

      @teamsX[competition_group_name] << {
        team_id:       node.xpath("#{namespace}Team_Id").text,
        country:       node.xpath("#{namespace}Country").text,
        name:          node.xpath("#{namespace}Name").text,
        stadium:       node.xpath("#{namespace}Stadium").text,
        home_page_url: node.xpath("#{namespace}HomePageURL").text,
        wiki_link:     node.xpath("#{namespace}WIKILink").text,
        league:        domestic_league_name,
        league_link:   domestic_league_link,
      }
    end

    # League standings
    xml_doc = Nokogiri::XML(File.open("XML-NEW/Standings-league-#{@league.league_id}-#{season}.xml").read)
    xml_doc.xpath("//XMLSOCCER.COM").first.add_namespace_definition(nil, "http://xmlsoccer.com/LeagueStanding")
    namespace = 'xmlns:'
    xml_doc.xpath("//#{namespace}TeamLeagueStanding").each do |node|

      if ["16", "17", "20"].include?(@league.league_id.to_s)
        competition_group_name = @team_group_map[node.xpath("#{namespace}Team_Id").text]
      else
        competition_group_name = 'domestic_league'
      end

      # Handle shittle situation
      if node.xpath("#{namespace}Team_Id").text == "579"
        node.xpath("#{namespace}Team").first.content = "Shittle Sounders FC"
      end

      # logger.debug "TEAM ID : '#{node.xpath("#{namespace}Team_Id").text}', GROUP NAME: '#{competition_group_name}'"

      @standingsX[competition_group_name] << {
        team:            node.xpath("#{namespace}Team").text,
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
        @fixturesX[round.to_s] = Array.new
      end
      Fixture.where(league_id: @league.league_id).each do |fixture|
        break if fixture.round > @latest_round
        @fixturesX[fixture.round.to_s] << fixture
      end
    elsif @latest_round == 1
      @fixturesX['1'] = Fixture.where(league_id: @league.league_id, time_x: "Finished")
      @fixturesX['1'].each do |fixture|
        month = fixture.date.in_time_zone.strftime('%B')
        @fixturesX[month] = Array.new unless @fixturesX[month]
        @fixturesX[month] << fixture
      end
    elsif @group_names # @latest_round == 0
      @group_names.each do |group_name|
        @fixturesX[group_name] = Array.new
      end
      Fixture.where(league_id: @league.league_id, time_x: "Finished").each do |fixture|
        @fixturesX[@team_group_map[fixture.home_team_id.to_s]] << fixture
      end
    end

    # Output scheduled fixtures
    @fixturesY = Hash.new
    @final_round = @league.final_round
    if @final_round > 1
      @start_round = @latest_round + 1
      @end_round = @league.final_round
      (@start_round..@end_round).each do |round|
        @fixturesY[round.to_s] = Array.new
      end
      Fixture.where(league_id: @league.league_id).each do |fixture|
        next if fixture.round < @start_round
        @fixturesY[fixture.round.to_s] << fixture
      end
    elsif @final_round == 1
      @fixturesY['1'] = Fixture.where(league_id: @league.league_id) - @fixturesX['1']
      @fixturesY['1'].each do |fixture|
        month = fixture.date.in_time_zone.strftime('%B')
        @fixturesY[month] = Array.new unless @fixturesY[month]
        @fixturesY[month] << fixture
      end
    elsif @group_names # @final_round == 0
      @group_names.each do |group_name|
        @fixturesY[group_name] = Array.new
      end
      Fixture.where(league_id: @league.league_id).each do |fixture|
        group_name = @team_group_map[fixture.home_team_id.to_s]
        @fixturesY[group_name] << fixture
      end
      @group_names.each do |group_name|
        @fixturesY[group_name] -= @fixturesX[group_name]
      end
    end

    # render 'show-orig'

  end

end
