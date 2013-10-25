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
  league_id = league = options[:league_id].nil? ? 3 : options[:league_id]
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
      Nokogiri::XML(xmlsoccer_client.get_fixtures_by_league_and_season(league_id, season).body)
  else
    puts "Reading local data for all fixtures from 'XML-NEW/Fixtures-league-#{league_id}-#{season}.xml'..."
    fixtures_xml = Nokogiri::XML(File.open("XML-NEW/Fixtures-league-#{league_id}-#{season}.xml"))
  end

  fixture_recs = Array.new
  data_file_recs = Array.new
  league_create_recs = Array.new
  league_update_recs = Array.new

  latest_round = final_round = 0
  
  fixtures_xml.xpath("//Match").each do |node|

    # puts "========= MATCH ID : '#{node.xpath("Id").text}' : LEAGUE : #{league_id} ========="

    # Handle missing 'Time' element (identified in MLS)
    node.add_child("<Time/>") if node.xpath("Time").first.nil?

    # Handle 'Postponed' case: set 'goals' fields to be blank, instead of '0'
    time_x = node.xpath("Time").text
    if time_x == "Postponed"
      node.xpath("HomeGoals").first.content = ''
      node.xpath("AwayGoals").first.content = ''
    end

    # Handle known bad data for Ukranian League stadium (league_id: 40)
    if node.xpath("Location").text == '"Avanhard" Stadium'
      node.xpath("Location").first.content = 'Avanhard Stadium'
    end

    # Add the league_id
    # league_name = node.xpath("League").text
    # league_id = @xmlsoccer_league_map[league_name]
    node.add_child("<League_Id>#{league_id}</League_Id>")

    # Save current and final round information
    round = node.xpath("Round").text
    final_round = round if final_round.to_i < round.to_i
    latest_round = round if latest_round.to_i < round.to_i and time_x == "Finished"

    # Save the XML file for this fixture
    filename = "xmlsoccer-fixture-#{node.xpath("Id").text}.xml"
    File.open("./XML-FILES/fixtures/#{filename}", "w") do |f|
      f.puts "<?xml version=\"1.0\" encoding=\"utf-8\"?>"
      f.puts "<FreeFantasyFootball.Info>"
      f.puts "\t<#{node.name}>"
      node.elements.each do |e|
       f.puts "\t\t#{e}"
      end
      f.puts "\t</#{node.name}>"
      f.puts "</FreeFantasyFootball.Info>"
    end

    # Record array for creating upload (json) file 
    data_file_recs << { name:      filename,
                        path:      'soccer/fixtures',
                        timestamp: `date`.strip
                      }

    # Record array for rake and json files
    fixture_recs << { match_id:     node.xpath("Id").text,
                      date:         node.xpath("Date").text,
                      league:       node.xpath("League").text,
                      league_id:    league_id,
                      round:        round,
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
  File.open("./JSON-FILES/xmlsoccer-fixture-data-files-#{league_id}.json", "w") do |f|
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
  end

  # Save as json file, for whatever purpose...
  File.open("./JSON-FILES/xmlsoccer-fixtures-#{league_id}.json", "w") do |f|
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
  end

  # Or...just create the rake file now - DUH!
  if options[:update].nil? or options[:update] != true

    File.open("./RAKE-FILES/create_f1_fixture_data-#{league_id}.rake", "w") do |f|
      f.puts 'namespace :db do'
      f.puts "\tdesc \"Fill database with fixture data\""
      f.puts "\ttask populate: :environment do"
      f.puts "\t\tif !ENV['create'].nil? and ENV['create'] == 'fixture'"
      fixture_recs.each do |record|
        f.puts "\t\t\tFixture.create!("
        record.each do |k,v|
          f.puts "\t\t\t\t\"#{k}\" => \"#{v}\","
        end
        f.puts "\t\t\t)"
      end
      f.puts "\t\tend\n\tend\nend"
    end

    File.open("./RAKE-FILES/create_f1_league_data-#{league_id}.rake", "w") do |f|
      f.puts 'namespace :db do'
      f.puts "\tdesc \"Fill database with additional league data\""
      f.puts "\ttask populate: :environment do"
      f.puts "\t\tif !ENV['create'].nil? and ENV['create'] == 'league'"
      f.puts "\t\t\tid = League.find_by(league_id: #{league_id})"
      f.puts "\t\t\tLeague.update("
      f.puts "\t\t\t\tid,"
      f.puts "\t\t\t\t\"final_round\" => \"#{final_round}\","
      f.puts "\t\t\t)"
      f.puts "\t\tend\n\tend\nend"
    end

  else

    File.open("./RAKE-FILES/update_f1_fixture_data-#{league_id}.rake", "w") do |f|
      f.puts 'namespace :db do'
      f.puts "\tdesc \"Update database with fixture data\""
      f.puts "\ttask populate: :environment do"
      f.puts "\t\tif !ENV['update'].nil? and ENV['update'] == 'fixture'"
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
    end

    File.open("./RAKE-FILES/update_f1_league_data-#{league_id}.rake", "w") do |f|
      f.puts 'namespace :db do'
      f.puts "\tdesc \"Update database with additional league data\""
      f.puts "\ttask populate: :environment do"
      f.puts "\t\tif !ENV['update'].nil? and ENV['update'] == 'league'"
      f.puts "\t\t\tid = League.find_by(league_id: #{league_id})"
      f.puts "\t\t\tLeague.update("
      f.puts "\t\t\t\tid,"
      f.puts "\t\t\t\t{"
      f.puts "\t\t\t\t\t\"latest_round\" => \"#{latest_round}\","
      f.puts "\t\t\t\t\t\"final_round\" => \"#{final_round}\","
      f.puts "\t\t\t\t},"
      f.puts "\t\t\t)"
      f.puts "\t\tend\n\tend\nend"
    end

  end

  

end

def transform_driver

  xml_doc = Nokogiri::XML(open("./XML/AllLeagues.xml"))
  league_ids = xml_doc.xpath("//League/Id").map { |node| node.text }

  league_ids.each do |league_id|
    transform_fixtures(league_id: league_id, season: '1314', localtest: true, update: false)
    transform_fixtures(league_id: league_id, season: '1314', localtest: true, update: true)
  end

end

transform_driver
# transform_fixtures(league_id: 20, season: '1314', localtest: true, update: false)

# # options { :league_id, :season, :localtest, :update }
# transform_fixtures(localtest: true, update: false)
# transform_fixtures(localtest: true, update: true)

