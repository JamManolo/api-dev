#!/Users/jimcar/.rvm/rubies/ruby-2.0.0-p247/bin/ruby -w
#coding:utf-8

require 'net/https'
require "rubygems"
require "json"
require "uri"
require "nokogiri"
require "./mygem/xmlsoccerhttp/lib/xmlsoccerhttp"
require "./transform-utils"


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
  target_dir = options[:target_dir]

  data_file_recs = Array.new
  
  puts "Initiating download for league #{league}, season #{season} ..."
  STDOUT.flush
  
  # GetAllTeamsByLeagueAndSeason
  xml_file = "#{target_dir}/Teams-league-#{league}-#{season}.xml"
  unless File.exist?(xml_file)
    xml_data = xmlsoccer_client.get_all_teams_by_league_and_season(league, season).body
    save_xml_data(xml_file, xml_data)
  end
  data_file_recs << { name: xml_file, path: 'soccer/raw-data', timestamp: `date`.strip }

  # GetFixturesByLeagueAndSeason
  xml_file = "#{target_dir}/Fixtures-league-#{league}-#{season}.xml"
  unless File.exist?(xml_file)
    xml_data = xmlsoccer_client.get_fixtures_by_league_and_season(league, season).body 
    save_xml_data(xml_file, xml_data)
  end
  data_file_recs << { name: xml_file, path: 'soccer/raw-data', timestamp: `date`.strip }

  # GetHistoricMatchesByLeagueAndSeason
  xml_file = "#{target_dir}/HistoricMatches-league-#{league}-#{season}.xml"
  unless File.exist?(xml_file)
    xml_data = xmlsoccer_client.get_historic_matches_by_league_and_season(league, season).body 
    save_xml_data(xml_file, xml_data)
  end
  data_file_recs << { name: xml_file, path: 'soccer/raw-data', timestamp: `date`.strip }

  # GetLeagueStandingsBySeason
  xml_file = "#{target_dir}/Standings-league-#{league}-#{season}.xml"
  unless File.exist?(xml_file)
    xml_data = xmlsoccer_client.get_league_standings_by_season(league, season).body 
    save_xml_data(xml_file, xml_data)
  end
  data_file_recs << { name: xml_file, path: 'soccer/raw-data', timestamp: `date`.strip }

end

# --------------------------------------------------------------------------------
#  Name: download_xmlsoccer_files
#  Desc: get latest relevant files for the specified league and season
# --------------------------------------------------------------------------------
def download_xmlsoccer_files(options={})

  localtest     = options[:localtest]     ? options[:localtest]     : true
  update_league = options[:update_league] ? options[:update_league] : false
  all_leagues   = options[:all_leagues]   ? options[:all_leagues]   : true
  target_dir    = options[:target_dir]    ? options[:target_dir]    : './XML-TEST'
  
  puts "Setting up client"
  xmlsoccer_client = XMLsoccerHTTP::RequestManager.new({
    api_key: JSON.parse(File.open('xmlsoccer_config.json').read)['api_key'],
    api_type: "Full"
  })

  # GetAllLeagues
  if get_all_leagues == true
    if localtest == true
      xml_doc = Nokogiri::XML(open("./XML/AllLeagues.xml"))
    elsif update_league == true
      xml_doc = Nokogiri::XML(xmlsoccer_client.get_all_leagues.body)
    else # get raw data from production data store
      # xml_doc = Nokogiri::XML(open(aws_data_fetch({
      #   name: 'AllLeagues.xml',
      #   path: 'soccer/raw-data',
      # })))
    end
    league_ids = xml_doc.xpath("//League/Id").map { |node| node.text }
  else
    # Hard-wire for today's testing
    league_ids = [ 20, 4, 33, 8 ]
  end

  data_file_recs = Array.new

  league_ids.each do |league_id|
    # Skip 'empty' leagues
    next if ["15", "34"].include? league_id.to_s
    data_file_recs += download_league_and_season_files({
      client: xmlsoccer_client, 
      league: league_id,
      season: '1314',
      target_dir: target_dir,  
    })
    # sleep 15
  end

  # Create json file to facilitate upload to data-store
  write_data_file_json_file({
    rec_type: 'raw-source',
    rec_info: 'all',
    recs: data_file_recs,
  })

end

download_xmlsoccer_files

   
      


















