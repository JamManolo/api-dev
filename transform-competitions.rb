#!/Users/jimcar/.rvm/rubies/ruby-2.0.0-p247/bin/ruby -w
#coding:utf-8

require 'net/https'
require "rubygems"
require "json"
require "uri"
require "Nokogiri"
require "./mygem/xmlsoccerhttp/lib/xmlsoccerhttp"
require './xmlsoccer-league-map'
require './transform-utils'
require './transform-groups'

# ---------------------------------------------------
#  Name: transform_fixtures
#  Desc: cleanup xmlsoccer.xml 
# ---------------------------------------------------
def transform_fixtures(options={})

  use_ds    = options[:use_ds]    ? options[:use_ds]    : false
  localtest = options[:localtest] ? options[:localtest] : false
  season    = options[:season]    ? options[:season]    : '1314' 
  src_dir   = options[:src_dir]   ? options[:src_dir]   : 'XML'
  league_id = league_id_str = options[:league_id] ? options[:league_id] :3

  league_id_str = "0#{league_id_str}" if league_id.to_i < 10

  if use_ds == true
      puts "Fetching 'Fixtures by League' info from production data store ..."
      fixtures_xml = Nokogiri::XML(aws_data_fetch({
        name: "Fixtures-league-#{league_id_str}-#{season}.xml",
        path: 'soccer/raw-data',
      }))
  elsif localtest == true
    puts "Reading local data for all fixtures from '#{src_dir}/Fixtures-league-#{league_id_str}-#{season}.xml'..."
    fixtures_xml = Nokogiri::XML(File.open("#{src_dir}/Fixtures-league-#{league_id_str}-#{season}.xml"))
  else
    puts "Setting up client"
    xmlsoccer_client = XMLsoccerHTTP::RequestManager.new({
      api_key: JSON.parse(File.open('xmlsoccer_config.json').read)['api_key'],
      api_type: "Demo"
    })
    puts "Requesting data for all fixtures ..."
    STDOUT.flush
    fixtures_xml = 
      Nokogiri::XML(xmlsoccer_client.get_fixtures_by_league_and_season(league_id, season).body)
  end

  fixture_recs = Array.new
  data_file_recs = Array.new
  league_create_recs = Array.new
  # league_update_recs = Array.new
  fixture_update_recs = Array.new

  # Competitions groups
  group_map = create_group_map(league_id: league_id, xml: fixtures_xml) if [16, 17].include? league_id
  puts group_map
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

    # For competition leagues, use the (unused) 'Round' column for 'Group' name
    home_team_id = node.xpath("HomeTeam_Id").text
    node.add_child("<Round>#{group_map[home_team_id.to_s]}</Round>") if [16, 17].include? league_id

    # Handle shittle situation
    if league_id == "20"
      if home_team_id == "579"
        node.xpath("HomeTeam").first.content = 'Shittle Flounders FC'
      elsif node.xpath("AwayTeam_Id").text == "579"
        node.xpath("AwayTeam").first.content = 'Shittle Flounders FC'
      end
    end 

    # Save the XML file for this fixture
    filename = write_xml_file({
      group: 'fixture',
      group_info: node.xpath("Id").text,
      node: node,
    })

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

    fixture_update_recs << {
      match_id:     node.xpath("Id").text,
      home_goals:   node.xpath("HomeGoals").text,
      away_goals:   node.xpath("AwayGoals").text,
      time_x:       time_x,
    }

    league_create_recs << {
      match_id:    node.xpath("Id").text,
      final_round: final_round,
    }

  end # end fixtures.each

  # Save json file for easy upload of xml files to data store...
  write_data_file_json_file({
    rec_type: 'fixture',
    rec_data: 'xml',
    rec_info: league_id_str,
    recs: data_file_recs,
  })

  # Save as json file, for ... noDB
  filename = write_records_json_file({
    rec_type: 'fixtures',
    rec_info: "#{league_id_str}-create-f1",
    recs: fixture_recs,
  })
  @nodb_file_recs << { name: filename, path: 'soccer/nodb', timestamp: `date`.strip, }

  filename = write_records_json_file({
    rec_type: 'leagues',
    rec_info: "#{league_id_str}-create-f1",
    recs: [ league_id: league_id, final_round: final_round ]
  })
  @nodb_file_recs << { name: filename, path: 'soccer/nodb', timestamp: `date`.strip, }

  filename = write_records_json_file({
    rec_type: 'fixtures',
    rec_info: "#{league_id_str}-update-f1",
    recs: fixture_update_recs,
  })
  @nodb_file_recs << { name: filename, path: 'soccer/nodb', timestamp: `date`.strip, }

  filename = write_records_json_file({
    rec_type: 'leagues',
    rec_info: "#{league_id_str}-update-f1",
    recs: [ league_id: league_id, latest_round: latest_round ]
  })
  @nodb_file_recs << { name: filename, path: 'soccer/nodb', timestamp: `date`.strip, }

  # # Or...just create the rake file now - DUH!
  # if options[:update].nil? or options[:update] != true

    write_create_records_rake_file({
      rec_class: 'Fixture',
      rec_type: 'fixture',
      desc: 'Fill database with fixture data',
      recs: fixture_recs,
      jmc: 'f1',
      ext: league_id_str,
    })

    # Crossbreed rake file, so don't have write util. The update-league-table action happens
    # immediately after create-league-table, thanks to the magic of alphabetic ordering.
    # (rake executes create_a1_league_data-00.rake, then create_f1_league_data-00.rake) 
    # 
    File.open("./RAKE-FILES/create_f1_league_data-#{league_id_str}.rake", "w") do |f|
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
  # else
    write_update_records_rake_file({
      rec_class: 'Fixture',
      rec_type: 'fixture',
      rec_key: 'match_id',
      desc: 'Update database with fixture data',
      recs: fixture_update_recs,
      jmc: 'f1',
      ext: league_id_str,
    })

    write_update_records_rake_file({
      rec_class: 'League',
      rec_type: 'league',
      rec_key: 'league_id',
      desc: 'Update database with additional league data',
      recs: [ league_id: league_id, latest_round: latest_round ],
      jmc: 'f1',
      ext: league_id_str,
    })
  # end

end

def transform_driver

  @nodb_file_recs = Array.new

  xml_doc = Nokogiri::XML(open("./XML/AllLeagues.xml"))
  league_ids = xml_doc.xpath("//League/Id").map { |node| node.text }

  league_ids.each do |league_id|
    next if ["15","34"].include? league_id
    transform_fixtures(league_id: league_id, season: '1314',
                       localtest: true, use_ds: true,
                       update: false, src_dir: 'XML-RAW')
    # transform_fixtures(league_id: league_id, season: '1314', localtest: true, update: true, src_dir: 'XML-RAW')
  end

  # Save json file for easy upload to noDB data store...
  write_data_file_json_file({
    rec_type: "fixture",
    rec_info: 'all',
    rec_data: 'nodb',
    recs: @nodb_file_recs
  })

end

transform_driver



