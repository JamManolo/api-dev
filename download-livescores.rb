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
def download_livescore_file(options={})

  league = options[:league]
  season = options[:season]
  xmlsoccer_client = options[:client]

  
  puts "Initiating livescore download for league #{league}, season #{season} ..."
  STDOUT.flush

  league_id_str = league.to_i < 10 ? "0#{league}" : league
  
  # GetLiveScoreByLeague
  xml_file = "./XML-NEW/LiveScore-league-#{league_id_str}-#{season}.xml"
  unless File.exist?(xml_file)
    xml_data = xmlsoccer_client.get_live_score_by_league(league).body
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
    league_ids = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ,14, 17, 18, 19, 20, 33, 36, 37, 38, 39, 40, 41]
  end

  (701..705).each do |idx|
    league_ids.each do |league_id|
      download_livescore_file({
        client: xmlsoccer_client, league: league_id, season: idx,
      })
      sleep 15
    end
  end

end

download_xmlsoccer_files
