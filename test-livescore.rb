#!/Users/jimcar/.rvm/rubies/ruby-2.0.0-p247/bin/ruby -w
#coding:utf-8

require 'net/https'
require "rubygems"
require "json"
require "uri"
require "Nokogiri"

SLEEP = 15

xmlsoccer_config = JSON.parse(File.open('xmlsoccer_config.json').read)
@base_url = xmlsoccer_config['base_url']
@api_key = xmlsoccer_config['api_key']
@current_season = "1314"
@previous_season = "1213"

@seasons = { "1314" => {:start_date => "2013-08-01", :end_date => "2014-08-01"},
             "1213" => {:start_date => "2012-08-01", :end_date => "2013-08-01"},
             "1112" => {:start_date => "2011-08-01", :end_date => "2012-08-01"},
             "1011" => {:start_date => "2010-08-01", :end_date => "2011-08-01"},
             "0910" => {:start_date => "2009-08-01", :end_date => "2010-08-01"}, }


# ---------------------------------------------------------------------------
#  Name: get_xml_file_name
#  Desc:
# ---------------------------------------------------------------------------
def get_xml_file_name( jmc_args )

	# puts "==> get_xml_file_name( #{jmc_args[:api_name]} )"

	@xml_root_names = {
		"CheckApiKey"                               => "ApiKey",
		"GetAllLeagues"                             => "AllLeagues",
		"GetAllTeams"                               => "AllTeams",
		"GetAllTeamsByLeagueAndSeason"              => "Teams",
		"GetEarliestMatchDatePerLeague"             => "EarliestMatchDate",
		"GetFixturesByDateInterval"                 => "Fixtures",
		"GetFixturesByDateIntervalAndTeam"          => "Fixtures",
		"GetFixturesByDateIntervalAndLeague"        => "Fixtures",
		"GetFixturesByLeagueAndSeason"              => "Fixtures",
		"GetHistoricMatchesByFixtureMatchID"        => "HistoricMatches",
		"GetHistoricMatchesByID"                    => "HistoricMatches",
		"GetHistoricMatchesByLeagueAndDateInterval" => "HistoricMatches",
		"GetHistoricMatchesByLeagueAndSeason"       => "HistoricMatches",
		"GetHistoricMatchesByTeamAndDateInterval"   => "HistoricMatches",
		"GetHistoricMatchesByTeamsAndDateInterval"  => "HistoricMatches",
		"GetLeagueStandingsBySeason"                => "LeagueStandings",
		"GetLiveScore"                              => "LiveScore",
		"GetLiveScoreByLeague"                      => "LiveScore",
		"GetOddsByFixtureMatchId"                   => "Odds",
		"GetTeam"                                   => "Team",
	}

    appendage = ""
	unless jmc_args[:api_args].nil?
		unless jmc_args[:api_args]['league'].nil?
			appendage += "-league#{jmc_args[:api_args]['league']}"
		end
		unless jmc_args[:api_args]['seasonDateString'].nil?
			appendage += "-#{jmc_args[:api_args]['seasonDateString']}"
		end
		unless jmc_args[:api_args]['teamId'].nil?
			appendage += "-team#{jmc_args[:api_args]['teamId']}"
		end
		unless jmc_args[:api_args]['team1Id'].nil? or jmc_args[:api_args]['team2Id'].nil?
			appendage += "-#{jmc_args[:api_args]['team1Id']}-vs-#{jmc_args[:api_args]['team2Id']}"
		end
		unless jmc_args[:api_args]['startDateString'].nil? or jmc_args[:api_args]['endDateString'].nil?
			appendage += "-#{jmc_args[:api_args]['startDateString']}-to-#{jmc_args[:api_args]['endDateString']}"
		end
		unless jmc_args[:api_args]['teamName'].nil?
			appendage += "-#{jmc_args[:api_args]['teamName']}"
		end
		unless jmc_args[:api_args]['Id'].nil?
			appendage += "-#{jmc_args[:api_args]['Id']}"
		end
		unless jmc_args[:api_args]['fixtureMatch_Id'].nil?
			appendage += "-#{jmc_args[:api_args]['fixtureMatch_Id']}"
		end
		unless jmc_args[:rename_idx].nil?
			appendage += "-#{jmc_args[:rename_idx]}"
		end
	end
	xml_file_name = "./XML/" + @xml_root_names[jmc_args[:api_name]] + appendage + ".xml"

	# puts "<== get_xml_file_name( #{jmc_args[:api_name]} ) : #{xml_file_name}"
	return xml_file_name
end


