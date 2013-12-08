#!/Users/jimcar/.rvm/rubies/ruby-2.0.0-p247/bin/ruby -w
#coding:utf-8

require 'net/https'
require "rubygems"
require "json"
require "uri"
# require "Nokogiri"
require "./mygem/xmlsoccerhttp/lib/xmlsoccerhttp"
require './xmlsoccer-league-map'
require './transform-utils'

# ---------------------------------------------------
#  Name: transform_results
#  Desc: cleanup xmlsoccer.xml 
# ---------------------------------------------------
def transform_results(options={})

  season = options[:season] ? options[:season] : '1314'
  league_id_str = league_id = options[:league]

  puts "Fetching 'Results by League' info for league #{league_id_str} from production data store ..."
  match_xml = Nokogiri::XML(aws_data_fetch({
    name: "HistoricMatches-league-#{league_id_str}-#{season}.xml",
    path: 'soccer/raw-data',
  }))

  data_file_recs = Array.new
  
  # live_score_xml = Nokogiri::XML(File.open("XML/LiveScore-league3-latest.xml"))
  # live_score_match_ids = live_score_xml.xpath("//Match/Id").map{ |node| node.text }
  # # puts "live_score_match_ids #{live_score_match_ids}"
  live_score_match_ids = Array.new

  match_xml.xpath("//Match").each do |node|

    next if node.xpath("Id").text == "62364"


    # puts "========= MATCH ID : '#{node.xpath("FixtureMatch_Id").text}' : LEAGUE : #{league} ========="
    fixture_match_id = node.xpath("FixtureMatch_Id").text
    fixture_id_str = standardize_id_str(fixture_match_id, :fixture)

    # Get substitution info from LiveScore data
    if live_score_match_ids.include? fixture_match_id
      live_score_node = live_score_xml.at("Id:contains(#{fixture_match_id})").parent
      ["Home","Away"].each do |team|
        sub_details = Array.new
        sub_details_node = node.add_child("<#{team}SubDetails></#{team}SubDetails>")
        live_score_node.xpath("#{team}SubDetails").text.split(';').reverse_each do |sub|
          sub_details << get_sub_details(sub)
          sub_details_node.first.add_child("<SubDetail />")
        end

        i = 0
        node.xpath("#{team}SubDetails/SubDetail").each do |detail|
          sub_detail_string = "<Time>#{sub_details[i][:time]}</Time>" +
                              "<Name>#{sub_details[i][:name]}</Name>" +
                              "<Direction>#{sub_details[i][:dir]}</Direction>"
          detail.add_child(sub_detail_string)
          i += 1
        end
      end
    end

    # Goal scorers
    ["Home","Away"].each do |team|
      # JMC - skip Brasiliero 'GoalDetails' for now
      unless league_id == "37" or node.xpath("#{team}GoalDetails").first.nil?
        goal_details = get_details(node.xpath("#{team}GoalDetails").text)
        node.xpath("#{team}GoalDetails").first.content = ''
        goal_details.each do |goal|
          tmp_str = "<GoalDetail>" +
                    "<Name>#{goal[:name]}</Name>" +
                    "<Time>#{goal[:time]}</Time>" +
                    "</GoalDetail>"
          node.xpath("#{team}GoalDetails").first.add_child(tmp_str)
        end
      end
    end

    # # Lineups
    # ["Home","Away"].each do |team|
    #   node.xpath("#{team}LineupDefense").text.split(';').each do |player|
    #     node << ("<#{team}LineupDefender>#{player.strip}</#{team}LineupDefender>")
    #   end
    #   node.xpath("#{team}LineupMidfield").text.split(';').each do |player|
    #     node << ("<#{team}LineupMidfielder>#{player.strip}</#{team}LineupMidfielder>")
    #   end
    #   node.xpath("#{team}LineupForward").text.split(';').each do |player|
    #     node << ("<#{team}LineupForwardist>#{player.strip}</#{team}LineupForwardist>")
    #   end
    # end

    # Lineups
    ["Home","Away"].each do |team|
      node.add_child("<#{team}Lineup />")
      tmp_str = "<Player>" +
                "<Name>#{node.xpath("#{team}LineupGoalkeeper").text.strip}</Name>" + 
                "<Position>G</Position>" +
                "</Player>"
      node.xpath("#{team}Lineup").first.add_child(tmp_str)
      node.xpath("#{team}LineupGoalkeeper").remove
      
      ["Defense","Midfield","Forward"].each do |position|
        position_str = node.xpath("#{team}Lineup#{position}").text
        node.xpath("#{team}Lineup#{position}").remove
        position_str.split(';').each do |player|
          tmp_str = "<Player>" +
                    "<Name>#{player.strip}</Name>" +
                    "<Position>#{position[0]}</Position>" +
                    "</Player>"
          node.xpath("#{team}Lineup").first.add_child(tmp_str)
        end
      end
    end

    # Bookings: Yellow and Red Cards
    ["Home","Away"].each do |team|
      ["Yellow","Red"].each do |card|
        # Skip when missing 'TeamCardDetails' element (identified in Serie B data)
        unless node.xpath("#{team}Team#{card}CardDetails").first.nil?
          tmp_card_details = get_details(node.xpath("#{team}Team#{card}CardDetails").text)
          node.xpath("#{team}Team#{card}CardDetails").first.content = ''
          tmp_card_details.each do |tcd|
            tmp_str = "<CardDetail>" +
                      "<Name>#{tcd[:name]}</Name>" +
                      "<Time>#{tcd[:time]}</Time>" +
                      "</CardDetail>"
            node.xpath("#{team}Team#{card}CardDetails").first.add_child(tmp_str)
          end
        end
      end
    end

    # Add the league_id
    league_name = node.xpath("League").text
    league_id = @xmlsoccer_league_map[league_name]
    node.add_child("<League_Id>#{league_id}</League_Id>")

    # Handle the shittle situation
    if league_id == "20"
      if node.xpath("HomeTeam_Id").text == "579"
        node.xpath("HomeTeam").first.content = 'Shittle Flounders FC'
      elsif node.xpath("AwayTeam_Id").text == "579"
        node.xpath("AwayTeam").first.content = 'Shittle Flounders FC'
      end
    end 

    # Save the XML file for this match
    filename = write_xml_file({
      group: 'match',
      group_info: fixture_id_str,
      node: node,
    })

    # Save record for generating json and rake files
    data_file_recs << { name:            filename, 
                        path:            'soccer/matches',
                        # has_corrections: false,
                        # format:          'xml',
                        # data_store:      'aws',
                        # data_store_id:   1,
                        timestamp:       `date`.strip } 

  end # end match_reports

  # Save as json file for uploading xml files to data store
  write_upload_list_json_file({
    rec_type: 'result',
    rec_info: league_id_str,
    rec_data: 'xml',
    recs: data_file_recs,
  })

  # JMC-CREATE: Initialize the DataFile records
  write_create_records_rake_file({
    rec_class: 'DataFile',
    rec_type: 'file',
    desc: 'Fill database with file data',
    recs: data_file_recs,
    jmc: 'r1',
    ext: league_id_str,
  })

  # Create rake file to update Fixture.report_id with the match report id.
  # Yep, same as Fixture.match_id - essentially used as a 'has match report'
  # boolean for now, but keeping since the report id is likely to change
  # fixture_match_ids = match_xml.xpath("//Match/FixtureMatch_Id").map{ |node| node.text }
  update_recs = Array.new
  missing_recs = Array.new
  fixture_ids = get_league_fixture_ids(league_id_str)
  $stdout.flush
  match_xml.xpath("//Match/FixtureMatch_Id").map{ |node| node.text }.each do |match_id|
    next if match_id == "0"
    if fixture_ids.include? match_id
      update_recs << { match_id: match_id, report_id: match_id }
    else
      missing_recs << { match_id: match_id }
    end
  end
  puts missing_recs

  # JMC-UPDATE: Fixture-update rec for NoDB
  update_recs.each do |update_rec|
    write_nodb_record_json_file({
      rec_type: 'fixtures',
      rec_info: "#{update_rec[:match_id]}-update-r1",
      rec:      update_rec,
    })
  end

  # JMC-UPDATE: Fixture-missing rec for NoDB
  missing_recs.each do |missing_rec|
    write_nodb_record_json_file({
      rec_type: 'fixtures',
      rec_info: "#{missing_rec[:match_id]}-missing-r1",
      rec:      missing_rec,
    })
  end

  # JMC-UPDATE: Fixture-update record (with 'has-match-report' info)
  write_update_records_rake_file({
    rec_class: 'Fixture',
    rec_type:  'fixture',
    rec_key:   'match_id',
    desc:      'Update database with match report data',
    recs:      update_recs,
    jmc:       'r1',
    ext:       league_id_str,
  })

  # JMC-UPDATE-TBD: Fixture-update record
  filename = write_record_array_json_file({
    rec_type: 'fixtures',
    rec_info: "#{league_id_str}-update-r1",
    recs: update_recs,
  })
  @nodb_file_recs << { name: filename, path: 'soccer/nodb', timestamp: `date`.strip, }

end

# -----------------------------------------------------------------------------
#  Name:transform_driver
#  Desc:
# -----------------------------------------------------------------------------
def transform_driver

  @nodb_file_recs = Array.new

  get_league_ids.each do |league_id|
    transform_results(league: league_id, season: '1314')
  end

  # JMC-CREATE: Save json file for easy upload to noDB data store...
  write_upload_list_json_file({
    rec_type: "result",
    rec_info: 'all',
    rec_data: 'nodb',
    recs: @nodb_file_recs
  })

end

transform_driver


