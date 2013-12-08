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

  season    = options[:season]    ? options[:season]    : '1314' 
  league_id = options[:league_id] ? options[:league_id] :3

  league_id_str = standardize_id_str(league_id, :league)

  puts "Fetching 'Fixtures by League' info for league #{league_id_str} from production data store ..."
  fixtures_xml = Nokogiri::XML(aws_data_fetch({
    name: "Fixtures-league-#{league_id_str}-#{season}.xml",
    path: 'soccer/raw-data',
  }))

  puts "Fetching 'Results by League' info for league #{league_id_str} from production data store ..."
  report_xml = Nokogiri::XML(aws_data_fetch({
    name: "HistoricMatches-league-#{league_id_str}-#{season}.xml",
    path: 'soccer/raw-data',
  }))
  report_ids = report_xml.xpath("//Match/FixtureMatch_Id").map{ |node| node.text }

  fixture_recs = Array.new
  data_file_recs = Array.new
  league_create_recs = Array.new
  fixture_update_recs = Array.new
  league_fixture_ids = Array.new

  # Competitions groups
  group_map = create_group_map(league_id: league_id, xml: fixtures_xml) if [16, 17].include? league_id
  puts group_map
  latest_round = final_round = 0

  fixtures_xml.xpath("//Match").each do |node|

    # puts "========= MATCH ID : '#{node.xpath("Id").text}' : LEAGUE : #{league_id} ========="

    # Add this fixture to all-fixtures list
    fixture_id_str = standardize_id_str(node.xpath("Id").text, :fixture)
    @all_fixture_ids << fixture_id_str

    # Add this fixture to list for this league
    league_fixture_ids << fixture_id_str

    # Add this fixture to lists for both the home and away teams
    ["Home","Away"].each do |team|
      team_id_str = standardize_id_str(node.xpath("#{team}Team_Id").text, :team)
      @all_team_ids << team_id_str
      @team_fixture_ids[team_id_str] = Array.new unless @team_fixture_ids[team_id_str]
      @team_fixture_ids[team_id_str] << fixture_id_str
    end

    # Add report_id for fixtures that have reports
    report_id = (report_ids.include? fixture_id_str) ? fixture_id_str : 0

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

    # Add XML file to the array for creating upload file list
    data_file_recs << { name:      filename,
                        path:      'soccer/fixtures',
                        timestamp: `date`.strip
                      }

    # Add record to the array for creating rake and json files
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
                      report_id:    report_id,
                    }

    # JMC-CREATE: Save this record as json file, for populating noDB
    filename = write_nodb_record_json_file({
      rec_type: 'fixtures',
      rec_info: "#{fixture_id_str}-create-f1",
      rec: fixture_recs.last,
    })
    @nodb_file_recs << { name: filename, path: 'soccer/nodb', timestamp: `date`.strip, }

    # JMC-UPDATE: Add to array used to update Fixtures record (after fixtures that been played)
    fixture_update_recs << {
      match_id:     node.xpath("Id").text,
      home_goals:   node.xpath("HomeGoals").text,
      away_goals:   node.xpath("AwayGoals").text,
      time_x:       time_x,
    }

    # JMC-CREATE: Add to array used to update Leagues record with final_found
    league_create_recs << {
      match_id:    node.xpath("Id").text,
      final_round: final_round,
    }

  end # end fixtures.each

  # JMC-UPLOAD: Save json file for easy upload of xml files to data store...
  write_upload_list_json_file({
    rec_type: 'fixture',
    rec_data: 'xml',
    rec_info: league_id_str,
    recs: data_file_recs,
  })

  # JMC-CREATE-NOT-USED: Save all league/fixture records in a json fmt, potentially for noDB
  filename = write_record_array_json_file({
    rec_type: 'fixtures',
    rec_info: "#{league_id_str}-create-f1",
    recs: fixture_recs,
  })
  @nodb_file_recs << { name: filename, path: 'soccer/nodb', timestamp: `date`.strip, }

  # JMC-CREATE: Leagues-update record - but only needed ONCE, along with Fixtures create
  filename = write_record_array_json_file({
    rec_type: 'leagues',
    rec_info: "#{league_id_str}-create-f1",
    recs: [ league_id: league_id, final_round: final_round ]
  })
  @nodb_file_recs << { name: filename, path: 'soccer/nodb', timestamp: `date`.strip, }

  # JMC-UPDATE-TBD: Fixtures-update record, to be used by noDB update mechanism
  filename = write_record_array_json_file({
    rec_type: 'fixtures',
    rec_info: "#{league_id_str}-update-f1",
    recs: fixture_update_recs,
  })
  @nodb_file_recs << { name: filename, path: 'soccer/nodb', timestamp: `date`.strip, }

  # JMC-UPDATE-TBD: Update Leagues record, repeat as needed
  filename = write_record_array_json_file({
    rec_type: 'leagues',
    rec_info: "#{league_id_str}-update-f1",
    recs: [ league_id: league_id, latest_round: latest_round ]
  })
  @nodb_file_recs << { name: filename, path: 'soccer/nodb', timestamp: `date`.strip, }

  # JMC-CREATE: Initialize Leagues record
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
  # JMC-CREATE: Leagues-update record - but only needed ONCE, along with Fixtures create
  File.open("./RAKE-FILES/create_f1_league_data-#{league_id_str}.rake", "w") do |f|
    f.puts 'namespace :db do'
    f.puts "\tdesc \"Fill database with additional league data\""
    f.puts "\ttask populate: :environment do"
    f.puts "\t\tif !ENV['create'].nil? and ENV['create'] == 'league'"
    f.puts "\t\t\tid = League.find_by(league_id: #{league_id.to_i})"
    f.puts "\t\t\tLeague.update("
    f.puts "\t\t\t\tid,"
    f.puts "\t\t\t\t\"final_round\" => \"#{final_round}\","
    f.puts "\t\t\t)"
    f.puts "\t\tend\n\tend\nend"
  end

  # JMC-UPDATE: Fixtures-update record (with the league_id_str)
  write_update_records_rake_file({
    rec_class: 'Fixture',
    rec_type: 'fixture',
    rec_key: 'match_id',
    desc: 'Update database with fixture data',
    recs: fixture_update_recs,
    jmc: 'f1',
    ext: league_id_str,
  })

  # JMC-UPDATE: Leagues-update record (add the latest_round)
  #             only needed ONCE, along with Fixtures create
  write_update_records_rake_file({
    rec_class: 'League',
    rec_type: 'league',
    rec_key: 'league_id',
    desc: 'Update database with additional league data',
    recs: [ league_id: league_id, latest_round: latest_round ],
    jmc: 'f1',
    ext: league_id_str,
  })

  # JMC-CREATE: Save json file for creating league/fixtures relationship
  filename = write_nodb_relation_json_file({
    rel_A:     'leagues',
    rel_B:     'fixtures',
    rel_info:  'league-fixture-ids',
    rel_key_A:  league_id_str,
    rel_keys_B: league_fixture_ids.sort,
    jmc:        'f1',
  })
  @nodb_file_recs << { name: filename, path: 'soccer/nodb', timestamp: `date`.strip, }

