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

# ---------------------------------------------------
#  Name: transform_results
#  Desc: cleanup xmlsoccer.xml 
# ---------------------------------------------------
def transform_results(options={})

  use_ds    = options[:use_ds]    ? options[:use_ds]    : false
  localtest = options[:localtest] ? options[:localtest] : false
  src_dir   = options[:src_dir]   ? options[:src_dir]   : 'XML'
  season    = options[:season]    ? options[:season]    : '1314'
  league_id = league = options[:league]

  # league_id_str = "0#{league_id_str}" if league_id.to_i < 10
  league_id_str = standardize_id_str(league_id, :league)

  if use_ds == true
      puts "Fetching 'Results by League' info from production data store ..."
      match_xml = Nokogiri::XML(aws_data_fetch({
        name: "HistoricMatches-league-#{league_id_str}-#{season}.xml",
        path: 'soccer/raw-data',
      }))
  elsif localtest == true
    puts "Reading local data for league #{league_id_str}, season #{season} " +
         "from #{src_dir}/HistoricMatches-league-#{league_id_str}-#{season}.xml..."
    match_xml = Nokogiri::XML(File.open("#{src_dir}/HistoricMatches-league-#{league_id_str}-#{season}.xml"))
  else
    puts "Setting up client"
    xmlsoccer_client = XMLsoccerHTTP::RequestManager.new({
      api_key: JSON.parse(File.open('xmlsoccer_config.json').read)['api_key'],
      api_type: "Demo"
    })
    puts "Requesting data for league #{league}, season #{season} ..."
    STDOUT.flush
    match_xml = Nokogiri::XML(
      xmlsoccer_client.get_historic_matches_by_league_and_season(league, season).body)
  end

  data_file_recs = Array.new
  
  live_score_xml = Nokogiri::XML(File.open("XML/LiveScore-league3-latest.xml"))
  live_score_match_ids = live_score_xml.xpath("//Match/Id").map{ |node| node.text }
  # puts "live_score_match_ids #{live_score_match_ids}"

  match_xml.xpath("//Match").each do |node|

    # next if node.xpath("Round").text.to_i < 9
    next if localtest == false or node.xpath("Id").text == "62364"

    # puts "========= MATCH ID : '#{node.xpath("FixtureMatch_Id").text}' : LEAGUE : #{league} ========="
    fixture_match_id = node.xpath("FixtureMatch_Id").text
    fixture_id_str = standardize_id_str(fixture_match_id, :fixture)

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
      # JMC - skip Brasiliero 'GoalDetails' for now
      unless league_id == "37" or node.xpath("#{team}GoalDetails").first.nil?
        goal_details = Array.new
        goal_detail_line = node.xpath("#{team}GoalDetails").text
        # puts "goal_detail_line 2: #{goal_detail_line}" if goal_detail_line =~ /nbsp/
        # while goal_detail_line =~ /nbsp\;/
        #   goal_detail_line.sub!(/nbsp\;/, '') 
        # end
        while goal_detail_line =~ /nbsp\;/
          goal_detail_line.sub!(/nbsp\;/, '') 
        end
        while goal_detail_line =~ /\&/
          goal_detail_line.sub!(/\&/, '') 
        end
        while goal_detail_line =~ /amp;/
          goal_detail_line.sub!(/amp;/, '') 
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
          while card_detail_line =~ /nbsp\;/
            card_detail_line.sub!(/nbsp\;/, '') 
          end
          while card_detail_line =~ /\&/
            card_detail_line.sub!(/\&/, '') 
          end
          while card_detail_line =~ /amp;/
            card_detail_line.sub!(/amp;/, '') 
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

    # Handle the shittle situation
    if league_id == "20"
      if node.xpath("HomeTeam_Id").text == "579"
        node.xpath("HomeTeam").first.content = 'Shittle Flounders FC'
      elsif node.xpath("AwayTeam_Id").text == "579"
        node.xpath("AwayTeam").first.content = 'Shittle Flounders FC'
      end
    end 

    # Save the XML file for this match
    # report_id = node.xpath("Id").text
    # fixture_match_id = node.xpath("FixtureMatch_Id").text
    # filename = "xmlsoccer-match-#{fixture_match_id}.xml"
    # f = File.open("./XML-FILES/matches/#{filename}", "w")
    # f.puts "<?xml version=\"1.0\" encoding=\"utf-8\"?>"
    # f.puts "<FreeFantasyFootball.Info>"
    # f.puts "<#{node.name}>"
    # node.elements.each do |e|
    #  f.puts "#{e}"
    # end
    # f.puts "</#{node.name}>"
    # f.puts "</FreeFantasyFootball.Info>"
    # f.close

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
  end

  # Save as json file for uploading xml files to data store
  write_data_file_json_file({
    rec_type: 'result',
    rec_info: league_id_str,
    rec_data: 'xml',
    recs: data_file_recs,
  })

  # Save as json file, for whatever purpose
  # File.open("./JSON-FILES/xmlsoccer-data-files-#{league}.json", "w") do |f|
  #   f.puts '{ "data-files": ['
  #   data_file_recs.each do |record|
  #     f.puts '{'
  #     record.each do |k,v|
  #       my_comma = k == :timestamp ? '' : ','
  #       f.puts "\"#{k}\":\"#{v}\"#{my_comma}"
  #     end
  #     my_comma = record == data_file_recs.last ? '' : ','
  #     f.puts "}#{my_comma}"
  #   end
  #   f.puts '] }'
  # end

  # Or...just create the rake file now - DUH!
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
  fixture_xml = Nokogiri::XML(File.open("#{src_dir}/Fixtures-league-#{league_id_str}-#{season}.xml"))
  fixture_ids = fixture_xml.xpath("//Match/Id").map{ |node| node.text }
  match_xml.xpath("//Match/FixtureMatch_Id").map{ |node| node.text }.each do |match_id|
    next if match_id == "0"
    if fixture_ids.include? match_id
      update_recs << { match_id: match_id, report_id: match_id }
    else
      missing_recs << { match_id: match_id }
    end
  end
  puts missing_recs

  write_update_records_rake_file({
    rec_class: 'Fixture',
    rec_type: 'fixture',
    rec_key: 'match_id',
    desc: 'Update database with match report data',
    recs: update_recs,
    jmc: 'r1',
    ext: league_id_str,
  })

  # Create json file for easy upload of json update records
  filename = write_records_json_file({
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

  # xml_doc = Nokogiri::XML(open("./XML/AllLeagues.xml"))
  # league_ids = xml_doc.xpath("//League/Id").map { |node| node.text }
  # league_ids.each do |league_id|
  get_league_ids.each do |league_id|
    next if ["15","34"].include? league_id
    puts "league_id = '#{league_id}'"
    transform_results(league: league_id.to_i, season: '1314', localtest: true,
                      use_ds: true, src_dir: 'XML-RAW')
  end

  # Save json file for easy upload to noDB data store...
  write_data_file_json_file({
    rec_type: "result",
    rec_info: 'all',
    rec_data: 'nodb',
    recs: @nodb_file_recs
  })

end

transform_driver

# transform_results({ league: 19, season: '1314', localtest: true, src_dir: 'XML-RAW' })

