namespace :db do
	desc "Fill database with file data"
	task populate: :environment do
		if ENV['update'].nil?
			League.create!(
				"league_id" => "1",
				"name" => "English Premier League",
				"country" => "England",
				"historical_data" => "Yes",
				"fixtures" => "Yes",
				"livescore" => "Yes",
				"number_of_matches" => "5017",
				"latest_match_date" => "2013-10-19T16:00:00+02:00",
				"data_file_id" => "0",
			)
			League.create!(
				"league_id" => "2",
				"name" => "English League Championship",
				"country" => "England",
				"historical_data" => "Yes",
				"fixtures" => "Yes",
				"livescore" => "Yes",
				"number_of_matches" => "7408",
				"latest_match_date" => "2013-10-19T16:00:00+02:00",
				"data_file_id" => "0",
			)
			League.create!(
				"league_id" => "3",
				"name" => "Scottish Premier League",
				"country" => "Scotland",
				"historical_data" => "Yes",
				"fixtures" => "Yes",
				"livescore" => "Yes",
				"number_of_matches" => "3022",
				"latest_match_date" => "2013-10-19T16:00:00+02:00",
				"data_file_id" => "0",
			)
			League.create!(
				"league_id" => "4",
				"name" => "Bundesliga",
				"country" => "Germany",
				"historical_data" => "Yes",
				"fixtures" => "Yes",
				"livescore" => "Yes",
				"number_of_matches" => "4056",
				"latest_match_date" => "2013-10-19T15:30:00+02:00",
				"data_file_id" => "0",
			)
			League.create!(
				"league_id" => "5",
				"name" => "Serie A",
				"country" => "Italy",
				"historical_data" => "Yes",
				"fixtures" => "Yes",
				"livescore" => "Yes",
				"number_of_matches" => "4715",
				"latest_match_date" => "2013-10-18T20:45:00+02:00",
				"data_file_id" => "0",
			)
			League.create!(
				"league_id" => "6",
				"name" => "Serie B",
				"country" => "Italy",
				"historical_data" => "Yes",
				"fixtures" => "Yes",
				"livescore" => "Yes",
				"number_of_matches" => "5970",
				"latest_match_date" => "2013-10-19T15:00:00+02:00",
				"data_file_id" => "0",
			)
			League.create!(
				"league_id" => "7",
				"name" => "Ligue 1",
				"country" => "France",
				"historical_data" => "Yes",
				"fixtures" => "Yes",
				"livescore" => "Yes",
				"number_of_matches" => "4884",
				"latest_match_date" => "2013-10-18T20:30:00+02:00",
				"data_file_id" => "0",
			)
			League.create!(
				"league_id" => "8",
				"name" => "La Liga",
				"country" => "Spain",
				"historical_data" => "Yes",
				"fixtures" => "Yes",
				"livescore" => "Yes",
				"number_of_matches" => "5021",
				"latest_match_date" => "2013-10-19T16:00:00+02:00",
				"data_file_id" => "0",
			)
			League.create!(
				"league_id" => "9",
				"name" => "Superleague Greece",
				"country" => "Greece",
				"historical_data" => "Yes",
				"fixtures" => "Yes",
				"livescore" => "Yes",
				"number_of_matches" => "3135",
				"latest_match_date" => "2013-10-19T15:00:00+02:00",
				"data_file_id" => "0",
			)
			League.create!(
				"league_id" => "10",
				"name" => "Eredivisie",
				"country" => "Holland",
				"historical_data" => "Yes",
				"fixtures" => "Yes",
				"livescore" => "Yes",
				"number_of_matches" => "4058",
				"latest_match_date" => "2013-10-06T16:30:00+02:00",
				"data_file_id" => "0",
			)
			League.create!(
				"league_id" => "11",
				"name" => "Jupiler League",
				"country" => "Belgium",
				"historical_data" => "Yes",
				"fixtures" => "Yes",
				"livescore" => "Yes",
				"number_of_matches" => "3731",
				"latest_match_date" => "2013-10-18T20:30:00+02:00",
				"data_file_id" => "0",
			)
			League.create!(
				"league_id" => "12",
				"name" => "Süper Lig",
				"country" => "Turkey",
				"historical_data" => "Yes",
				"fixtures" => "Yes",
				"livescore" => "Yes",
				"number_of_matches" => "4009",
				"latest_match_date" => "2013-10-19T15:00:00+02:00",
				"data_file_id" => "0",
			)
			League.create!(
				"league_id" => "14",
				"name" => "Superliga",
				"country" => "Denmark",
				"historical_data" => "Partial",
				"fixtures" => "Yes",
				"livescore" => "Yes",
				"number_of_matches" => "460",
				"latest_match_date" => "2013-10-18T18:30:00+02:00",
				"data_file_id" => "0",
			)
			League.create!(
				"league_id" => "15",
				"name" => "EURO 2012",
				"country" => "Europe",
				"historical_data" => "Partial",
				"fixtures" => "False",
				"livescore" => "False",
				"number_of_matches" => "31",
				"latest_match_date" => "2012-07-01T20:45:00+02:00",
				"data_file_id" => "0",
			)
			League.create!(
				"league_id" => "16",
				"name" => "Champions League",
				"country" => "Europe",
				"historical_data" => "Partial",
				"fixtures" => "Yes",
				"livescore" => "Yes",
				"number_of_matches" => "429",
				"latest_match_date" => "2013-10-02T20:45:00+02:00",
				"data_file_id" => "0",
			)
			League.create!(
				"league_id" => "17",
				"name" => "Europe League",
				"country" => "Europe",
				"historical_data" => "Partial",
				"fixtures" => "Yes",
				"livescore" => "Yes",
				"number_of_matches" => "939",
				"latest_match_date" => "2013-10-03T21:05:00+02:00",
				"data_file_id" => "0",
			)
			League.create!(
				"league_id" => "18",
				"name" => "Primeira Liga",
				"country" => "Portugal",
				"historical_data" => "Partial",
				"fixtures" => "Yes",
				"livescore" => "Yes",
				"number_of_matches" => "275",
				"latest_match_date" => "2013-10-07T21:15:00+02:00",
				"data_file_id" => "0",
			)
			League.create!(
				"league_id" => "19",
				"name" => "Scottish First Division",
				"country" => "Scotland",
				"historical_data" => "Yes",
				"fixtures" => "Yes",
				"livescore" => "Yes",
				"number_of_matches" => "2402",
				"latest_match_date" => "2013-10-19T16:00:00+02:00",
				"data_file_id" => "0",
			)
			League.create!(
				"league_id" => "20",
				"name" => "Major League Soccer",
				"country" => "USA",
				"historical_data" => "Partial",
				"fixtures" => "Yes",
				"livescore" => "Yes",
				"number_of_matches" => "295",
				"latest_match_date" => "2013-10-19T02:00:00+02:00",
				"data_file_id" => "0",
			)
			League.create!(
				"league_id" => "33",
				"name" => "Allsvenskan",
				"country" => "Sweden",
				"historical_data" => "Partial",
				"fixtures" => "Yes",
				"livescore" => "Yes",
				"number_of_matches" => "210",
				"latest_match_date" => "2013-10-19T16:00:00+02:00",
				"data_file_id" => "0",
			)
			League.create!(
				"league_id" => "34",
				"name" => "FA Cup",
				"country" => "England",
				"historical_data" => "Partial",
				"fixtures" => "Yes",
				"livescore" => "Yes",
				"number_of_matches" => "12",
				"latest_match_date" => "2013-05-11T18:15:00+02:00",
				"data_file_id" => "0",
			)
			League.create!(
				"league_id" => "35",
				"name" => "League Cup",
				"country" => "England",
				"historical_data" => "Partial",
				"fixtures" => "Yes",
				"livescore" => "Yes",
				"number_of_matches" => "53",
				"latest_match_date" => "2013-09-25T21:00:00+02:00",
				"data_file_id" => "0",
			)
			League.create!(
				"league_id" => "36",
				"name" => "Mexican Primera League",
				"country" => "Mexico",
				"historical_data" => "Partial",
				"fixtures" => "Yes",
				"livescore" => "Yes",
				"number_of_matches" => "207",
				"latest_match_date" => "2013-10-19T04:30:00+02:00",
				"data_file_id" => "0",
			)
			League.create!(
				"league_id" => "37",
				"name" => "Brasileirao",
				"country" => "Brazil",
				"historical_data" => "Partial",
				"fixtures" => "Yes",
				"livescore" => "Yes",
				"number_of_matches" => "315",
				"latest_match_date" => "2013-10-18T02:00:00+02:00",
				"data_file_id" => "0",
			)
			League.create!(
				"league_id" => "38",
				"name" => "English League 1",
				"country" => "England",
				"historical_data" => "Yes",
				"fixtures" => "Yes",
				"livescore" => "Yes",
				"number_of_matches" => "704",
				"latest_match_date" => "2013-10-19T16:00:00+02:00",
				"data_file_id" => "0",
			)
			League.create!(
				"league_id" => "39",
				"name" => "English League 2",
				"country" => "England",
				"historical_data" => "Yes",
				"fixtures" => "Yes",
				"livescore" => "Yes",
				"number_of_matches" => "707",
				"latest_match_date" => "2013-10-19T16:00:00+02:00",
				"data_file_id" => "0",
			)
			League.create!(
				"league_id" => "40",
				"name" => "Ukrainian Premier League",
				"country" => "Ukraine",
				"historical_data" => "Partial",
				"fixtures" => "Yes",
				"livescore" => "Yes",
				"number_of_matches" => "18",
				"latest_match_date" => "2013-10-19T16:00:00+02:00",
				"data_file_id" => "0",
			)
			League.create!(
				"league_id" => "41",
				"name" => "Russian Football Premier League ",
				"country" => "Russia",
				"historical_data" => "Partial",
				"fixtures" => "Yes",
				"livescore" => "Yes",
				"number_of_matches" => "18",
				"latest_match_date" => "2013-10-19T15:00:00+02:00",
				"data_file_id" => "0",
			)
		end
	end
end
