class FixturesController < ApplicationController

	def index
		@fixtures = Fixture.all
	end

	def show
		fixture = Fixture.find(params[:id])
    @fixtures = [ fixture ]
  end

	def report
		fixture = Fixture.find(params[:id])
    @reports = Array.new

    # fixture.report_id is set to the match_id when a report is generated for a completed fixture
    # for now, report_id is essentially used as a boolean 'has_report' flag
    #
    if fixture.report_id == fixture.match_id

      # xml_doc = Nokogiri::XML(File.open("XML-FILES/matches/xmlsoccer-match-#{fixture.match_id}.xml"))
      xml_doc = Nokogiri::XML(aws_data_fetch(
        name: "xmlsoccer-match-#{fixture.match_id}.xml",
        path: "soccer/matches"
      ))

      xml_doc.xpath("//Match").each do |node|
        detail = Hash.new
        
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
        max_goal_index = home_goal_details.size > away_goal_details.size ?
                         home_goal_details.size - 1 : away_goal_details.size - 1

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

        # Substitution info
        home_sub_details = Array.new
        away_sub_details = Array.new
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
        max_sub_index = home_sub_details.size > away_sub_details.size ?
                        home_sub_details.size - 1 : away_sub_details.size - 1
        
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

        # Add to the @reports array
        @reports << { league: node.xpath("League").text,
                      round: node.xpath("Round").text,
                      date: node.xpath("Date").text,
                      match_id: node.xpath("FixtureMatch_Id").text,
                      
                      home_team: node.xpath("HomeTeam").text,
                      home_team_id: node.xpath("HomeTeam_Id").text,
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
                      away_team_id: node.xpath("AwayTeam_Id").text,
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
  	  end

    end
	end

end
