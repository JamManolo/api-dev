#!/Users/jimcar/.rvm/rubies/ruby-2.0.0-p247/bin/ruby -w
#coding:utf-8

require 'net/https'
require "rubygems"
require "json"
require "uri"
require "Nokogiri"
require "./mygem/xmlsoccerhttp/lib/xmlsoccerhttp"

# ---------------------------------------------------
#  Name: transform_fixtures
#  Desc: cleanup xmlsoccer.xml 
# ---------------------------------------------------
def transform_fixtures(options={})

  localtest = (options[:localtest].nil? or options[:localtest] != true) ? false : true
  league = options[:league_id].nil? ? 3 : options[:league_id]
  season = '1314'

  unless localtest == true
    puts "Setting up client"
    xmlsoccer_client = XMLsoccerHTTP::RequestManager.new({
      api_key: JSON.parse(File.open('xmlsoccer_config.json').read)['api_key'],
      api_type: "Demo"
    })
    puts "Requesting data for all fixtures ..."
    STDOUT.flush
    fixtures_xml = 
      Nokogiri::XML(xmlsoccer_client.get_fixtures_by_league_and_season(league, season).body)
  else
    puts "Reading local data for all fixtures ..."
    fixtures_xml = Nokogiri::XML(File.open("XML/Fixtures-league#{league}-#{season}.xml"))
  end

  fixture_recs = Array.new
  data_file_recs = Array.new
  
  fixtures_xml.xpath("//Match").each do |node|

    # Save the XML file for this fixture
    filename = "xmlsoccer-fixture-#{node.xpath("Id").text}.xml"
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

    fixture_recs << { match_id:     node.xpath("Id").text,
                      date:         node.xpath("Date").text,
                      league:       node.xpath("League").text,
                      round:        node.xpath("Round").text,
                      home_team:    node.xpath("HomeTeam").text,
                      home_team_id: node.xpath("HomeTeam_Id").text,
                      away_team:    node.xpath("AwayTeam").text,
                      away_team_id: node.xpath("AwayTeam_Id").text,
                      location:     node.xpath("Location").text,
                      report_id:    0
                    }

    data_file_recs << { name:      filename,
                        path:      'soccer/matches',
                        timestamp: `date`.strip
                      }
  end

  # Save as json file, for whatever purpose...
  f = File.open("./FILES/xmlsoccer-fixture-db-info.json", "w")
  f.puts '{ "items": ['
  data_file_recs.each do |record|
    f.puts '{'
    record.each do |k,v|
      my_comma = k == :timestamp ? '' : ','
      f.puts "\"#{k}\":\"#{v}\"#{my_comma}"
    end
    my_comma = record == data_file_recs.last ? '' : ','
    f.puts "}#{my_comma}"
  end
  f.puts '] }'
  f.close

  # Save as json file, for whatever purpose...
  f = File.open("./FILES/xmlsoccer-fixtures.json", "w")
  f.puts '{ "items": ['
  fixture_recs.each do |record|
    f.puts '{'
    record.each do |k,v|
      my_comma = k == :report_id ? '' : ','
      f.puts "\"#{k}\":\"#{v}\"#{my_comma}"
    end
    my_comma = record == fixture_recs.last ? '' : ','
    f.puts "}#{my_comma}"
  end
  f.puts '] }'
  f.close

  # Or...just create the rake file now - DUH!
  f = File.open("./FILES/xxfixture_data.rake", "w")
  f.puts 'namespace :db do'
  f.puts "\tdesc \"Fill database with file data\""
  f.puts "\ttask populate: :environment do"
  fixture_recs.each do |record|
    f.puts "\t\tFixture.create!("
    record.each do |k,v|
      f.puts "\t\t\t\"#{k}\" => \"#{v}\","
    end
    f.puts "\t\t)"
  end
  f.puts "\tend\nend"
  f.close

end

transform_fixtures(localtest: true)

