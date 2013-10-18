namespace :db do
	desc "Fill database with file data"
	task populate: :environment do
		Team.create!(
			"team_id" => "45",
			"name" => "Aberdeen",
			"country" => "Scotland",
			"stadium" => "Pittodrie Stadium",
			"home_page_url" => "www.afc.co.uk",
			"wiki_link" => "http://en.wikipedia.org/wiki/Aberdeen_F.C.",
			"data_file_id" => "0",
		)
		Team.create!(
			"team_id" => "46",
			"name" => "St Johnstone",
			"country" => "Scotland",
			"stadium" => "McDiarmid Park",
			"home_page_url" => "www.perthstjohnstonefc.co.uk",
			"wiki_link" => "http://en.wikipedia.org/wiki/St._Johnstone_F.C.",
			"data_file_id" => "0",
		)
		Team.create!(
			"team_id" => "47",
			"name" => "Motherwell",
			"country" => "Scotland",
			"stadium" => "Fir Park Stadium",
			"home_page_url" => "www.motherwellfc.co.uk",
			"wiki_link" => "http://en.wikipedia.org/wiki/Motherwell_F.C.",
			"data_file_id" => "0",
		)
		Team.create!(
			"team_id" => "48",
			"name" => "Inverness C",
			"country" => "Scotland",
			"stadium" => "Caledonian Stadium",
			"home_page_url" => "ictfc.com",
			"wiki_link" => "http://en.wikipedia.org/wiki/Inverness_Caledonian_Thistle_F.C.",
			"data_file_id" => "0",
		)
		Team.create!(
			"team_id" => "49",
			"name" => "Rangers",
			"country" => "Scotland",
			"stadium" => "Ibrox Stadium",
			"home_page_url" => "www.rangers.co.uk",
			"wiki_link" => "http://en.wikipedia.org/wiki/Rangers_F.C.",
			"data_file_id" => "0",
		)
		Team.create!(
			"team_id" => "50",
			"name" => "Hearts",
			"country" => "Scotland",
			"stadium" => "Tynecastle Stadium",
			"home_page_url" => "www.heartsfc.co.uk/page/Home",
			"wiki_link" => "http://en.wikipedia.org/wiki/Heart_of_Midlothian_F.C.",
			"data_file_id" => "0",
		)
		Team.create!(
			"team_id" => "51",
			"name" => "Dundee United",
			"country" => "Scotland",
			"stadium" => "Tannadice Park",
			"home_page_url" => "www.dundeeunitedfc.co.uk",
			"wiki_link" => "http://en.wikipedia.org/wiki/Dundee_United_F.C.",
			"data_file_id" => "0",
		)
		Team.create!(
			"team_id" => "52",
			"name" => "Kilmarnock",
			"country" => "Scotland",
			"stadium" => "Rugby Park",
			"home_page_url" => "www.kilmarnockfc.co.uk/page/Home",
			"wiki_link" => "http://en.wikipedia.org/wiki/Kilmarnock_F.C.",
			"data_file_id" => "0",
		)
		Team.create!(
			"team_id" => "53",
			"name" => "Hibernian",
			"country" => "Scotland",
			"stadium" => "Easter Road",
			"home_page_url" => "www.hibernianfc.co.uk/page/Home",
			"wiki_link" => "http://en.wikipedia.org/wiki/Hibernian_F.C.",
			"data_file_id" => "0",
		)
		Team.create!(
			"team_id" => "54",
			"name" => "Celtic",
			"country" => "Scotland",
			"stadium" => "Celtic Park",
			"home_page_url" => "www.celticfc.net",
			"wiki_link" => "http://en.wikipedia.org/wiki/Celtic_F.C.",
			"data_file_id" => "0",
		)
		Team.create!(
			"team_id" => "55",
			"name" => "Dunfermline",
			"country" => "Scotland",
			"stadium" => "East End Park",
			"home_page_url" => "www.dafc.co.uk/page/Home",
			"wiki_link" => "http://en.wikipedia.org/wiki/Dunfermline_Athletic_F.C.",
			"data_file_id" => "0",
		)
		Team.create!(
			"team_id" => "56",
			"name" => "St Mirren",
			"country" => "Scotland",
			"stadium" => "St. Mirren Park",
			"home_page_url" => "http://www.saintmirren.net/pages/",
			"wiki_link" => "http://en.wikipedia.org/wiki/St._Mirren_F.C.",
			"data_file_id" => "0",
		)
		Team.create!(
			"team_id" => "228",
			"name" => "Hamilton",
			"country" => "Scotland",
			"stadium" => "New Douglas Park",
			"home_page_url" => "http://www.acciesfc.co.uk/",
			"wiki_link" => "http://en.wikipedia.org/wiki/Hamilton_Academical_F.C.",
			"data_file_id" => "0",
		)
		Team.create!(
			"team_id" => "254",
			"name" => "Falkirk",
			"country" => "Scotland",
			"stadium" => "Falkirk Stadium",
			"home_page_url" => "http://www.falkirkfc.co.uk/",
			"wiki_link" => "http://en.wikipedia.org/wiki/Falkirk_F.C.",
			"data_file_id" => "0",
		)
		Team.create!(
			"team_id" => "291",
			"name" => "Gretna",
			"country" => "Scotland",
			"stadium" => "",
			"home_page_url" => "",
			"wiki_link" => "http://en.wikipedia.org/wiki/Gretna_F.C.",
			"data_file_id" => "0",
		)
		Team.create!(
			"team_id" => "360",
			"name" => "Ross County",
			"country" => "Scotland",
			"stadium" => "Victoria Park",
			"home_page_url" => "http://www.rosscountyfootballclub.co.uk/",
			"wiki_link" => "http://en.wikipedia.org/wiki/Ross_County_F.C.",
			"data_file_id" => "0",
		)
		Team.create!(
			"team_id" => "522",
			"name" => "Dundee FC",
			"country" => "Scotland",
			"stadium" => "Dens Park",
			"home_page_url" => "http://www.dundeefc.co.uk/",
			"wiki_link" => "http://en.wikipedia.org/wiki/Dundee_F.C.",
			"data_file_id" => "0",
		)
		Team.create!(
			"team_id" => "556",
			"name" => "Airdrie Utd",
			"country" => "Scotland",
			"stadium" => "New Broomfield",
			"home_page_url" => "http://www.airdriefc.com/",
			"wiki_link" => "http://en.wikipedia.org/wiki/Airdrie_United_F.C.",
			"data_file_id" => "0",
		)
		Team.create!(
			"team_id" => "557",
			"name" => "Dumbarton",
			"country" => "Scotland",
			"stadium" => "The Bet Butler Stadium",
			"home_page_url" => "http://www.dumbartonfootballclub.com/",
			"wiki_link" => "http://en.wikipedia.org/wiki/Dumbarton_F.C.",
			"data_file_id" => "0",
		)
		Team.create!(
			"team_id" => "558",
			"name" => "Cowdenbeath",
			"country" => "Scotland",
			"stadium" => "Central Park",
			"home_page_url" => "http://www.cowdenbeathfc.com/",
			"wiki_link" => "http://en.wikipedia.org/wiki/Cowdenbeath_F.C.",
			"data_file_id" => "0",
		)
		Team.create!(
			"team_id" => "559",
			"name" => "Morton",
			"country" => "Scotland",
			"stadium" => "Cappielow Park",
			"home_page_url" => "http://www.gmfc.net/",
			"wiki_link" => "http://en.wikipedia.org/wiki/Greenock_Morton_F.C.",
			"data_file_id" => "0",
		)
		Team.create!(
			"team_id" => "560",
			"name" => "Livingston",
			"country" => "Scotland",
			"stadium" => "Almondvale Stadium",
			"home_page_url" => "http://www.livingstonfc.co.uk/",
			"wiki_link" => "http://en.wikipedia.org/wiki/Livingston_F.C.",
			"data_file_id" => "0",
		)
		Team.create!(
			"team_id" => "561",
			"name" => "Partick",
			"country" => "Scotland",
			"stadium" => "Firhill Stadium",
			"home_page_url" => "http://www.ptfc.co.uk/",
			"wiki_link" => "http://en.wikipedia.org/wiki/Partick_Thistle_F.C.",
			"data_file_id" => "0",
		)
		Team.create!(
			"team_id" => "562",
			"name" => "Raith Rvs",
			"country" => "Scotland",
			"stadium" => "Stark's Park",
			"home_page_url" => "http://www.raithrovers.net/index.php/",
			"wiki_link" => "http://en.wikipedia.org/wiki/Raith_Rovers_F.C.",
			"data_file_id" => "0",
		)
		Team.create!(
			"team_id" => "563",
			"name" => "Ayr",
			"country" => "Scotland",
			"stadium" => "Somerset Park",
			"home_page_url" => "http://www.ayrunitedfc.co.uk/",
			"wiki_link" => "http://en.wikipedia.org/wiki/Ayr_United_F.C.",
			"data_file_id" => "0",
		)
		Team.create!(
			"team_id" => "564",
			"name" => "Queen of Sth",
			"country" => "Scotland",
			"stadium" => "Palmerston Park",
			"home_page_url" => "http://www.qosfc.com/",
			"wiki_link" => "http://en.wikipedia.org/wiki/Queen_of_the_South_F.C.",
			"data_file_id" => "0",
		)
		Team.create!(
			"team_id" => "565",
			"name" => "Stirling",
			"country" => "Scotland",
			"stadium" => "Forthbank Stadium",
			"home_page_url" => "http://www.stirlingalbionfc.co.uk/",
			"wiki_link" => "http://en.wikipedia.org/wiki/Stirling_Albion_F.C.",
			"data_file_id" => "0",
		)
		Team.create!(
			"team_id" => "566",
			"name" => "Clyde",
			"country" => "Scotland",
			"stadium" => "Broadwood Stadium",
			"home_page_url" => "http://www.clydefc.co.uk/",
			"wiki_link" => "http://en.wikipedia.org/wiki/Clyde_F.C.",
			"data_file_id" => "0",
		)
		Team.create!(
			"team_id" => "674",
			"name" => "Brechin",
			"country" => "Scotland",
			"stadium" => "Glebe Park",
			"home_page_url" => "http://www.brechincity.com/",
			"wiki_link" => "http://en.wikipedia.org/wiki/Brechin_City_F.C.",
			"data_file_id" => "0",
		)
		Team.create!(
			"team_id" => "675",
			"name" => "Stranraer",
			"country" => "Scotland",
			"stadium" => "Stair Park",
			"home_page_url" => "http://www.stranraerfc.org/",
			"wiki_link" => "http://en.wikipedia.org/wiki/Stranraer_F.C.",
			"data_file_id" => "0",
		)
		Team.create!(
			"team_id" => "706",
			"name" => "Arbroath",
			"country" => "Scotland",
			"stadium" => "Gayfield Park",
			"home_page_url" => "http://www.arbroathfc.co.uk/",
			"wiki_link" => "http://en.wikipedia.org/wiki/Arbroath_F.C.",
			"data_file_id" => "0",
		)
		Team.create!(
			"team_id" => "707",
			"name" => "Alloa",
			"country" => "Scotland",
			"stadium" => "Recreation Park",
			"home_page_url" => "http://www.alloaathletic.co.uk/",
			"wiki_link" => "http://en.wikipedia.org/wiki/Alloa_Athletic_F.C.",
			"data_file_id" => "0",
		)
		Team.create!(
			"team_id" => "760",
			"name" => "Queen of South",
			"country" => "Scotland",
			"stadium" => "Palmerston Park",
			"home_page_url" => "http://www.qosfc.com/",
			"wiki_link" => "http://en.wikipedia.org/wiki/Queen_of_the_South_F.C.",
			"data_file_id" => "0",
		)
	end
end
