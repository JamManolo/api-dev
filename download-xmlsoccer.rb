#!/Users/jimcar/.rvm/rubies/ruby-2.0.0-p247/bin/ruby -w
#coding:utf-8

require 'net/https'
require "rubygems"
require "json"
require "uri"
require "nokogiri"
require "./mygem/xmlsoccerhttp/lib/xmlsoccerhttp"


# --------------------------------------------------------------------------------
#  Name: save_xml_data
# --------------------------------------------------------------------------------
def save_xml_data(xml_file, xml_data)
  puts "writing xml doc to '#{xml_file}'"
  open( xml_file, "w" ) do |f|
    f.puts xml_data 
  end
  puts "done"
end

# --------------------------------------------------------------------------------
#  Name: download_league_and_season_files
#  Desc: get latest relevant files for the specified league and season
# --------------------------------------------------------------------------------
def download_league_and_season_files(options={})

  league = options[:league]
  season = options[:season]
  xmlsoccer_client = options[:client]

  
  puts "Initiating download for league #{league}, season #{season} ..."
  STDOUT.flush
  
  # GetAllTeamsByLeagueAndSeason
  xml_file = "./XML-NEW/Teams-league-#{league}-#{season}.xml"
  unless File.exist?(xml_file)
    xml_data = xmlsoccer_client.get_all_teams_by_league_and_season(league, season).body
    save_xml_data(xml_file, xml_data)
  end

  # GetFixturesByLeagueAndSeason
  xml_file = "./XML-NEW/Fixtures-league-#{league}-#{season}.xml"
  unless File.exist?(xml_file)
    xml_data = xmlsoccer_client.get_fixtures_by_league_and_season(league, season).body 
    save_xml_data(xml_file, xml_data)
  end

  # GetHistoricMatchesByLeagueAndSeason
  xml_file = "./XML-NEW/HistoricMatches-league-#{league}-#{season}.xml"
  unless File.exist?(xml_file)
    xml_data = xmlsoccer_client.get_historic_matches_by_league_and_season(league, season).body 
    save_xml_data(xml_file, xml_data)
  end

  # GetLeagueStandingsBySeason
  xml_file = "./XML-NEW/Standings-league-#{league}-#{season}.xml"
  unless File.exist?(xml_file)
    xml_data = xmlsoccer_client.get_league_standings_by_season(league, season).body 
    save_xml_data(xml_file, xml_data)
  end

end

# --------------------------------------------------------------------------------
#  Name: download_xmlsoccer_files
#  Desc: get latest relevant files for the specified league and season
# --------------------------------------------------------------------------------
def download_xmlsoccer_files
  
  puts "Setting up client"
  xmlsoccer_client = XMLsoccerHTTP::RequestManager.new({
    api_key: JSON.parse(File.open('xmlsoccer_config.json').read)['api_key'],
    api_type: "Full"
  })

  # GetAllLeagues
  if false
    xml_file = "./XML/AllLeagues.xml"
    xml_doc = Nokogiri::XML(open(xml_file))
    league_ids = xml_doc.xpath("//League/Id").map { |node| node.text }
  else
    # Hard-wire for today's testing
    league_ids = [ 40, 41 ]
  end

  league_ids.each do |league_id|
    download_league_and_season_files({
      client: xmlsoccer_client, league: league_id, season: '1314'
    })
    sleep 15
  end

end

download_xmlsoccer_files

   
      


