# ---------------------------------------------------------------------------
#  Name: get_xml_doc
#  Desc: Service XMLsoccer data request by returning Nokogiri XML object.
#        The data is fetched from the API and cached.  Future requests
#        return previously cached data as appropriate.
# ---------------------------------------------------------------------------
def get_xml_doc( jmc_args )

	xml_file = get_xml_file_name( jmc_args )

	puts "Testing #{jmc_args[:api_name]}"

	if jmc_args[:get_xml] == false or File.exist?(xml_file)
		# Read the cached copy
		puts "Reading " + xml_file
		f = open( xml_file, "r")
		xml_doc = f.read
		f.close
	else
		api_args = { "ApiKey" => @api_key }
		unless jmc_args[:api_args].nil?
			jmc_args[:api_args].each do |k,v|
				api_args[k] = v
			end
		end
		
		# Get the document from XMLsoccer
		@api_url = @base_url + jmc_args[:api_name]
		response = Net::HTTP.post_form( URI.parse( @api_url ), api_args )
		
		# Cache the XML document
		puts "writing xml doc to file"
		f = open( xml_file, "w" )
		f.puts( response.body )
		puts "#{xml_file} written"
		f.close

		# XMLsoccer requirement sleep for 15 seconds between requests to the same API call
		unless jmc_args[:sleep].nil? or jmc_args[:sleep] == 0
			puts "Sleeping for #{jmc_args[:sleep]} seconds...zzzzzzzz....."
			sleep jmc_args[:sleep]
		end
	end

   	puts '--------------------------------'
	return Nokogiri::XML( xml_doc )
end


# ---------------------------------------------------------------------------
#  Name: test_CheckApiKey
#  Desc:
# ---------------------------------------------------------------------------
def test_CheckApiKey
	@xml_doc = get_xml_doc( { :api_name => "CheckApiKey", :get_xml => true, } )
end


# ---------------------------------------------------------------------------
#  Name: test_GetAllLeagues
#  Desc:
# ---------------------------------------------------------------------------
def test_GetAllLeagues
	@xml_doc = get_xml_doc( {:api_name => "GetAllLeagues", :get_xml => true } )

	@xml_doc.xpath("//League").each do |node|
		puts node.xpath("Id").text + ' ' + node.xpath("Country").text + ': ' + node.xpath("Name").text
	end
	puts '--------------------------------'

	# @xml_doc.xpath("//League/Id").each do |node|
	# 	puts node.text
	# end

	@league_ids = @xml_doc.xpath("//League/Id").map{ |node| node.text }
	puts "Dumping array of league ids"
	puts @league_ids

	@league_names = @xml_doc.xpath("//League/Name").map{ |node| node.text }
	puts "Dumping array of league names"
	puts @league_names
end


# ---------------------------------------------------------------------------
#  Name: test_GetAllTeams
#  Desc:
# ---------------------------------------------------------------------------
def test_GetAllTeams
	@xml_doc = get_xml_doc( {:api_name => "GetAllTeams", :get_xml => true } )
end
	

# ---------------------------------------------------------------------------
#  Name: test_GetAllTeamsByLeagueAndSeason
#  Desc:
# ---------------------------------------------------------------------------
def test_GetAllTeamsByLeagueAndSeason

	api_name = "GetAllTeamsByLeagueAndSeason"
	@league_ids = [ 3, "Scottish Premier League" ]
	@league_ids.each do |league|
		sleep_time = (league == @league_ids.last) ? 0 : SLEEP
		@xml_doc = get_xml_doc( { :api_name => api_name, :get_xml => true, :sleep => sleep_time,
			                      :api_args => { "league" => league, "seasonDateString" => @current_season } })
	end
end


# ---------------------------------------------------------------------------
#  Name: test_GetEarliestMatchDatePerLeague
#  Desc:
# ---------------------------------------------------------------------------
def test_GetEarliestMatchDatePerLeague

	api_name = "GetEarliestMatchDatePerLeague"
	@league_ids = [ 3 ]
	@league_ids.each do |league|
		@xml_doc = get_xml_doc( { :api_name => api_name, :get_xml => true, 
			                      :api_args => { "league" => league, } })
	end
end


# ---------------------------------------------------------------------------
#  Name: test_GetFixturesByDateInterval
#  Desc:
# ---------------------------------------------------------------------------
def test_GetFixturesByDateInterval

	api_name = "GetFixturesByDateInterval"

	["0910", "1011", "1112", @previous_season, @current_season].each do |season|
		sleep_time = (season == @current_season) ? 0 : SLEEP
		start_date = @seasons[season][:start_date]
		end_date = @seasons[season][:end_date]
		@xml_doc = get_xml_doc( { :api_name => api_name, :get_xml => true, :sleep => sleep_time,
		                     	  :api_args => { "startDateString" => start_date,
		                                        "endDateString" => end_date } })
	end
end

