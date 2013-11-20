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
#  Name: download_league_files
#  Desc: get latest relevant files for the specified league
# --------------------------------------------------------------------------------
def download_all_leagues_and_teams_files(options={})

  xmlsoccer_client = options[:client]
  target_dir = options[:target_dir]

  data_file_recs = Array.new
  puts "Initiating download for 'All Leagues' file ..."
  STDOUT.flush
  
  # GetAllLeagues
  xml_file_name = "AllLeagues.xml"
  xml_file = "#{target_dir}/#{xml_file_name}"
  unless File.exist?(xml_file)
    xml_data = xmlsoccer_client.get_all_leagues.body
    save_xml_data(xml_file, xml_data)
  end
  data_file_recs << { name: xml_file_name, path: 'soccer/raw-data', timestamp: `date`.strip }

  # GetAllTeams
  xml_file_name = "AllTeams.xml"
  xml_file = "#{target_dir}/#{xml_file_name}"
  unless File.exist?(xml_file)
    xml_data = xmlsoccer_client.get_all_teams.body
    save_xml_data(xml_file, xml_data)
  end
  data_file_recs << { name: xml_file_name, path: 'soccer/raw-data', timestamp: `date`.strip }

end


# --------------------------------------------------------------------------------
#  Name: download_league_and_season_files
#  Desc: get latest relevant files for the specified league and season
# --------------------------------------------------------------------------------
def download_league_and_season_files(options={})

  league_id = league = options[:league]
  season = options[:season]
  xmlsoccer_client = options[:client]
  target_dir = options[:target_dir]

  league_id_str = league_id.to_i < 10 ? "0#{league_id}" : league_id

  data_file_recs = Array.new
  
  puts "Initiating download for league #{league_id_str}, season #{season} ..."
  STDOUT.flush
  
  # GetAllTeamsByLeagueAndSeason
  xml_file_name = "Teams-league-#{league_id_str}-#{season}.xml"
  xml_file = "#{target_dir}/#{xml_file_name}"
  unless File.exist?(xml_file)
    if ["40","41"].include? league_id_str
      # Handle known bad data - get 'corrected' xml data from production data-store
      xml_data = aws_data_fetch(path: 'soccer/raw-data', name: xml_file_name)
    else
      xml_data = xmlsoccer_client.get_all_teams_by_league_and_season(league, season).body
    end
    save_xml_data(xml_file, xml_data)
  end
  data_file_recs << { name: xml_file_name, path: 'soccer/raw-data', timestamp: `date`.strip }

  # GetFixturesByLeagueAndSeason
  xml_file_name = "Fixtures-league-#{league_id_str}-#{season}.xml"
  xml_file = "#{target_dir}/#{xml_file_name}"
  unless File.exist?(xml_file)
    xml_data = xmlsoccer_client.get_fixtures_by_league_and_season(league, season).body 
    save_xml_data(xml_file, xml_data)
  end
  data_file_recs << { name: xml_file_name, path: 'soccer/raw-data', timestamp: `date`.strip }

  # GetHistoricMatchesByLeagueAndSeason
  xml_file_name = "HistoricMatches-league-#{league_id_str}-#{season}.xml"
  xml_file = "#{target_dir}/#{xml_file_name}"
  unless File.exist?(xml_file)
    xml_data = xmlsoccer_client.get_historic_matches_by_league_and_season(league, season).body 
    save_xml_data(xml_file, xml_data)
  end
  data_file_recs << { name: xml_file_name, path: 'soccer/raw-data', timestamp: `date`.strip }

  # GetLeagueStandingsBySeason
  xml_file_name = "Standings-league-#{league_id_str}-#{season}.xml"
  xml_file = "#{target_dir}/#{xml_file_name}"
  unless File.exist?(xml_file)
    xml_data = xmlsoccer_client.get_league_standings_by_season(league, season).body 
    save_xml_data(xml_file, xml_data)
  end
  data_file_recs << { name: xml_file_name, path: 'soccer/raw-data', timestamp: `date`.strip }

end

# --------------------------------------------------------------------------------
#  Name: download_xmlsoccer_files
#  Desc: get latest relevant files for the specified league and season
# --------------------------------------------------------------------------------
def download_xmlsoccer_files(options={})

  use_ds        = options[:use_ds]        ? options[:use_ds]        : false
  localtest     = options[:localtest]     ? options[:localtest]     : false
  update_league = options[:update_league] ? options[:update_league] : false
  all_leagues   = options[:all_leagues]   ? options[:all_leagues]   : true
  target_dir    = options[:target_dir]    ? options[:target_dir]    : './XML-RAW'

  data_file_recs = Array.new
  
  puts "Setting up client"
  xmlsoccer_client = XMLsoccerHTTP::RequestManager.new({
    api_key: JSON.parse(File.open('xmlsoccer_config.json').read)['api_key'],
    api_type: "Full"
  })

  # GetAllLeagues
  if all_leagues == true
    if update_league == true
      data_file_recs += download_all_leagues_and_teams_files({
        client: xmlsoccer_client, 
        target_dir: target_dir, 
      })
      xml_doc = Nokogiri::XML(open("#{target_dir}/AllLeagues.xml"))
    elsif use_ds == true
      xml_doc = Nokogiri::XML(aws_data_fetch({
        name: 'AllLeagues.xml',
        path: 'soccer/raw-data',
      }))
    elsif localtest == true
      xml_doc = Nokogiri::XML(open("#{target_dir}/AllLeagues.xml"))
    else
      xml_doc = Nokogiri::XML(open("#{target_dir}/AllLeagues.xml"))
    end
    league_ids = xml_doc.xpath("//League/Id").map { |node| node.text }
  else
    # Hard-wire for today's testing
    league_ids = [ 20, 4, 33, 8 ]
  end

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
  write_upload_list_json_file({
    rec_type: 'source',
    rec_info: 'all',
    rec_data: 'xml',
    recs: data_file_recs,
  })

end

download_xmlsoccer_files( localtest: false, update_league: true, use_ds: true )

   
      


