end

# ---------------------------------------------------
#  Name: team_fixtures_relatonship
#  Desc: 
# ---------------------------------------------------
def team_fixtures_relationship

  # JMC-CREATE: Save json file for creating team/fixtures relationship
  @all_team_ids.sort.uniq.each do |team_id|
    filename = write_nodb_relation_json_file({
      rel_A:     'teams',
      rel_B:     'fixtures',
      rel_info:  'team-fixture-ids',
      rel_key_A:  team_id,
      rel_keys_B: @team_fixture_ids[team_id].sort,
      jmc:        'f1',
    })
    @nodb_file_recs << { name: filename, path: 'soccer/nodb', timestamp: `date`.strip, }
  end

end

# ---------------------------------------------------
#  Name: transform_driver
#  Desc: 
# ---------------------------------------------------
def transform_driver

  @nodb_file_recs = Array.new
  @all_team_ids = Array.new
  @team_fixture_ids = Hash.new
  @all_fixture_ids = Array.new

  @jmc_bad_league_list = ["15","34"]

  get_league_ids.each do |league_id|
    next if @jmc_bad_league_list.include? league_id
    transform_fixtures(league_id: league_id, season: '1314',
                       localtest: true, use_ds: true,
                       src_dir: 'XML-RAW')
  end

  # JMC-CREATE: Save json file for creating team/fixtures relationship
  team_fixtures_relationship

  # JMC-CREATE: Save json file for handy all-fixtures list
  filename = write_nodb_relation_json_file({
    rel_A:     'fixtures',
    rel_B:     'fixtures',
    rel_info:  'all-fixture-ids',
    rel_key_A:  'all',
    rel_keys_B: @all_fixture_ids.sort,
    jmc:        'f1',
    rel_type:   'list',
  })
  @nodb_file_recs << { name: filename, path: 'soccer/nodb', timestamp: `date`.strip, }

  # JMC-CREATE: Save json file for easy upload to noDB data store...
  write_upload_list_json_file({
    rec_type: "fixture",
    rec_info: 'all',
    rec_data: 'nodb',
    recs: @nodb_file_recs
  })

end

transform_driver