# ---------------------------------------------------------------------------
#  Name: test_GetFixturesByDateIntervalAndTeam
#  Desc:
# ---------------------------------------------------------------------------
def test_GetFixturesByDateIntervalAndTeam

	api_name = "GetFixturesByDateIntervalAndTeam"
	@team_ids = [ 54, "Celtic", "Rangers" ]
	@team_ids.each do |team|
		sleep_time = (team == @team_ids.last) ? 0 : SLEEP
		@xml_doc = get_xml_doc( { :api_name => api_name, :get_xml => true, :sleep => sleep_time,
			                      :api_args => { "teamId" => team, "startDateString" => "2013-08-01",
			                                                       "endDateString" => "2014-08-01" } })
	end
end


# ---------------------------------------------------------------------------
#  Name: test_GetFixturesByDateIntervalAndLeague
#  Desc:
# ---------------------------------------------------------------------------
def test_GetFixturesByDateIntervalAndLeague

	api_name = "GetFixturesByDateIntervalAndLeague"
	@league_ids = [ 3 ]
	@league_ids.each do |league|
		
		@xml_doc = get_xml_doc( { :api_name => api_name, :get_xml => true, 
			                      :api_args => { "league" => league, "startDateString" => "2013-08-01",
			                                                         "endDateString" => "2014-08-01" } })
	end
end


# ---------------------------------------------------------------------------
#  Name: test_GetFixturesByLeagueAndSeason
#  Desc:
# ---------------------------------------------------------------------------
def test_GetFixturesByLeagueAndSeason
	
	api_name = "GetFixturesByLeagueAndSeason"

	@league_ids = [ 3, "Scottish Premier League" ]
	@league_ids.each do |league|
		sleep_time = (league == @league_ids.last) ? 0 : SLEEP
		@xml_doc = get_xml_doc( { :api_name => api_name, :get_xml => true, :sleep => sleep_time,
			                      :api_args => { "league" => league, "seasonDateString" => @current_season } })
	end
end


# ---------------------------------------------------------------------------
#  Name: test_GetHistoricMatchesByFixtureMatchID
#  Desc:
# ---------------------------------------------------------------------------
def test_GetHistoricMatchesByFixtureMatchID

	fixture_id = "309391"
	api_name = "GetHistoricMatchesByFixtureMatchID"
	@xml_doc = get_xml_doc( { :api_name => api_name, :get_xml => true, 
		                      :api_args => { "Id" => fixture_id } })
end


#---------------------------------------------------------------------------
#  Name: test_GetHistoricMatchesByID
#  Desc: Unclear how this differs from GetHistoricMatchesByFixtureMatchID
# ---------------------------------------------------------------------------
def test_GetHistoricMatchesByID

	fixture_id = "309389"
	api_name = "GetHistoricMatchesByID"
	@xml_doc = get_xml_doc( { :api_name => api_name, :get_xml => true, 
		                      :api_args => { "Id" => fixture_id } })
end


# ---------------------------------------------------------------------------
#  Name: test_GetHistoricMatchesByLeagueAndDateInterval
#  Desc:
# ---------------------------------------------------------------------------
def test_GetHistoricMatchesByLeagueAndDateInterval

	api_name = "GetHistoricMatchesByLeagueAndDateInterval"
	@league_ids = [ 3 ]
	@league_ids.each do |league|
		
		@xml_doc = get_xml_doc( { :api_name => api_name, :get_xml => true, 
			                      :api_args => { "league" => league, "startDateString" => "2013-08-01",
			                                                         "endDateString" => "2014-08-01" } })
	end
end


# ---------------------------------------------------------------------------
#  Name: test_GetHistoricMatchesByLeagueAndSeason
#  Desc:
# ---------------------------------------------------------------------------
def test_GetHistoricMatchesByLeagueAndSeason

	api_name = "GetHistoricMatchesByLeagueAndSeason"
	@league_ids = [ 3 ]
	@league_ids.each do |league|
		
		@xml_doc = get_xml_doc( { :api_name => api_name, :get_xml => true, 
			                      :api_args => { "league" => league, "seasonDateString" => @current_season } })
	end
end


# ---------------------------------------------------------------------------
#  Name: test_GetHistoricMatchesByTeamAndDateInterval
#  Desc:
# ---------------------------------------------------------------------------
def test_GetHistoricMatchesByTeamAndDateInterval

	api_name = "GetHistoricMatchesByTeamAndDateInterval"
	@team_ids = [ 54, "Hearts" ]
	@team_ids.each do |team|
		sleep_time = (team == @team_ids.last) ? 0 : SLEEP
		@xml_doc = get_xml_doc( { :api_name => api_name, :get_xml => true, :sleep => sleep_time,
			                      :api_args => { "teamId" => team, "startDateString" => "2013-08-01",
			                                                         "endDateString" => "2014-08-01" } })
	end
end


