#!/Users/jimcar/.rvm/rubies/ruby-2.0.0-p247/bin/ruby -w
#coding:utf-8

require 'net/https'
require "rubygems"
require "json"
require "uri"
require "Nokogiri"
require "./mygem/xmlsoccerhttp/lib/xmlsoccerhttp"

def transform
  # xmlsoccer_client = XMLsoccerHTTP::RequestManager.new({
  #   api_key: JSON.parse(File.open('xmlsoccer_config.json').read)['api_key'],
  #   api_type: "Demo"
  # })

  # match_xml = Nokogiri::XML(xmlsoccer_client.get_historic_matches_by_league_and_season(3, '1314').body)
  match_xml = Nokogiri::XML(File.open("XML/HistoricMatches-league3-1314.xml"))
  
  live_score_xml = Nokogiri::XML(File.open("XML/JMC-LiveScore.xml").read)
  live_score_match_ids = live_score_xml.xpath("//Match/Id").map{ |node| node.text }

  match_xml.xpath("//Match").each do |node|

    next if node.xpath("Round").text.to_i < 9

    # Get substitution info from LiveScore data
    tmp_sub_details = Array.new
    fixture_match_id = node.xpath("FixtureMatch_Id").text
    if live_score_match_ids.include? fixture_match_id
      node_2 = live_score_xml.at("Id:contains(#{fixture_match_id})").parent
      ["Home","Away"].each do |team|
        new_node = node.add_child("<#{team}SubDetails></#{team}SubDetails>")
        node_2.xpath("#{team}SubDetails").text.split(';').reverse_each do |sub|
          time, name = sub.split(':')
          if name =~ /^ out /
            dir = "out"
            name.sub!(/ out /, '')
          elsif name =~  /^ in /
            dir = "in"
            name.sub!(/ in /, '')
          end
          new_node.first.add_child("<#{team}SubDetail></#{team}SubDetail>")
          tmp_sub_details << { name: name, dir: dir, time: time }
        end

        i = 0
        node.xpath("//#{team}SubDetail").each do |detail|
          sub_detail_string = "<Time>#{tmp_sub_details[i][:time]}</Time>" +
                              "<Name>#{tmp_sub_details[i][:name]}</Name>" +
                              "<Direction>#{tmp_sub_details[i][:dir]}</Direction>"
          detail << sub_detail_string
          i += 1
        end
      end
    end

    # Goal scorers
    ["Home","Away"].each do |team|
      tmp_goal_details = Array.new
      node.xpath("#{team}GoalDetails").text.split(';').reverse_each do |goal|
        time, name = goal.split(':')
        tmp_goal_details << { name: name.strip, time: time }
      end
      node.xpath("#{team}GoalDetails").first.content = ''

      tmp_goal_details.each do |tgd|
        tmp_str = "<GoalDetail>" +
                  "<Name>#{tgd[:name]}</Name>" +
                  "<Time>#{tgd[:time]}</Time>" +
                  "</GoalDetail>"
        node.xpath("#{team}GoalDetails").first.add_child(tmp_str)
      end
    end

    # Lineups
    ["Home","Away"].each do |team|

      node.add_child("<#{team}Lineup />")
      tmp_str = "<Player>" +
                "<Name>#{node.xpath("#{team}LineupGoalkeeper").text.strip}</Name>" + 
                "<Position>GK</Position>" +
                "</Player>"
      node.xpath("#{team}Lineup").first.add_child(tmp_str)

      ["Defense","Midfield","Forward"].each do |position|
        position_str = node.xpath("#{team}Lineup#{position}").text
        node.xpath("#{team}Lineup#{position}").first.content = ''
        position_str.split(';').each do |player|
          tmp_str = "<Player>" +
                  "<Name>#{player.strip}</Name>" +
                  "<Position>#{position[0]}</Position>" +
                  "</Player>"
          node.xpath("#{team}Lineup").first.add_child(tmp_str)
          node.xpath("#{team}Lineup#{position}").first.add_child("<Name>#{player.strip}</Name>")
        end
        
      end
    end

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

    #   node.xpath("#{team}LineupDefense").first.content = ''
    #   node.xpath("#{team}LineupMidfield").first.content = ''
    #   node.xpath("#{team}LineupForward").first.content = ''
    # end

    # Yellow Cards
    node.xpath("HomeTeamYellowCardDetails").text.split(';').reverse_each do |offense|
      time, offender = offense.split(':')
    end
    node.xpath("AwayTeamYellowCardDetails").text.split(';').reverse_each do |offense|
      time, offender = offense.split(':')
    end

    # Red cards
    node.xpath("HomeTeamRedCardDetails").text.split(';').reverse_each do |offense|
      time, offender = offense.split(':')
    end
    node.xpath("AwayTeamRedCardDetails").text.split(';').reverse_each do |offense|
      time, offender = offense.split(':')
    end

    f = File.open("./log.xform.xml", "w")
    f.puts "------------- elements -------------"
    f.puts node.elements
    f.puts "------------- children -------------"
    f.puts node.children
    f.puts "------------------------------------"
    f.close

    break if true
  end

end


transform
