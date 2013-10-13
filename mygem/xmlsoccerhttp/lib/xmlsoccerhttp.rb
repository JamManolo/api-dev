require 'net/https'
require "rubygems"
require "uri"

module XMLsoccerHTTP

	DEMO = "Demo"
	FULL = "Full"

	class RequestManager

		@api_type = 'Demo'
		@base_url = ''

		attr_accessor :base_url, :api_type, :api_key

		def initialize(options={})
			@api_key = options[:api_key]
			@api_type = options[:api_type]
			if @api_type == DEMO
				@base_url = "http://www.xmlsoccer.com/FootballDataDemo.asmx/"
			else
				@base_url = "http://www.xmlsoccer.com/FootballData.asmx/"
			end
		end

		def make_the_call(args={})
			api_args = { 'ApiKey' => @api_key, get_xml: true }
			unless args[:api_args].nil?
				args[:api_args].each do |k,v|
					api_args[k] = v
				end
			end
			@api_url = @base_url + args[:api_name]
			Net::HTTP.post_form( URI.parse( @api_url ), api_args )
		end
		private :make_the_call

		def check_api_key
			make_the_call({ api_name: "CheckApiKey" })
		end

		def get_all_leagues
			make_the_call({ api_name: "GetAllLeagues" })
		end

		def get_all_teams
			make_the_call({ api_name: "GetAllTeams" })
		end

		def get_all_teams_by_league_and_season(league, season)
			make_the_call({ api_name: "GetAllTeamsByLeagueAndSeason",
				              api_args: { league: league, "seasonDateString" => season } })
		end

		def get_earliest_match_date_per_league(league)
			make_the_call({ api_name: "GetEarliestMatchDatePerLeague", 
					            api_args: { league: league } })
		end

		def get_fixtures_by_date_interval(start_date, end_date)
			make_the_call({ api_name: "GetFixturesByDateInterval",
						       	  api_args: { "startDateString" => start_date,
						                      "endDateString" => end_date } })
		end

		def get_fixtures_by_date_interval_and_team(team, start_date, end_date)
	  	make_the_call({ api_name: "GetFixturesByDateIntervalAndTeam", 
	                    api_args: { "teamId" => team, "startDateString" => start_date,
	                                                  "endDateString" => end_date } })
		end

		def get_fixtures_by_date_interval_and_league(league, start_date, end_date)
	  	make_the_call({ api_name: "GetFixturesByDateIntervalAndLeague",
	                    api_args: { league: league, "startDateString" => start_date,
	                                                "endDateString" => end_date } })
		end

		def get_fixtures_by_league_and_season(league, season)
			make_the_call({ api_name: "GetFixturesByLeagueAndSeason",
	                    api_args: { league: league, "seasonDateString" => season } })
		end

		def get_historic_matches_by_fixture_match_id(fixture_match_id)
			make_the_call({ api_name: "GetHistoricMatchesByFixtureMatchID",
			              	api_args: { "Id" => fixture_match_id } })
		end

		def get_historic_matches_by_id(id)
			make_the_call({ api_name: "GetHistoricMatchesByID",
			                api_args: { "Id" => id } })
		end

		def get_historic_matches_by_league_and_date_interval(league, start_date, end_date)
			make_the_call({ api_name: "GetHistoricMatchesByLeagueAndDateInterval", 
	                    api_args: { league: league, "startDateString" => start_date,
	                                                "endDateString" => end_date } })
		end

	 	def get_historic_matches_by_league_and_season(league, season)
	  	make_the_call({ api_name: "GetHistoricMatchesByLeagueAndSeason", 
				              api_args: { league: league, "seasonDateString" => season } })
	 	end

		def get_historic_matches_by_team_and_date_interval(team, start_date, end_date)
	  	make_the_call({ api_name: "GetHistoricMatchesByTeamAndDateInterval",
                      api_args: { "teamId" => team, "startDateString" => start_date,
                                                    "endDateString" => end_date } })
		end

    def get_leagues_standings_by_season(league, season)
    	make_the_call( { api_name: "GetLeagueStandingsBySeason",
			                api_args: { league: league, "seasonDateString" => season  } })
    end

    def get_live_score
    	make_the_call( { api_name: "GetLiveScore" })
    end

 		def get_live_score_by_league(league)
    	make_the_call( { api_name: "GetLiveScoreByLeague", 
			                api_args: { league: league, } })
		end

		def get_odds_by_fixture_match_id(fixture_match_id)
	  	make_the_call({ api_name: "GetOddsByFixtureMatchId",
		                  api_args: { "fixtureMatch_Id" => fixture_match_id } })
		end

		def get_team(team)
			make_the_call({api_name: "GetTeam",
	                   api_args: { "teamName" => team } })
		end

	end
end

