#!/Users/jimcar/.rvm/rubies/ruby-2.0.0-p247/bin/ruby -w
#coding:utf-8

require 'net/https'
require "rubygems"
require "json"
require "uri"
require "Nokogiri"
require "./mygem/xmlsoccerhttp/lib/xmlsoccerhttp"

# ---------------------------------------------------
#  Name: transform_historic_matches 
#  Desc: cleanup xmlsoccer.xml 
# ---------------------------------------------------
def transform_historic_matches(options={})

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
    puts "Reading local data for league #{league}, season #{season} ..."
    match_xml = Nokogiri::XML(File.open("XML/HistoricMatches-league#{league}-#{season}.xml"))
  end

  data_file_recs = Array.new
  
  live_score_xml = Nokogiri::XML(File.open("XML/JMC-LiveScore.xml"))
  live_score_match_ids = live_score_xml.xpath("//Match/Id").map{ |node| node.text }

  match_xml.xpath("//Match").each do |node|

    # next if node.xpath("Round").text.to_i < 9
    next if localtest == false and node.xpath("Id").text == "62364"

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
      goal_details = Array.new
      node.xpath("#{team}GoalDetails").text.split(';').reverse_each do |goal|
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
        tmp_card_details = Array.new
        node.xpath("#{team}Team#{card}CardDetails").text.split(';').reverse_each do |offense|
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

    # Save the XML file for this match
    report_id = node.xpath("Id").text
    fixture_match_id = node.xpath("FixtureMatch_Id").text
    filename = "xmlsoccer-match-#{fixture_match_id}.xml"
    f = File.open("./FILES/#{filename}", "w")
    f.puts "<?xml version=\"1.0\" encoding=\"utf-8\"?>"
    f.puts "<FreeFantasyFootball.Info>"
    f.puts "<#{node.name}>"
    node.elements.each do |e|
     f.puts "#{e}"
    end
    f.puts "</#{node.name}>"
    f.puts "</FreeFantasyFootball.Info>"
    f.close

    data_file_recs << { name:            filename, 
                        path:            'soccer/matches',
                        has_corrections: false,
                        format:          'xml',
                        data_store:      'aws',
                        data_store_id:   1,
                        timestamp:       `date`.strip } 


    # puts "JMC: #{node.xpath("FixtureMatch_Id").text}"

    # break if true
  end

  # Save as json file, for conversion to file_data.rake - or not -- see below
  # Ha! This proved immediately useful for uploading files to data store
  f = File.open("./FILES/xmlsoccer-match-db-info.json", "w")
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

  # Or...just create the rake file now - DUH!
  f = File.open("./FILES/xxfile_data.rake", "w")
  f.puts 'namespace :db do'
  f.puts "\tdesc \"Fill database with file data\""
  f.puts "\ttask populate: :environment do"
  data_file_recs.each do |record|
    f.puts "\t\tDataFile.create!("
    record.each do |k,v|
      f.puts "\t\t\t\"#{k}\" => \"#{v}\","
    end
    f.puts "\t\t)"
  end
  f.puts "\tend\nend"
  f.close

end

transform_historic_matches({league: 3, season: '1314', localtest: true})

