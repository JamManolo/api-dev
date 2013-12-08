# Output league standings

require './transform-utils'
require 'aws-sdk'
require 'json'

def setup_group_data(league_id_str)

  # Handle 'competition' leagues (16, 17) and 'conference' leagues (20)
  if league_id_str == "16"
    @group_names = ('A'..'H').to_a
    @team_group_map = {
      "140"=>"A", "071"=>"D", "017"=>"A", "220"=>"B", "170"=>"C", "314"=>"B", "531"=>"C", "436"=>"D",
      "155"=>"H", "075"=>"H", "078"=>"F", "068"=>"E", "123"=>"F", "015"=>"E", "145"=>"G", "846"=>"G",
      "548"=>"G", "057"=>"F", "188"=>"H", "054"=>"H", "009"=>"F", "537"=>"G", "425"=>"E", "375"=>"E",
      "543"=>"D", "154"=>"B", "087"=>"B", "074"=>"A", "131"=>"C", "018"=>"D", "192"=>"C", "549"=>"A",
       "71"=>"D",  "17"=>"A",  "75"=>"H",  "78"=>"F",  "68"=>"E",  "15"=>"E",  "57"=>"F",  "54"=>"H",
        "9"=>"F",  "87"=>"B",  "74"=>"A",  "18"=>"D", 
    }
  elsif league_id_str == "17"
    @group_names = ('A'..'L').to_a
    @team_group_map = {
      "141"=>"A", "083"=>"E", "230"=>"F", "184"=>"B", "770"=>"F", "864"=>"A", "194"=>"C", "379"=>"B",
      "366"=>"D", "390"=>"C", "202"=>"D", "855"=>"E", "076"=>"J", "060"=>"H", "138"=>"I", "021"=>"K",
      "362"=>"G", "865"=>"J", "165"=>"L", "858"=>"L", "380"=>"K", "851"=>"G", "538"=>"I", "529"=>"H",
      "426"=>"K", "550"=>"D", "394"=>"L", "900"=>"A", "183"=>"L", "130"=>"I", "151"=>"H", "443"=>"G",
      "412"=>"J", "372"=>"H", "195"=>"G", "212"=>"J", "857"=>"I", "417"=>"K", "133"=>"F", "019"=>"A", 
      "012"=>"D", "404"=>"C", "542"=>"E", "419"=>"F", "359"=>"C", "534"=>"E", "848"=>"B", "401"=>"B",
      "854"=>"A",
       "83"=>"E",  "76"=>"J",  "60"=>"H",  "21"=>"K",  "19"=>"A",  "12"=>"D", 
    }
  elsif league_id_str == '20'
    @month_names = [ 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', ]
    @group_names = [ "Western", "Eastern" ]
    @team_group_map = {
      "571"=>"Eastern", "572"=>"Eastern", "573"=>"Eastern", "574"=>"Eastern", "578"=>"Eastern",
      "580"=>"Eastern", "582"=>"Eastern", "584"=>"Eastern", "586"=>"Eastern", "589"=>"Eastern",
      "575"=>"Western", "576"=>"Western", "577"=>"Western", "579"=>"Western", "581"=>"Western",
      "583"=>"Western", "585"=>"Western", "587"=>"Western", "588"=>"Western",
    }
  else
    @group_names = [ 'domestic_league' ]
  end
end

def transform_league_standings(options)

  league_id_str = options[:league_id_str]
  season = '1314'

  puts "Fetching 'League Standings' info for league #{league_id_str} from production data store ..."
  $stdout.flush

  setup_group_data(league_id_str)

  standing = 0
  standing_ids = []
  @standingsX = Hash.new
  @group_names.map { |group_name| @standingsX[group_name] = [] }

  filename = "Standings-league-#{league_id_str}-#{season}.xml"
  xml_doc = Nokogiri::XML(aws_data_fetch({
    name: filename,
    path: 'soccer/raw-data',
  }))
  xml_doc.xpath("//XMLSOCCER.COM").first.add_namespace_definition(nil, "http://xmlsoccer.com/LeagueStanding")
  namespace = 'xmlns:'
  xml_doc.xpath("//#{namespace}TeamLeagueStanding").each do |node|

    team_id_str = standardize_id_str(node.xpath("#{namespace}Team_Id").text, :team)

    if ["16", "17", "20"].include?(league_id_str)
      competition_group_name = @team_group_map[node.xpath("#{namespace}Team_Id").text]
      competition_group_name = @team_group_map[team_id_str] if competition_group_name.nil?
    else
      competition_group_name = 'domestic_league'
    end

    # Handle shittle situation
    if team_id_str == "579"
      node.xpath("#{namespace}Team").first.content = "Shittle Flounders FC"
    end

    standing += 1
    standing_id_str = standardize_id_str(standing, :standing)
    standing_ids << standing_id_str

    @standingsX[competition_group_name] << {
      standing:        standing,
      team:            node.xpath("#{namespace}Team").text,
      team_id:         team_id_str,
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

    filename = write_nodb_record_json_file({
      rec_type: 'leagues',
      rec_info: "#{league_id_str}-standings-#{standing_id_str}-s1",
      rec: @standingsX[competition_group_name].last,
    })
    @nodb_file_recs << { name: filename, path: 'soccer/nodb', timestamp: `date`.strip, }

  end # teams.each

  # Save json file for handy 'leagues/standings' list
  # (use :rel_type to specify that this is actually a list)
  filename = write_nodb_relation_json_file({
    rel_A:      'leagues',
    rel_B:      'standings',
    rel_info:   'league-standing-ids',
    rel_key_A:  league_id_str,
    rel_keys_B: standing_ids,
    rel_type:   'list',
    jmc:        's1',
  })

end

def transform_driver

  @nodb_file_recs = []

  get_league_ids.each do |league_id|
    transform_league_standings(league_id_str: league_id)
  end


end

transform_driver