# ---------------------------------------------------------------------------
#  Name: test_GetHistoricMatchesByTeamsAndDateInterval
#  Desc:
# ---------------------------------------------------------------------------
def test_GetHistoricMatchesByTeamsAndDateInterval

	api_name = "GetHistoricMatchesByTeamsAndDateInterval"
	@team_ids = [ {:t1 => 54, :t2 => 45}, {:t1 => 53, :t2 => 47}, {:t1 => 51, :t2 => 561}, {:t1 => 47, :t2 => 53}, 
		          {:t1 => "Hearts", :t2 => "Celtic"}, {:t1 => "Hibernian", :t2 => "Motherwell"}, ]
	@team_ids.each do |team|
		sleep_time = (team[:t1] == @team_ids.last[:t1]) ? 0 : SLEEP
		@xml_doc = get_xml_doc( { :api_name => api_name, :get_xml => true, :sleep => sleep_time,
		                          :api_args => { "team1Id" => team[:t1], "team2Id" => team[:t2], 
		                      	                 "startDateString" => "2013-08-01", "endDateString" => "2014-08-01"  } })
	end
end


# ---------------------------------------------------------------------------
#  Name: test_GetLeagueStandingsBySeason
#  Desc:
# ---------------------------------------------------------------------------
def test_GetLeagueStandingsBySeason

	api_name = "GetLeagueStandingsBySeason"
	@league_ids = [ 3 ]
	@league_ids.each do |league|
		@xml_doc = get_xml_doc( { :api_name => api_name, :get_xml => true, 
			                      :api_args => { "league" => league, "seasonDateString" => @current_season  } })
	end
end


# ---------------------------------------------------------------------------
#  Name: test_GetLiveScore
#  Desc:
# ---------------------------------------------------------------------------
def test_GetLiveScore
	@xml_doc = get_xml_doc( {:api_name => "GetLiveScore", :get_xml => true } )
end
	

# ---------------------------------------------------------------------------
#  Name: test_GetLiveScoreByLeague
#  Desc:
# ---------------------------------------------------------------------------
def test_GetLiveScoreByLeague

	api_name = "GetLiveScoreByLeague"
	sleep_time = 15
	rename_idx = 100

	@league_ids = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 4, 16, 17, 18, 19, 20, 33, 45, 36, 37, 38, 39, 40, 41 ]
	(101..120).each do |rename_idx|
		@league_ids.each do |league|
			rename_idx_name = "#{league}-#{rename_idx}"
			@xml_doc = get_xml_doc( { :api_name => api_name, :get_xml => true, 
				                      :api_args => { "league" => league, },
				                      :sleep => sleep_time, :rename_idx => rename_idx_name,
			 })
		end
	end
end


# ---------------------------------------------------------------------------
#  Name: test_GetOddsByFixtureMatchId
#  Desc:
# ---------------------------------------------------------------------------
def test_GetOddsByFixtureMatchId

	fixture_id = "309391"
	api_name = "GetOddsByFixtureMatchId"
	@xml_doc = get_xml_doc( { :api_name => api_name, :get_xml => true, 
		                     :api_args => { "fixtureMatch_Id" => fixture_id } })
end


# ---------------------------------------------------------------------------
#  Name: test_GetTeam
#  Desc:
# ---------------------------------------------------------------------------
def test_GetTeam

	api_name =  "GetTeam"
	sleep_time = SLEEP
	@teams = [ 50, "Hearts"]
	@teams.each do |team|
		sleep_time = 0 if team == @teams.last
		@xml_doc = get_xml_doc( {:api_name => api_name, :get_xml => true, :sleep => sleep_time,
	                         	 :api_args => { "teamName" => team } })
	end
end

# ---------------------------------------------------------------------------
#  Name: test_XMLSoccer
#  Desc:
# ---------------------------------------------------------------------------
def test_XMLSoccer

	puts '--------------------------------'
	test_CheckApiKey
	test_GetAllLeagues
	test_GetAllTeams
	test_GetAllTeamsByLeagueAndSeason
	test_GetEarliestMatchDatePerLeague
	test_GetFixturesByDateInterval
	test_GetFixturesByDateIntervalAndTeam
	test_GetFixturesByDateIntervalAndLeague
	test_GetFixturesByLeagueAndSeason
	test_GetHistoricMatchesByFixtureMatchID
	test_GetHistoricMatchesByID
	test_GetHistoricMatchesByLeagueAndDateInterval
	test_GetHistoricMatchesByLeagueAndSeason
	test_GetHistoricMatchesByTeamAndDateInterval
	test_GetHistoricMatchesByTeamsAndDateInterval
	test_GetLeagueStandingsBySeason
	test_GetLiveScore
	test_GetLiveScoreByLeague
	test_GetOddsByFixtureMatchId
	test_GetTeam

end

test_GetLiveScore

test_GetLiveScoreByLeague



# test_XMLSoccer

