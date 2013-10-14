class SoccerStatsController < ApplicationController

  # require 'will_paginate/array'
  # require 'will_paginate/collection'

  def home
  end

  def index
  	xmlsoccer_client =
      Xmlsoccer::RequestManager.new({
        api_key: JSON.parse(File.open('xmlsoccer_config.json').read)['api_key'], 
  	 	  api_type: "Demo"
      })

  	 @leagues = xmlsoccer_client.get_all_leagues
  end

  def leagues
  	xmlsoccer_client = 
  	 Xmlsoccer::RequestManager.new({
      api_key: JSON.parse(File.open('xmlsoccer_config.json').read)['api_key'],
  	 	api_type: "Demo"
      })

  	 @leagues = xmlsoccer_client.get_all_leagues
  end

  def teams
    xmlsoccer_client = XMLsoccerHTTP::RequestManager.new({
      api_key: JSON.parse(File.open('xmlsoccer_config.json').read)['api_key'],
      api_type: "Demo"
    })

    # response = xmlsoccer_client.get_all_teams
    # f = open( "XML/JMC-GET-ALL-TEAMS.xml", "w" )
    # f.puts( response.body )
    # f.close

    @teams = Array.new
    # Nokogiri::XML(File.open("XML/JMC-GET-ALL-TEAMS.xml").read).xpath("//Team").each do |node|
    Nokogiri::XML(xmlsoccer_client.get_all_teams.body).xpath("//Team").each do |node|
      @teams << { team_id: node.xpath("Team_Id").text, country: node.xpath("Country").text,
                  name: node.xpath("Name").text, stadium: node.xpath("Stadium").text,
                  home_page_url: node.xpath("HomePageURL").text,
                  wiki_link: node.xpath("WIKILink").text }
    end
  end

  def reports

    reports = Array.new
    match_xml = Nokogiri::XML(File.open("FILES/xmlsoccer-match-63414.xml"))

    match_xml.xpath("//Match").each do |node|

      next if node.xpath("Round").text.to_i < 9

      # Substitution info
      home_sub_details = Array.new
      away_sub_details = Array.new
      detail = Hash.new
      ["Home","Away"].each do |team|
        sub_details = team == "Home" ? home_sub_details : away_sub_details
        node.xpath("//#{team}SubDetails/SubDetail").each do |sub|
          sub.element_children.each do |child|
            detail[child.name] = child.text 
          end
          sub_details << { time: detail['Time'], name: detail['Name'],
                           dir:  detail['Direction'] }
        end
      end
      max_sub_index = home_sub_details.size > away_sub_details.size ? home_sub_details.size - 1 :
                                                                      away_sub_details.size - 1

      # Goal scorers
      home_goal_details = Array.new
      away_goal_details = Array.new
      ["Home","Away"].each do |team|
        goal_details = team == "Home" ? home_goal_details : away_goal_details
        node.xpath("//#{team}GoalDetails/GoalDetail").each do |goal|
          goal.element_children.each do |child|
            detail[child.name] = child.text 
          end
          goal_details << { time: detail['Time'], name: detail['Name'] }
        end
      end
      max_goal_index = home_goal_details.size > away_goal_details.size ? home_goal_details.size - 1 : 
                                                                         away_goal_details.size - 1

      # Lineups
      home_lineup = Array.new
      away_lineup = Array.new
      ["Home","Away"].each do |team|
        lineup = team == "Home" ? home_lineup : away_lineup
        node.xpath("#{team}Lineup/Player").each do |player|
          player.element_children.each do |child|
            detail[child.name] = child.text 
          end
          lineup << { position: detail['Position'], name: detail['Name'] }
        end
      end
      
      # Bookings: Yellow/Red Cards
      home_team_yellow_card_details = Array.new
      away_team_yellow_card_details = Array.new
      home_team_red_card_details = Array.new
      away_team_red_card_details = Array.new
      ["Home","Away"].each do |team|
        ["Yellow","Red"].each do |card|
          card_details = team == "Home" ? (card == "Yellow" ? home_team_yellow_card_details :
                                                              home_team_red_card_details )  :
                                          (card == "Yellow" ? away_team_yellow_card_details :
                                                              away_team_red_card_details )
          node.xpath("#{team}Team#{card}CardDetails/CardDetail").each do |offense|
            offense.element_children.each do |child|
            detail[child.name] = child.text 
          end
          card_details << { time: detail['Time'], name: detail['Name'] }
          end
        end
      end
      max_yellow_card_index = home_team_yellow_card_details.size > away_team_yellow_card_details.size ?
                              home_team_yellow_card_details.size : away_team_yellow_card_details.size
      max_yellow_card_index -= 1 if max_yellow_card_index > 0
      max_red_card_index = home_team_red_card_details.size > away_team_red_card_details.size ?
                           home_team_red_card_details.size : away_team_red_card_details.size
      max_red_card_index -= 1 if max_red_card_index > 0

      # Add to the reports array
      reports << {  league: node.xpath("League").text,
                    round: node.xpath("Round").text,
                    date: node.xpath("Date").text,
                    
                    home_team: node.xpath("HomeTeam").text,
                    home_goals: node.xpath("HomeGoals").text,
                    half_time_home_goals: node.xpath("HalfTimeHomeGoals").text,
                    home_shots: node.xpath("HomeShots").text,
                    home_shots_on_target: node.xpath("HomeShotsOnTarget").text,
                    home_corners: node.xpath("HomeCorners").text,
                    home_yellow_cards: node.xpath("HomeYellowCards").text,
                    home_red_cards: node.xpath("HomeRedCards").text,
                    home_goal_details: home_goal_details,
                    home_team_formation: node.xpath("HomeTeamFormation").text,
                    home_lineup: home_lineup,
                    home_fouls: node.xpath("HomeFouls").text,
                    home_team_yellow_card_details: home_team_yellow_card_details,
                    home_team_red_card_details: home_team_red_card_details,
                    home_sub_details: home_sub_details,

                    away_team: node.xpath("AwayTeam").text,
                    away_goals: node.xpath("AwayGoals").text,
                    half_time_away_goals: node.xpath("HalfTimeAwayGoals").text,
                    away_shots: node.xpath("AwayShots").text,
                    away_shots_on_target: node.xpath("AwayShotsOnTarget").text,
                    away_corners: node.xpath("AwayCorners").text,
                    away_yellow_cards: node.xpath("AwayYellowCards").text,
                    away_red_cards: node.xpath("AwayRedCards").text,
                    away_goal_details: away_goal_details,
                    away_team_formation: node.xpath("AwayTeamFormation").text,
                    away_lineup: away_lineup,
                    away_fouls: node.xpath("AwayFouls").text,
                    away_team_yellow_card_details: away_team_yellow_card_details,
                    away_team_red_card_details: away_team_red_card_details,
                    away_sub_details: away_sub_details,

                    max_goal_index: max_goal_index,
                    max_sub_index: max_sub_index,
                    max_yellow_card_index: max_yellow_card_index,
                    max_red_card_index: max_red_card_index,

                  }

      break if true
    end

    @reports = WillPaginate::Collection.create(1, 0, reports.length) do |pager|
      pager.replace reports
    end
  end

  def reportsXX
    xmlsoccer_client = XMLsoccerHTTP::RequestManager.new({
      api_key: JSON.parse(File.open('xmlsoccer_config.json').read)['api_key'],
      api_type: "Demo"
    })
    
    # match_xml = Nokogiri::XML(File.open("XML/HistoricMatches-league3-1314.xml"))
    match_xml = Nokogiri::XML(xmlsoccer_client.get_historic_matches_by_league_and_season(3, '1314').body)
    live_score_xml = Nokogiri::XML(File.open("XML/JMC-LiveScore.xml").read)
    live_score_match_ids = live_score_xml.xpath("//Match/Id").map{ |node| node.text }

    reports = Array.new
    match_xml.xpath("//Match").each do |node|

      next if node.xpath("Round").text.to_i < 9

      # Get substitution info from LiveScore data
      home_sub_details = Array.new
      away_sub_details = Array.new

      tmpthing = Hash.new
      
      fixture_match_id = node.xpath("FixtureMatch_Id").text
      if live_score_match_ids.include? fixture_match_id
        node_2 = live_score_xml.at("Id:contains(#{fixture_match_id})").parent
        ["Home","Away"].each do |team|
          jmc = Array.new
          node_2.xpath("#{team}SubDetails").text.split(';').reverse_each do |sub|
            time, name = sub.split(':')
            if name =~ /^ out /
              dir = "out"
              name.sub!(/ out /, '')
            elsif name =~  /^ in /
              dir = "in"
              name.sub!(/ in /, '')
            end
            sub_details = team == "Home" ? home_sub_details : away_sub_details
            node.add_child("<#{team}SubDetail></#{team}SubDetail>")
            jmc << { name: name, dir: dir, time: time }
          end

          sub_details = team == "Home" ? home_sub_details : away_sub_details
          i = 0
          node.xpath("#{team}SubDetail").each do |detail|
            sub_detail_string = "<Time>#{jmc[i][:time]}</Time>" +
                                "<Name>#{jmc[i][:name]}</Name>" +
                                "<Direction>#{jmc[i][:dir]}</Direction>"
            detail << sub_detail_string
            i += 1
            detail.element_children.each do |child|
              tmpthing[child.name] = child.text 
            end
            sub_details << { time: tmpthing['Time'],
                             name: tmpthing['Name'],
                             dir:  tmpthing['Direction'] }
          end
        end
        logger.debug "JMC: #{node.elements}"
      end
      max_sub_index = home_sub_details.size > away_sub_details.size ? home_sub_details.size - 1 :
                                                                      away_sub_details.size - 1

      # Goal scorers
      node.xpath("HomeGoalDetails").text.split(';').reverse_each do |goal|
        time, scorer = goal.split(':')
        node << "<HomeGoalDetail>#{scorer} (#{time})</HomeGoalDetail>"
      end
      home_goal_details = Array.new
      node.xpath("HomeGoalDetail").each do |goal|
        home_goal_details << goal.text
      end
      node.xpath("AwayGoalDetails").text.split(';').reverse_each do |goal|
        time, scorer = goal.split(':')
        node << ("<AwayGoalDetail>(#{time}) #{scorer}</AwayGoalDetail>")
      end
      away_goal_details = Array.new
      node.xpath("AwayGoalDetail").each do |goal|
        away_goal_details << goal.text
      end
      max_goal_index = home_goal_details.size > away_goal_details.size ? home_goal_details.size - 1 : 
                                                                         away_goal_details.size - 1

      # Lineups
      home_lineup = Array.new
      home_lineup << "#{node.xpath("HomeLineupGoalkeeper").text} (G)"
      node.xpath("HomeLineupDefense").text.split(';').each do |player|
        node << ("<HomeLineupDefender>#{player} (D)</HomeLineupDefender>")
      end
      node.xpath("HomeLineupDefender").each do |player|
        home_lineup << player.text
      end
      node.xpath("HomeLineupMidfield").text.split(';').each do |player|
        node << ("<HomeLineupMidfielder>#{player} (M)</HomeLineupMidfielder>")
      end
      node.xpath("HomeLineupMidfielder").each do |player|
        home_lineup << player.text
      end
      node.xpath("HomeLineupForward").text.split(';').each do |player|
        node << ("<HomeLineupForwardist>#{player} (F)</HomeLineupForwardist>")
      end
      node.xpath("HomeLineupForwardist").each do |player|
        home_lineup << player.text
      end

      away_lineup = Array.new
      away_lineup << "(G) #{node.xpath("AwayLineupGoalkeeper").text}"
      node.xpath("AwayLineupDefense").text.split(';').each do |player|
        node << ("<AwayLineupDefender>(D) #{player}</AwayLineupDefender>")
      end
      node.xpath("AwayLineupDefender").each do |player|
        away_lineup << player.text
      end
      node.xpath("AwayLineupMidfield").text.split(';').each do |player|
        node << ("<AwayLineupMidfielder>(M) #{player}</AwayLineupMidfielder>")
      end
      node.xpath("AwayLineupMidfielder").each do |player|
        away_lineup << player.text
      end
      node.xpath("AwayLineupForward").text.split(';').each do |player|
        node << ("<AwayLineupForwardist>(F) #{player}</AwayLineupForwardist>")
      end
      node.xpath("AwayLineupForwardist").each do |player|
        away_lineup << player.text
      end

      # Yellow Cards
      home_team_yellow_card_details = Array.new
      node.xpath("HomeTeamYellowCardDetails").text.split(';').reverse_each do |offense|
        time, offender = offense.split(':')
        home_team_yellow_card_details << "#{offender} (#{time})"
      end
      away_team_yellow_card_details = Array.new
      node.xpath("AwayTeamYellowCardDetails").text.split(';').reverse_each do |offense|
        time, offender = offense.split(':')
        away_team_yellow_card_details << "(#{time}) #{offender}"
      end
      max_yellow_card_index = home_team_yellow_card_details.size > away_team_yellow_card_details.size ?
                              home_team_yellow_card_details.size : away_team_yellow_card_details.size
      max_yellow_card_index -= 1 if max_yellow_card_index > 0

      # Red cards
      home_team_red_card_details = Array.new
      node.xpath("HomeTeamRedCardDetails").text.split(';').reverse_each do |offense|
        time, offender = offense.split(':')
        home_team_red_card_details << "#{offender} (#{time})"
      end
      away_team_red_card_details = Array.new
      node.xpath("AwayTeamRedCardDetails").text.split(';').reverse_each do |offense|
        time, offender = offense.split(':')
        away_team_red_card_details << "(#{time}) #{offender}"
      end
      max_red_card_index = home_team_red_card_details.size > away_team_red_card_details.size ?
                           home_team_red_card_details.size : away_team_red_card_details.size
      max_red_card_index -= 1 if max_red_card_index > 0

      # Add to the reports array
      reports << {  league: node.xpath("League").text,
                    round: node.xpath("Round").text,
                    date: node.xpath("Date").text,
                    
                    home_team: node.xpath("HomeTeam").text,
                    home_goals: node.xpath("HomeGoals").text,
                    half_time_home_goals: node.xpath("HalfTimeHomeGoals").text,
                    home_shots: node.xpath("HomeShots").text,
                    home_shots_on_target: node.xpath("HomeShotsOnTarget").text,
                    home_corners: node.xpath("HomeCorners").text,
                    home_yellow_cards: node.xpath("HomeYellowCards").text,
                    home_red_cards: node.xpath("HomeRedCards").text,
                    home_goal_details: home_goal_details,
                    home_team_formation: node.xpath("HomeTeamFormation").text,
                    home_lineup: home_lineup,
                    home_fouls: node.xpath("HomeFouls").text,
                    home_team_yellow_card_details: home_team_yellow_card_details,
                    home_team_red_card_details: home_team_red_card_details,
                    home_sub_details: home_sub_details,

                    away_team: node.xpath("AwayTeam").text,
                    away_goals: node.xpath("AwayGoals").text,
                    half_time_away_goals: node.xpath("HalfTimeAwayGoals").text,
                    away_shots: node.xpath("AwayShots").text,
                    away_shots_on_target: node.xpath("AwayShotsOnTarget").text,
                    away_corners: node.xpath("AwayCorners").text,
                    away_yellow_cards: node.xpath("AwayYellowCards").text,
                    away_red_cards: node.xpath("AwayRedCards").text,
                    away_goal_details: away_goal_details,
                    away_team_formation: node.xpath("AwayTeamFormation").text,
                    away_lineup: away_lineup,
                    away_fouls: node.xpath("AwayFouls").text,
                    away_team_yellow_card_details: away_team_yellow_card_details,
                    away_team_red_card_details: away_team_red_card_details,
                    away_sub_details: away_sub_details,

                    max_goal_index: max_goal_index,
                    max_sub_index: max_sub_index,
                    max_yellow_card_index: max_yellow_card_index,
                    max_red_card_index: max_red_card_index,

                  }

      # break if true
    end

    @reports = WillPaginate::Collection.create(1, 0, reports.length) do |pager|
      pager.replace reports
    end
    # @reports = reports
  end

  def scores
  	xmlsoccer_client = 
  	 Xmlsoccer::RequestManager.new({
      api_key: JSON.parse(File.open('xmlsoccer_config.json').read)['api_key'],
      api_type: "Demo"
      })

  	 @scores = xmlsoccer_client.get_live_score
  end

  def earliest_match_dates
  	xmlsoccer_client = 
  	 Xmlsoccer::RequestManager.new({
      api_key: JSON.parse(File.open('xmlsoccer_config.json').read)['api_key'],
  	 	api_type: "Demo"
     })

  	 @dates = xmlsoccer_client.get_earliest_match_date(3)
  end

end
