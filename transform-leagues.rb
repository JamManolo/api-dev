#!/Users/jimcar/.rvm/rubies/ruby-2.0.0-p247/bin/ruby -w
#coding:utf-8

require 'net/https'
require "rubygems"
require "json"
require "uri"
require "Nokogiri"
require "./mygem/xmlsoccerhttp/lib/xmlsoccerhttp"

# ---------------------------------------------------
#  Name: transform_leagues
#  Desc: cleanup xmlsoccer.xml 
# ---------------------------------------------------
def transform_leagues(options={})

  localtest = (options[:localtest].nil? or options[:localtest] != true) ? false : true

  unless localtest == true
    puts "Setting up client"
    xmlsoccer_client = XMLsoccerHTTP::RequestManager.new({
      api_key: JSON.parse(File.open('xmlsoccer_config.json').read)['api_key'],
      api_type: "Demo"
    })
    puts "Requesting data for all leagues ..."
    STDOUT.flush
    leagues_xml = Nokogiri::XML(xmlsoccer_client.get_all_leagues.body)
  else
    puts "Reading local data for all leagues ..."
    leagues_xml = Nokogiri::XML(File.open("XML/AllLeagues.xml"))
  end

  data_file_recs = Array.new
  
  leagues_xml.xpath("//League").each do |node|

    # Save the XML file for this league
    filename = "xmlsoccer-league-#{node.xpath("Id").text}.xml"
    f = File.open("./FILES/#{filename}", "w")
    f.puts "<?xml version=\"1.0\" encoding=\"utf-8\"?>"
    f.puts "<FreeFantasyFootball.Info>"
    f.puts "\t<#{node.name}>"
    node.elements.each do |e|
     f.puts "\t\t#{e}"
    end
    f.puts "\t</#{node.name}>"
    f.puts "</FreeFantasyFootball.Info>"
    f.close

    data_file_recs << { league_id:         node.xpath("Id").text,
                        name:              node.xpath("Name").text,
                        country:           node.xpath("Country").text,
                        historical_data:   node.xpath("Historical_Data").text,
                        fixtures:          node.xpath("Fixtures").text,
                        livescore:         node.xpath("Livescore").text,
                        number_of_matches: node.xpath("NumberOfMatches").text,
                        latest_match_date: node.xpath("LatestMatch").text,
                        data_file_id:      0
                      } 
  end

  # Save as json file, for whatever purpose...
  f = File.open("./FILES/xmlsoccer-league-db-info.json", "w")
  f.puts '{ "items": ['
  data_file_recs.each do |record|
    f.puts '{'
    record.each do |k,v|
      my_comma = k == :data_file_id ? '' : ','
      f.puts "\"#{k}\":\"#{v}\"#{my_comma}"
    end
    my_comma = record == data_file_recs.last ? '' : ','
    f.puts "}#{my_comma}"
  end
  f.puts '] }'
  f.close

  # Or...just create the rake file now - DUH!
  f = File.open("./FILES/xxleague_data.rake", "w")
  f.puts 'namespace :db do'
  f.puts "\tdesc \"Fill database with file data\""
  f.puts "\ttask populate: :environment do"
  data_file_recs.each do |record|
    f.puts "\t\tLeague.create!("
    record.each do |k,v|
      f.puts "\t\t\t\"#{k}\" => \"#{v}\","
    end
    f.puts "\t\t)"
  end
  f.puts "\tend\nend"
  f.close

end

transform_leagues(localtest: true)

