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
#  Name: transform_hresults
#  Desc: cleanup xmlsoccer.xml 
# ---------------------------------------------------
def transform_results(options={})

  league = options[:league]
  season = options[:season]

  localtest = (options[:localtest].nil? or options[:localtest] != true) ? false : true

  unless localtest == true
    puts "Setting up client"
    xmlsoccer_client = XMLsoccerHTTP::RequestManager.new({
      api_key: JSON.parse(File.open('xmlsoccer_config.json').read)['api_key'],
      api_type: "Demo"
    })
    puts "Requesting data for league #{league}, season #{season} ..."
    STDOUT.flush
    match_xml = Nokogiri::XML(
      xmlsoccer_client.get_historic_matches_by_league_and_season(league, season).body)
  else
    puts "Reading local data for league #{league}, season #{season} " +
         "from XML-NEW/HistoricMatches-league-#{league}-#{season}.xml..."
    match_xml = Nokogiri::XML(File.open("XML-NEW/HistoricMatches-league-#{league}-#{season}.xml"))
  end

  data_file_recs = Array.new
  
  live_score_xml = Nokogiri::XML(File.open("XML/LiveScore-league3-latest.xml"))
  live_score_match_ids = live_score_xml.xpath("//Match/Id").map{ |node| node.text }
  puts "live_score_match_ids #{live_score_match_ids}"

  match_xml.xpath("//Match").each do |node|

    # next if node.xpath("Round").text.to_i < 9
    next if localtest == false or node.xpath("Id").text == "62364"

    puts "========= MATCH ID : '#{node.xpath("FixtureMatch_Id").text}' : LEAGUE : #{league} ========="

    # Get substitution info from LiveScore data
    fixture_match_id = node.xpath("FixtureMatch_Id").text
    if live_score_match_ids.include? fixture_match_id
      live_score_node = live_score_xml.at("Id:contains(#{fixture_match_id})").parent
      ["Home","Away"].each do |team|
        sub_details = Array.new
        sub_details_node = node.add_child("<#{team}SubDetails></#{team}SubDetails>")
        live_score_node.xpath("#{team}SubDetails").text.split(';').reverse_each do |sub|
          time, name = sub.split(':')
          if name =~ /^ out /
            dir = "out"
            name.sub!(/ out /, '')
          elsif name =~  /^ in /
            dir = "in"
            name.sub!(/ in /, '')
          end
          sub_details_node.first.add_child("<SubDetail />")
          sub_details << { name: name, dir: dir, time: time }
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
      #
      # JMC - skip Brasiliero 'GoalDetails' for now
      #
      unless league == 37 or node.xpath("#{team}GoalDetails").first.nil?
        goal_details = Array.new
        goal_detail_line = node.xpath("#{team}GoalDetails").text
        puts "goal_detail_line 2: #{goal_detail_line}" if goal_detail_line =~ /nbsp/
        while goal_detail_line =~ /nbsp\;/
          goal_detail_line.sub!(/nbsp\;/, '') 
        end

        goal_detail_line.split(';').reverse_each do |goal|
          time, name = goal.split(':')
          goal_details << { name: name.strip, time: time }
        end

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
          tmp_card_details = Array.new
          card_detail_line = node.xpath("#{team}Team#{card}CardDetails").text
          # puts "card_detail_line 2: #{card_detail_line}" if card_detail_line =~ /nbsp/
          while card_detail_line =~ /nbsp\;/
            card_detail_line.sub!(/nbsp\;/, '') 
          end
          card_detail_line.split(';').reverse_each do |offense|
            time, name = offense.split(':')
            tmp_card_details << { name: name.strip, time: time }
          end
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

    # Save the XML file for this match
    report_id = node.xpath("Id").text
    fixture_match_id = node.xpath("FixtureMatch_Id").text
    filename = "xmlsoccer-match-#{fixture_match_id}.xml"
    f = File.open("./XML-FILES/matches/#{filename}", "w")
    f.puts "<?xml version=\"1.0\" encoding=\"utf-8\"?>"
    f.puts "<FreeFantasyFootball.Info>"
    f.puts "<#{node.name}>"
    node.elements.each do |e|
     f.puts "#{e}"
    end
    f.puts "</#{node.name}>"
    f.puts "</FreeFantasyFootball.Info>"
    f.close

    # Save record for generating json and rake files
    data_file_recs << { name:            filename, 
                        path:            'soccer/matches',
                        has_corrections: false,
                        format:          'xml',
                        data_store:      'aws',
                        data_store_id:   1,
                        timestamp:       `date`.strip } 
  end

  # Save as json file for uploading files to data store
  f = File.open("./JSON-FILES/xmlsoccer-match-data-files-#{league}.json", "w")
  f.puts '{ "match-data-files": ['
  data_file_recs.each do |record|
    f.puts '{'
    f.puts "\"name\":\"#{record[:name]}\","
    f.puts "\"path\":\"#{record[:path]}\","
    f.puts "\"timestamp\":\"#{record[:timestamp]}\""
    my_comma = record == data_file_recs.last ? '' : ','
    f.puts "}#{my_comma}"
  end
  f.puts '] }'
  f.close

  # Save as json file, for whatever purpose
  f = File.open("./JSON-FILES/xmlsoccer-data-files-#{league}.json", "w")
  f.puts '{ "data-files": ['
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

  # Or...just create the rake file now - DUH!
  f = File.open("./RAKE-FILES/file_data-#{league}.rake", "w")
  f.puts 'namespace :db do'
  f.puts "\tdesc \"Fill database with file data\""
  f.puts "\ttask populate: :environment do"
  f.puts "\t\tif ENV['update'].nil?"
  data_file_recs.each do |record|
    f.puts "\t\t\tDataFile.create!("
    record.each do |k,v|
      f.puts "\t\t\t\t\"#{k}\" => \"#{v}\","
    end
    f.puts "\t\t\t)"
  end
  f.puts "\t\tend\n\tend\nend"
  f.close

  # Create rake file to update Fixture.report_id with the match report id.
  # Yep, same as Fixture.match_id - essentially used as a 'has match report'
  # boolean for now, but keeping since the report id is likely to change
  fixture_match_ids = match_xml("//Match/FixtureMatch_Id").map{ |node| node.text }
  File.open("./RAKE-FILES/update_2_fixture_data-#{league}.rake", "w") do |f|
    f.puts 'namespace :db do'
    f.puts "\tdesc \"Update database with fixture data\""
    f.puts "\ttask populate: :environment do"
    f.puts "\t\tif !ENV['update'].nil? and ENV['update'] == 'fixture2'"
    fixture_match_ids.each do |match_id|
      f.puts "\t\t\tid = Fixture.find_by(match_id: #{match_id})"
      f.puts "\t\t\tFixture.update("
      f.puts "\t\t\t\tid,"
      f.puts "\t\t\t\t{"
      f.puts "\t\t\t\t\t\"report_id\" => \"#{match_id}\","
      f.puts "\t\t\t\t}"
      f.puts "\t\t\t)"
    end
    f.puts "\t\tend\n\tend\nend"
  end

end

def transform_driver

  xml_doc = Nokogiri::XML(open("./XML/AllLeagues.xml"))
  league_ids = xml_doc.xpath("//League/Id").map { |node| node.text }

  league_ids.each do |league_id|
    puts "league_id = '#{league_id}'"
    transform_results(league: league_id.to_i, season: '1314', localtest: true, update: false)
  end

end

transform_driver

# transform_results({league: 37, season: '1314', localtest: true})

