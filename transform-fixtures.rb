#!/Users/jimcar/.rvm/rubies/ruby-2.0.0-p247/bin/ruby -w
#coding:utf-8

require 'net/https'
require "rubygems"
require "json"
require "uri"
require "Nokogiri"
require "./mygem/xmlsoccerhttp/lib/xmlsoccerhttp"
require './xmlsoccer-league-map'

# ---------------------------------------------------
#  Name: transform_fixtures
#  Desc: cleanup xmlsoccer.xml 
# ---------------------------------------------------
def transform_fixtures(options={})

  localtest = (options[:localtest].nil? or options[:localtest] != true) ? false : true
  league = options[:league_id].nil? ? 3 : options[:league_id]
  season = options[:season].nil? ? '1314' : options[:season]

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
    puts "Reading local data for all fixtures from 'XML-NEW/Fixtures-league-#{league}-#{season}.xml'..."
    fixtures_xml = Nokogiri::XML(File.open("XML-NEW/Fixtures-league-#{league}-#{season}.xml"))
  end

  fixture_recs = Array.new
  data_file_recs = Array.new
  
  fixtures_xml.xpath("//Match").each do |node|

    # Handle 'Postponed' case: set 'goals' fields to be blank, instead of '0'
    time_x = node.xpath("Time").text
    if time_x == "Postponed"
      node.xpath("HomeGoals").first.content = ''
      node.xpath("AwayGoals").first.content = ''
    end

    # Handle known bad data for Ukranian League stadium
    if node.xpath("Location").text == '"Avanhard" Stadium'
      node.xpath("Location").first.content = 'Avanhard Stadium'
    end

    # Handle missing 'Time' element (identified in MLS)
    node.add_child("<Time/>") if node.xpath("Time").first.nil?

    # Add the league_id
    league_name = node.xpath("League").text
    league_id = @xmlsoccer_league_map[league_name]
    node.add_child("<League_Id>#{league_id}</League_Id>")

    # Save the XML file for this fixture
    filename = "xmlsoccer-fixture-#{node.xpath("Id").text}.xml"
    f = File.open("./XML-FILES/fixtures/#{filename}", "w")
    f.puts "<?xml version=\"1.0\" encoding=\"utf-8\"?>"
    f.puts "<FreeFantasyFootball.Info>"
    f.puts "\t<#{node.name}>"
    node.elements.each do |e|
     f.puts "\t\t#{e}"
    end
    f.puts "\t</#{node.name}>"
    f.puts "</FreeFantasyFootball.Info>"
    f.close

    # Record array for creating upload (json) file 
    data_file_recs << { name:      filename,
                        path:      'soccer/fixtures',
                        timestamp: `date`.strip
                      }

    # Record array for rake and json files
    fixture_recs << { match_id:     node.xpath("Id").text,
                      date:         node.xpath("Date").text,
                      league:       league_name,
                      league_id:    league_id,
                      round:        node.xpath("Round").text,
                      home_team:    node.xpath("HomeTeam").text,
                      home_team_id: node.xpath("HomeTeam_Id").text,
                      home_goals:   node.xpath("HomeGoals").text,
                      away_team:    node.xpath("AwayTeam").text,
                      away_team_id: node.xpath("AwayTeam_Id").text,
                      away_goals:   node.xpath("AwayGoals").text,
                      location:     node.xpath("Location").text,
                      time_x:       time_x,
                      report_id:    0
                    }

    
  end

  # Save as json file for easy upload to data store...
  f = File.open("./JSON-FILES/xmlsoccer-fixture-data-files-#{league}.json", "w")
  f.puts '{ "fixture-data-files": ['
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
  f = File.open("./JSON-FILES/xmlsoccer-fixtures-#{league}.json", "w")
  f.puts '{ "fixtures": ['
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
  if options[:update].nil? or options[:update] != true
    f = File.open("./RAKE-FILES/fixture_data-#{league}.rake", "w")
    f.puts 'namespace :db do'
    f.puts "\tdesc \"Fill database with fixture data\""
    f.puts "\ttask populate: :environment do"
    f.puts "\t\tif ENV['update'].nil?"
    fixture_recs.each do |record|
      f.puts "\t\t\tFixture.create!("
      record.each do |k,v|
        f.puts "\t\t\t\t\"#{k}\" => \"#{v}\","
      end
      f.puts "\t\t\t)"
    end
    f.puts "\t\tend\n\tend\nend"
    f.close
  else
    f = File.open("./RAKE-FILES/update_1_fixture_data-#{league}.rake", "w")
    f.puts 'namespace :db do'
    f.puts "\tdesc \"Update database with fixture data\""
    f.puts "\ttask populate: :environment do"
    f.puts "\t\tif !ENV['update'].nil? and ENV['update'] == 'fixture1'"
    fixture_recs.each do |record|
      next if record[:time_x] == ""
      f.puts "\t\t\tid = Fixture.find_by(match_id: #{record[:match_id]})"
      f.puts "\t\t\tFixture.update("
      f.puts "\t\t\t\tid,"
      f.puts "\t\t\t\t{"
      f.puts "\t\t\t\t\t\"home_goals\" => \"#{record[:home_goals]}\","
      f.puts "\t\t\t\t\t\"away_goals\" => \"#{record[:away_goals]}\","
      f.puts "\t\t\t\t\t\"time_x\" => \"#{record[:time_x]}\","
      f.puts "\t\t\t\t}"
      f.puts "\t\t\t)"
    end
    f.puts "\t\tend\n\tend\nend"
    f.close
  end

end

def transform_driver

  xml_doc = Nokogiri::XML(open("./XML/AllLeagues.xml"))
  league_ids = xml_doc.xpath("//League/Id").map { |node| node.text }

  league_ids.each do |league_id|
    puts "league_id = '#{league_id}'"
    transform_fixtures(league_id: league_id, season: '1314', localtest: true, update: false)
  end

end

transform_driver
# transform_fixtures(league_id: 20, season: '1314', localtest: true, update: false)

# # options { :league_id, :season, :localtest, :update }
# transform_fixtures(localtest: true, update: false)
# transform_fixtures(localtest: true, update: true)

