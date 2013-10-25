namespace :db do
	desc "Fill database with file data"
	task populate: :environment do
		if ENV['update'].nil?
			Team.create!(
				"team_id" => "1",
				"name" => "Birmingham",
				"country" => "England",
				"stadium" => "St Andrews",
				"home_page_url" => "http://www.bcfc.com",
				"wiki_link" => "http://en.wikipedia.org/wiki/Birmingham_City_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "2",
				"name" => "Blackburn",
				"country" => "England",
				"stadium" => "Ewood Park",
				"home_page_url" => "http://www.bcfc.com",
				"wiki_link" => "http://en.wikipedia.org/wiki/Birmingham_City_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "3",
				"name" => "Wolves",
				"country" => "England",
				"stadium" => "Molineux Stadium",
				"home_page_url" => "http://www.wolves.co.uk/page/Welcome",
				"wiki_link" => "http://en.wikipedia.org/wiki/Wolverhampton_Wanderers_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "4",
				"name" => "Fulham",
				"country" => "England",
				"stadium" => "Craven Cottage",
				"home_page_url" => "http://www.fulhamfc.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Fulham_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "5",
				"name" => "Aston Villa",
				"country" => "England",
				"stadium" => "Villa Park",
				"home_page_url" => "http://www.avfc.co.uk/9laI7Jw",
				"wiki_link" => "http://en.wikipedia.org/wiki/Aston_Villa_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "6",
				"name" => "Liverpool",
				"country" => "England",
				"stadium" => "Anfield",
				"home_page_url" => "http://www.liverpoolfc.tv/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Liverpool_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "7",
				"name" => "Sunderland",
				"country" => "England",
				"stadium" => "Stadium of Light",
				"home_page_url" => "http://www.safc.com",
				"wiki_link" => "http://en.wikipedia.org/wiki/Sunderland_A.F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "8",
				"name" => "Newcastle",
				"country" => "England",
				"stadium" => "St James' Park",
				"home_page_url" => "http://www.nufc.co.uk/page/Welcome/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Newcastle_United_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "9",
				"name" => "Arsenal",
				"country" => "England",
				"stadium" => "Emirates Stadium",
				"home_page_url" => "http://www.arsenal.com",
				"wiki_link" => "http://en.wikipedia.org/wiki/Arsenal_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "10",
				"name" => "QPR",
				"country" => "England",
				"stadium" => "Loftus Road",
				"home_page_url" => "http://www.qpr.co.uk/page/Welcome",
				"wiki_link" => "http://en.wikipedia.org/wiki/Queens_Park_Rangers_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "11",
				"name" => "Bolton",
				"country" => "England",
				"stadium" => "Reebok Stadium",
				"home_page_url" => "http://www.bwfc.co.uk",
				"wiki_link" => "http://en.wikipedia.org/wiki/Bolton_Wanderers_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "12",
				"name" => "Wigan",
				"country" => "England",
				"stadium" => "DW Stadium",
				"home_page_url" => "http://www.wiganlatics.co.uk",
				"wiki_link" => "http://en.wikipedia.org/wiki/Wigan_Athletic_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "13",
				"name" => "Norwich",
				"country" => "England",
				"stadium" => "Carrow Road",
				"home_page_url" => "http://www.canaries.co.uk/page/Home",
				"wiki_link" => "http://en.wikipedia.org/wiki/Norwich_City_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "14",
				"name" => "Stoke",
				"country" => "England",
				"stadium" => "Britannia Stadium",
				"home_page_url" => "http://www.stokecityfc.com",
				"wiki_link" => "http://en.wikipedia.org/wiki/Stoke_City_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "15",
				"name" => "Chelsea",
				"country" => "England",
				"stadium" => "Stamford Bridge",
				"home_page_url" => "http://www.chelseafc.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Chelsea_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "16",
				"name" => "West Brom",
				"country" => "England",
				"stadium" => "The Hawthorns",
				"home_page_url" => "http://www.wba.co.uk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/West_Bromwich_Albion_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "17",
				"name" => "Man United",
				"country" => "England",
				"stadium" => "Old Trafford",
				"home_page_url" => "http://www.manutd.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Manchester_United_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "18",
				"name" => "Man City",
				"country" => "England",
				"stadium" => "City of Manchester Stadium",
				"home_page_url" => "http://www.mcfc.co.uk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Manchester_City_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "19",
				"name" => "Swansea",
				"country" => "England",
				"stadium" => "Liberty Stadium",
				"home_page_url" => "http://www.swanseacity.net",
				"wiki_link" => "http://en.wikipedia.org/wiki/Swansea_City_A.F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "20",
				"name" => "Everton",
				"country" => "England",
				"stadium" => "Goodison Park",
				"home_page_url" => "http://www.evertonfc.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Everton_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "21",
				"name" => "Tottenham",
				"country" => "England",
				"stadium" => "White Hart Lane",
				"home_page_url" => "http://www.tottenhamhotspur.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Tottenham_Hotspur_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "22",
				"name" => "Hull",
				"country" => "England",
				"stadium" => "KC Stadium",
				"home_page_url" => "http://www.hullcityafc.net",
				"wiki_link" => "http://en.wikipedia.org/wiki/Hull_City_A.F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "23",
				"name" => "Blackpool",
				"country" => "England",
				"stadium" => "Bloomfield Road",
				"home_page_url" => "http://www.blackpoolfc.co.uk",
				"wiki_link" => "http://en.wikipedia.org/wiki/Blackpool_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "24",
				"name" => "Brighton",
				"country" => "England",
				"stadium" => "Falmer Stadium",
				"home_page_url" => "www.seagulls.co.uk",
				"wiki_link" => "http://en.wikipedia.org/wiki/Brighton_%26_Hove_Albion_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "25",
				"name" => "Doncaster",
				"country" => "England",
				"stadium" => "Keepmoat Stadium",
				"home_page_url" => "www.doncasterroversfc.co.uk",
				"wiki_link" => "http://en.wikipedia.org/wiki/Doncaster_Rovers_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "26",
				"name" => "Bristol City",
				"country" => "England",
				"stadium" => "Ashton Gate",
				"home_page_url" => "http://www.bcfc.co.uk",
				"wiki_link" => "http://en.wikipedia.org/wiki/Bristol_City_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "27",
				"name" => "Ipswich",
				"country" => "England",
				"stadium" => "Portman Road",
				"home_page_url" => "http://www.itfc.co.uk",
				"wiki_link" => "http://en.wikipedia.org/wiki/Ipswich_Town_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "28",
				"name" => "Burnley",
				"country" => "England",
				"stadium" => "Turf Moor",
				"home_page_url" => "www.burnleyfootballclub.com",
				"wiki_link" => "en.wikipedia.org/wiki/Burnley_F.C",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "29",
				"name" => "Watford",
				"country" => "England",
				"stadium" => "Vicarage Road",
				"home_page_url" => "http://www.watfordfc.com",
				"wiki_link" => "http://en.wikipedia.org/wiki/Watford_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "30",
				"name" => "Coventry",
				"country" => "England",
				"stadium" => "Ricoh Arena",
				"home_page_url" => "http://www.ccfc.co.uk",
				"wiki_link" => "http://en.wikipedia.org/wiki/Coventry_City_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "31",
				"name" => "Leicester",
				"country" => "England",
				"stadium" => "King Power Stadium",
				"home_page_url" => "http://www.lcfc.com",
				"wiki_link" => "http://en.wikipedia.org/wiki/Leicester_City_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "32",
				"name" => "Derby",
				"country" => "England",
				"stadium" => "Pride Park Stadium",
				"home_page_url" => "http://www.dcfc.co.uk",
				"wiki_link" => "http://en.wikipedia.org/wiki/Derby_County_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "33",
				"name" => "Middlesbrough",
				"country" => "England",
				"stadium" => "Riverside Stadium",
				"home_page_url" => "http://www.mfc.co.uk",
				"wiki_link" => "http://en.wikipedia.org/wiki/Middlesbrough_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "34",
				"name" => "Portsmouth",
				"country" => "England",
				"stadium" => "Fratton Park",
				"home_page_url" => "http://www.portsmouthfc.co.uk",
				"wiki_link" => "http://en.wikipedia.org/wiki/Portsmouth_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "36",
				"name" => "Barnsley",
				"country" => "England",
				"stadium" => "Oakwell",
				"home_page_url" => "www.barnsleyfc.co.uk",
				"wiki_link" => "http://en.wikipedia.org/wiki/Barnsley_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "37",
				"name" => "Peterboro",
				"country" => "England",
				"stadium" => "London Road Stadium",
				"home_page_url" => "http://www.theposh.com",
				"wiki_link" => "http://en.wikipedia.org/wiki/Peterborough_United_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "38",
				"name" => "Crystal Palace",
				"country" => "England",
				"stadium" => "Selhurst Park",
				"home_page_url" => "http://www.cpfc.co.uk/page/Welcome",
				"wiki_link" => "http://en.wikipedia.org/wiki/Crystal_Palace_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "39",
				"name" => "Reading",
				"country" => "England",
				"stadium" => "Madejski Stadium",
				"home_page_url" => "http://www.readingfc.co.uk",
				"wiki_link" => "http://en.wikipedia.org/wiki/Reading_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "40",
				"name" => "Millwall",
				"country" => "England",
				"stadium" => "The Den",
				"home_page_url" => "www.millwallfc.co.uk",
				"wiki_link" => "http://en.wikipedia.org/wiki/Millwall_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "41",
				"name" => "Southampton",
				"country" => "England",
				"stadium" => "St Mary's Stadium",
				"home_page_url" => "http://www.saintsfc.co.uk",
				"wiki_link" => "http://en.wikipedia.org/wiki/Southampton_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "42",
				"name" => "Leeds",
				"country" => "England",
				"stadium" => "Elland Road",
				"home_page_url" => "www.leedsunited.com",
				"wiki_link" => "http://en.wikipedia.org/wiki/Leeds_United_A.F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "43",
				"name" => "West Ham",
				"country" => "England",
				"stadium" => "The Boleyn Ground",
				"home_page_url" => "www.whufc.com",
				"wiki_link" => "http://en.wikipedia.org/wiki/West_Ham_United_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "44",
				"name" => "Cardiff",
				"country" => "England",
				"stadium" => "Cardiff City Stadium",
				"home_page_url" => "www.cardiffcityfc.co.uk",
				"wiki_link" => "http://en.wikipedia.org/wiki/Cardiff_City_F.C.",
				"data_file_id" => "0",
			)
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
				"team_id" => "57",
				"name" => "Dortmund",
				"country" => "Germany",
				"stadium" => "Westfalenstadion",
				"home_page_url" => "www.bvb.de",
				"wiki_link" => "http://en.wikipedia.org/wiki/Borussia_Dortmund",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "58",
				"name" => "Hamburg",
				"country" => "Germany",
				"stadium" => "Imtech Arena",
				"home_page_url" => "www.hsv.de",
				"wiki_link" => "http://en.wikipedia.org/wiki/Hamburger_SV",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "59",
				"name" => "Augsburg",
				"country" => "Germany",
				"stadium" => "SGL arena",
				"home_page_url" => "http://www.fcaugsburg.de/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Augsburg",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "60",
				"name" => "Freiburg",
				"country" => "Germany",
				"stadium" => "Mage Solar Stadion",
				"home_page_url" => "www.scfreiburg.com",
				"wiki_link" => "http://en.wikipedia.org/wiki/SC_Freiburg",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "61",
				"name" => "FC Koln",
				"country" => "Germany",
				"stadium" => "RheinEnergieStadion",
				"home_page_url" => "www.fc-koeln.de",
				"wiki_link" => "http://en.wikipedia.org/wiki/1._FC_K%C3%B6ln",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "62",
				"name" => "Wolfsburg",
				"country" => "Germany",
				"stadium" => "Volkswagen Arena",
				"home_page_url" => "http://www.vfl-wolfsburg.de/",
				"wiki_link" => "http://en.wikipedia.org/wiki/VfL_Wolfsburg",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "63",
				"name" => "Hannover",
				"country" => "Germany",
				"stadium" => "AWD-Arena",
				"home_page_url" => "http://www.hannover96.de/CDA/index.php?id=7767",
				"wiki_link" => "http://en.wikipedia.org/wiki/Hannover_96",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "64",
				"name" => "Hoffenheim",
				"country" => "Germany",
				"stadium" => "Rhein-Neckar-Arena",
				"home_page_url" => "www.achtzehn99.de",
				"wiki_link" => "http://en.wikipedia.org/wiki/TSG_1899_Hoffenheim",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "65",
				"name" => "Hertha",
				"country" => "Germany",
				"stadium" => "Olympic Stadium",
				"home_page_url" => "http://www.hertha.de/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Hertha_BSC",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "66",
				"name" => "Nurnberg",
				"country" => "Germany",
				"stadium" => "Frankenstadion",
				"home_page_url" => "http://www.fcn.de/en/",
				"wiki_link" => "http://en.wikipedia.org/wiki/1._FC_Nuremberg",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "67",
				"name" => "Stuttgart",
				"country" => "Germany",
				"stadium" => "Mercedes-Benz Arena",
				"home_page_url" => "http://www.vfb.de/",
				"wiki_link" => "http://en.wikipedia.org/wiki/VfB_Stuttgart",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "68",
				"name" => "Schalke 04",
				"country" => "Germany",
				"stadium" => "Veltins-Arena",
				"home_page_url" => "http://www.schalke04.de/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Schalke_04",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "69",
				"name" => "Werder Bremen",
				"country" => "Germany",
				"stadium" => "Weserstadion",
				"home_page_url" => "http://www.werder.de/",
				"wiki_link" => "http://en.wikipedia.org/wiki/SV_Werder_Bremen",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "70",
				"name" => "Kaiserslautern",
				"country" => "Germany",
				"stadium" => "Fritz-Walter-Stadion",
				"home_page_url" => "http://www.fck.de/",
				"wiki_link" => "http://en.wikipedia.org/wiki/1._FC_Kaiserslautern",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "71",
				"name" => "Bayern Munich",
				"country" => "Germany",
				"stadium" => "Allianz Arena",
				"home_page_url" => "http://www.fcbayern.t-home.de/en",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Bayern_Munich",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "72",
				"name" => "M'gladbach",
				"country" => "Germany",
				"stadium" => "Borussia-Park",
				"home_page_url" => "http://www.borussia.de/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Borussia_M%C3%B6nchengladbach",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "73",
				"name" => "Mainz",
				"country" => "Germany",
				"stadium" => "Coface Arena",
				"home_page_url" => "http://www.mainz05.de/",
				"wiki_link" => "http://en.wikipedia.org/wiki/1._FSV_Mainz_05",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "74",
				"name" => "Leverkusen",
				"country" => "Germany",
				"stadium" => "http://www.bayer04.de/",
				"home_page_url" => "BayArena",
				"wiki_link" => "http://en.wikipedia.org/wiki/Bayer_04_Leverkusen",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "75",
				"name" => "Milan",
				"country" => "Italy",
				"stadium" => "San Siro",
				"home_page_url" => "http://www.acmilan.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/A.C._Milan",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "76",
				"name" => "Lazio",
				"country" => "Italy",
				"stadium" => "Stadio Olimpico",
				"home_page_url" => "http://www.sslazio.it/",
				"wiki_link" => "http://en.wikipedia.org/wiki/S.S._Lazio",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "77",
				"name" => "Cesena",
				"country" => "Italy",
				"stadium" => "Stadio Dino Manuzzi",
				"home_page_url" => "http://www.cesenacalcio.it/",
				"wiki_link" => "http://en.wikipedia.org/wiki/A.C._Cesena",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "78",
				"name" => "Napoli",
				"country" => "Italy",
				"stadium" => "Stadio San Paolo",
				"home_page_url" => "http://www.sscnapoli.it/",
				"wiki_link" => "http://en.wikipedia.org/wiki/S.S.C._Napoli",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "79",
				"name" => "Catania",
				"country" => "Italy",
				"stadium" => "Stadio Angelo Massimino",
				"home_page_url" => "www.calciocatania.it",
				"wiki_link" => "http://en.wikipedia.org/wiki/Calcio_Catania",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "80",
				"name" => "Siena",
				"country" => "Italy",
				"stadium" => "Stadio Artemio Franchi",
				"home_page_url" => "www.acsiena.it",
				"wiki_link" => "http://en.wikipedia.org/wiki/A.C._Siena",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "81",
				"name" => "Chievo",
				"country" => "Italy",
				"stadium" => "Stadio Marc'Antonio Bentegodi",
				"home_page_url" => "www.chievoverona.it/en/",
				"wiki_link" => "http://en.wikipedia.org/wiki/A.C._ChievoVerona",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "82",
				"name" => "Novara",
				"country" => "Italy",
				"stadium" => "Stadio Silvio Piola",
				"home_page_url" => "http://www.novaracalcio.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Novara_Calcio",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "83",
				"name" => "Fiorentina",
				"country" => "Italy",
				"stadium" => "Stadio Artemio Franchi",
				"home_page_url" => "http://it.violachannel.tv/",
				"wiki_link" => "http://en.wikipedia.org/wiki/ACF_Fiorentina",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "84",
				"name" => "Bologna",
				"country" => "Italy",
				"stadium" => "Stadio Renato Dall'Ara",
				"home_page_url" => "www.bolognafc.it",
				"wiki_link" => "http://en.wikipedia.org/wiki/Bologna_F.C._1909",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "85",
				"name" => "Genoa",
				"country" => "Italy",
				"stadium" => "Stadio Luigi Ferraris",
				"home_page_url" => "www.genoacfc.it",
				"wiki_link" => "http://en.wikipedia.org/wiki/Genoa_C.F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "86",
				"name" => "Atalanta",
				"country" => "Italy",
				"stadium" => "Stadio Atleti Azzurri d'Italia",
				"home_page_url" => "http://www.atalanta.it/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Atalanta_B.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "87",
				"name" => "Juventus",
				"country" => "Italy",
				"stadium" => "Juventus Stadium",
				"home_page_url" => "http://www.juventus.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Juventus_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "88",
				"name" => "Parma",
				"country" => "Italy",
				"stadium" => "Stadio Ennio Tardini",
				"home_page_url" => "fcparma.com",
				"wiki_link" => "http://en.wikipedia.org/wiki/Parma_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "89",
				"name" => "Lecce",
				"country" => "Italy",
				"stadium" => "Stadio Via del Mare",
				"home_page_url" => "www.uslecce.it",
				"wiki_link" => "http://en.wikipedia.org/wiki/U.S._Lecce",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "90",
				"name" => "Udinese",
				"country" => "Italy",
				"stadium" => "Stadio Friuli",
				"home_page_url" => "www.udinese.it",
				"wiki_link" => "http://en.wikipedia.org/wiki/Udinese_Calcio",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "91",
				"name" => "Palermo",
				"country" => "Italy",
				"stadium" => "Stadio Renzo Barbera",
				"home_page_url" => "www.palermocalcio.it",
				"wiki_link" => "http://en.wikipedia.org/wiki/U.S._Citt%C3%A0_di_Palermo",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "92",
				"name" => "Inter",
				"country" => "Italy",
				"stadium" => "San Siro",
				"home_page_url" => "www.inter.it",
				"wiki_link" => "http://en.wikipedia.org/wiki/F.C._Internazionale_Milano",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "93",
				"name" => "Roma",
				"country" => "Italy",
				"stadium" => "Stadio Olimpico",
				"home_page_url" => "http://www.asroma.it/",
				"wiki_link" => "http://en.wikipedia.org/wiki/A.S._Roma",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "94",
				"name" => "Cagliari",
				"country" => "Italy",
				"stadium" => "Stadio Sant'Elia",
				"home_page_url" => "www.cagliaricalcio.net",
				"wiki_link" => "http://en.wikipedia.org/wiki/Cagliari_Calcio",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "95",
				"name" => "Sampdoria",
				"country" => "Italy",
				"stadium" => "Stadio Luigi Ferraris",
				"home_page_url" => "www.sampdoria.it",
				"wiki_link" => "http://en.wikipedia.org/wiki/U.C._Sampdoria",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "96",
				"name" => "Padova",
				"country" => "Italy",
				"stadium" => "Stadio Euganeo",
				"home_page_url" => "www.padovacalcio.it",
				"wiki_link" => "http://en.wikipedia.org/wiki/Calcio_Padova",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "97",
				"name" => "Verona",
				"country" => "Italy",
				"stadium" => "Stadio Marc'Antonio Bentegodi",
				"home_page_url" => "www.hellasverona.it",
				"wiki_link" => "http://en.wikipedia.org/wiki/Hellas_Verona_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "98",
				"name" => "Pescara",
				"country" => "Italy",
				"stadium" => "Stadio Adriatico",
				"home_page_url" => "http://www.pescaracalcio.com",
				"wiki_link" => "http://en.wikipedia.org/wiki/Delfino_Pescara_1936",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "99",
				"name" => "Ascoli",
				"country" => "Italy",
				"stadium" => "Stadio Cino e Lillo Del Duca",
				"home_page_url" => "http://www.ascolicalcio.net/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Ascoli_Calcio_1898",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "100",
				"name" => "Torino",
				"country" => "Italy",
				"stadium" => "Stadio Olimpico",
				"home_page_url" => "www.torinofc.it",
				"wiki_link" => "http://en.wikipedia.org/wiki/Torino_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "101",
				"name" => "Bari",
				"country" => "Italy",
				"stadium" => "Stadio San Nicola",
				"home_page_url" => "http://www.asbari.it/",
				"wiki_link" => "http://en.wikipedia.org/wiki/A.S._Bari",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "102",
				"name" => "Varese",
				"country" => "Italy",
				"stadium" => "Stadio Franco Ossola",
				"home_page_url" => "",
				"wiki_link" => "http://en.wikipedia.org/wiki/A.S._Varese_1910",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "103",
				"name" => "Brescia",
				"country" => "Italy",
				"stadium" => "Stadio Mario Rigamonti",
				"home_page_url" => "http://www.bresciacalcio.it/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Brescia_Calcio",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "104",
				"name" => "Vicenza",
				"country" => "Italy",
				"stadium" => "Stadio Romeo Menti",
				"home_page_url" => "http://www.vicenzacalcio.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Vicenza_Calcio",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "105",
				"name" => "Cittadella",
				"country" => "Italy",
				"stadium" => "Cittadella",
				"home_page_url" => "http://www.ascittadella.it/",
				"wiki_link" => "http://en.wikipedia.org/wiki/A.S._Cittadella",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "106",
				"name" => "Albinoleffe",
				"country" => "Italy",
				"stadium" => "Stadio Atleti Azzurri d'Italia",
				"home_page_url" => "http://www.albinoleffe.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/U.C._AlbinoLeffe",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "107",
				"name" => "Crotone",
				"country" => "Italy",
				"stadium" => "Ezio Scida",
				"home_page_url" => "www.fccrotone.it",
				"wiki_link" => "en.wikipedia.org/wiki/F.C._Crotone",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "108",
				"name" => "Livorno",
				"country" => "Italy",
				"stadium" => "Armando Picchi",
				"home_page_url" => "http://www.livornocalcio.it/",
				"wiki_link" => "http://en.wikipedia.org/wiki/A.S._Livorno_Calcio",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "109",
				"name" => "Empoli",
				"country" => "Italy",
				"stadium" => "Stadio Carlo Castellani",
				"home_page_url" => "www.empolicalcio.it",
				"wiki_link" => "http://en.wikipedia.org/wiki/Empoli_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "110",
				"name" => "Juve Stabia",
				"country" => "Italy",
				"stadium" => "Stadio Romeo Menti",
				"home_page_url" => "www.ssjuvestabia.it",
				"wiki_link" => "http://en.wikipedia.org/wiki/S.S._Juve_Stabia",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "111",
				"name" => "Grosseto",
				"country" => "Italy",
				"stadium" => "Stadio Olimpico Carlo Zecchini",
				"home_page_url" => "www.usgrosseto.com",
				"wiki_link" => "http://en.wikipedia.org/wiki/U.S._Grosseto_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "112",
				"name" => "Gubbio",
				"country" => "Italy",
				"stadium" => "Stadio Pietro Barbetti",
				"home_page_url" => "www.asgubbio1910.com",
				"wiki_link" => "http://en.wikipedia.org/wiki/A.S._Gubbio_1910",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "113",
				"name" => "Reggina",
				"country" => "Italy",
				"stadium" => "Stadio Oreste Granillo",
				"home_page_url" => "www.regginacalcio.it",
				"wiki_link" => "http://en.wikipedia.org/wiki/Reggina_Calcio",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "114",
				"name" => "Modena",
				"country" => "Italy",
				"stadium" => "Stadio Alberto Braglia",
				"home_page_url" => "www.modenafc.net",
				"wiki_link" => "http://en.wikipedia.org/wiki/Modena_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "115",
				"name" => "Sassuolo",
				"country" => "Italy",
				"stadium" => "Stadio Alberto Braglia",
				"home_page_url" => "http://www.sassuolocalcio.it/",
				"wiki_link" => "http://en.wikipedia.org/wiki/U.S._Sassuolo_Calcio",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "116",
				"name" => "Nocerina",
				"country" => "Italy",
				"stadium" => "Stadio San Francesco d'Assisi",
				"home_page_url" => "http://www.asgnocerina.it/",
				"wiki_link" => "http://en.wikipedia.org/wiki/A.S.G._Nocerina",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "117",
				"name" => "Ajaccio",
				"country" => "France",
				"stadium" => "Stade François Coty",
				"home_page_url" => "http://www.ac-ajaccio.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/AC_Ajaccio",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "118",
				"name" => "Toulouse",
				"country" => "France",
				"stadium" => "Stadium Municipal",
				"home_page_url" => "www.tfc.info",
				"wiki_link" => "http://da.wikipedia.org/wiki/Toulouse_FC",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "119",
				"name" => "Brest",
				"country" => "France",
				"stadium" => "Stade Francis-Le Blé",
				"home_page_url" => "http://www.stade-brestois.com/accueil.php",
				"wiki_link" => "http://en.wikipedia.org/wiki/Stade_Brestois_29",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "120",
				"name" => "Evian Thonon Gaillard",
				"country" => "France",
				"stadium" => "Parc des Sports",
				"home_page_url" => "http://www.etgfc.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Evian_Thonon_Gaillard_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "121",
				"name" => "Caen",
				"country" => "France",
				"stadium" => "Stade Michel d'Ornano",
				"home_page_url" => "http://www.smcaen.fr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Stade_Malherbe_Caen",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "122",
				"name" => "Valenciennes",
				"country" => "France",
				"stadium" => "Stade du Hainaut",
				"home_page_url" => "http://www.va-fc.com/fr/index.html",
				"wiki_link" => "http://en.wikipedia.org/wiki/Valenciennes_FC",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "123",
				"name" => "Marseille",
				"country" => "France",
				"stadium" => "Stade Vélodrome",
				"home_page_url" => "http://www.om.net/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Olympique_de_Marseille",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "124",
				"name" => "Sochaux",
				"country" => "France",
				"stadium" => "Stade Auguste Bonal",
				"home_page_url" => "http://www.fcsochaux.fr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Sochaux-Montb%C3%A9liard",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "125",
				"name" => "Montpellier",
				"country" => "France",
				"stadium" => "Stade de la Mosson",
				"home_page_url" => "http://www.mhscfoot.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Montpellier_HSC",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "126",
				"name" => "Auxerre",
				"country" => "France",
				"stadium" => "Stade de l'Abbé-Deschamps",
				"home_page_url" => "http://www.aja.fr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/AJ_Auxerre",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "127",
				"name" => "Nancy",
				"country" => "France",
				"stadium" => "Parc des Sports du Pont d’Essey",
				"home_page_url" => "",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Nancy",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "128",
				"name" => "Lille",
				"country" => "France",
				"stadium" => "Stade Lille-Metropole",
				"home_page_url" => "http://www.losc.fr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Lille_OSC",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "129",
				"name" => "Nice",
				"country" => "France",
				"stadium" => "Stade Municipal du Ray",
				"home_page_url" => "http://www.ogcnice.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/OGC_Nice",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "130",
				"name" => "Lyon",
				"country" => "France",
				"stadium" => "Stade de Gerland",
				"home_page_url" => "http://www.olweb.fr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Olympique_Lyonnais",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "131",
				"name" => "Paris SG",
				"country" => "France",
				"stadium" => "Parc des Princes",
				"home_page_url" => "http://www.psg.fr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Paris_Saint-Germain_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "132",
				"name" => "Lorient",
				"country" => "France",
				"stadium" => "Stade du Moustoir",
				"home_page_url" => "http://www.fclweb.fr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Lorient",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "133",
				"name" => "Bordeaux",
				"country" => "France",
				"stadium" => "Stade Chaban Delmas",
				"home_page_url" => "http://www.girondins.com/en/home-page",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Girondins_de_Bordeaux",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "134",
				"name" => "St Etienne",
				"country" => "France",
				"stadium" => "Stade Geoffroy-Guichard",
				"home_page_url" => "http://www.asse.fr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/AS_Saint-%C3%89tienne",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "135",
				"name" => "Dijon",
				"country" => "France",
				"stadium" => "Stade Gaston Gérard",
				"home_page_url" => "http://www.dfco.fr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Dijon_FCO",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "136",
				"name" => "Rennes",
				"country" => "France",
				"stadium" => "Route de Lorient",
				"home_page_url" => "http://www.staderennais.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Stade_Rennais_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "35",
				"name" => "Nottingham F.",
				"country" => "England",
				"stadium" => "City Ground",
				"home_page_url" => "http://www.nottinghamforest.co.uk/page/Welcome",
				"wiki_link" => "http://en.wikipedia.org/wiki/Nottingham_Forest_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "137",
				"name" => "Granada",
				"country" => "Spain",
				"stadium" => "Los Cármenes",
				"home_page_url" => "http://www.granadacf.es/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Granada_CF",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "138",
				"name" => "Betis",
				"country" => "Spain",
				"stadium" => "Benito Villamarín",
				"home_page_url" => "http://www.realbetisbalompie.es/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Real_Betis",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "139",
				"name" => "Sp Gijon",
				"country" => "Spain",
				"stadium" => "El Molinón",
				"home_page_url" => "http://www.realsporting.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Sporting_de_Gij%C3%B3n",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "140",
				"name" => "Sociedad",
				"country" => "Spain",
				"stadium" => "Anoeta",
				"home_page_url" => "http://www.realsociedad.com/caste/home/real.asp",
				"wiki_link" => "http://en.wikipedia.org/wiki/Real_Sociedad",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "141",
				"name" => "Valencia",
				"country" => "Spain",
				"stadium" => "Estadio Mestalla",
				"home_page_url" => "http://www.valenciacf.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Valencia_CF",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "142",
				"name" => "Santander",
				"country" => "Spain",
				"stadium" => "El Sardinero",
				"home_page_url" => "http://www.realracingclub.es/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Racing_de_Santander",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "143",
				"name" => "Ath Bilbao",
				"country" => "Spain",
				"stadium" => "San Mamés",
				"home_page_url" => "http://www.athletic-club.net/web/main.asp",
				"wiki_link" => "http://en.wikipedia.org/wiki/Athletic_Bilbao",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "144",
				"name" => "Vallecano",
				"country" => "Spain",
				"stadium" => "Campo de fútbol de Vallecas",
				"home_page_url" => "http://www.rayovallecano.es/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Rayo_Vallecano",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "145",
				"name" => "Ath Madrid",
				"country" => "Spain",
				"stadium" => "Estadio Vicente Calderón",
				"home_page_url" => "http://www.clubatleticodemadrid.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Atl%C3%A9tico_Madrid",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "146",
				"name" => "Osasuna",
				"country" => "Spain",
				"stadium" => "Reyno de Navarra",
				"home_page_url" => "http://www.osasuna.es/dev/",
				"wiki_link" => "http://en.wikipedia.org/wiki/CA_Osasuna",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "147",
				"name" => "Getafe",
				"country" => "Spain",
				"stadium" => "Coliseum Alfonso Pérez",
				"home_page_url" => "http://www.getafecf.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Getafe_CF",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "148",
				"name" => "Levante",
				"country" => "Spain",
				"stadium" => "Ciutat de València",
				"home_page_url" => "www.levanteud.com",
				"wiki_link" => "http://en.wikipedia.org/wiki/Levante_UD",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "149",
				"name" => "Mallorca",
				"country" => "Spain",
				"stadium" => "Iberostar Stadium",
				"home_page_url" => "http://www.rcdmallorca.es/principal_new.php?idioma=1",
				"wiki_link" => "http://en.wikipedia.org/wiki/RCD_Mallorca",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "150",
				"name" => "Espanol",
				"country" => "Spain",
				"stadium" => "Estadi Cornellà-El Prat",
				"home_page_url" => "http://www.rcdespanyol.cat/",
				"wiki_link" => "http://en.wikipedia.org/wiki/RCD_Espanyol",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "151",
				"name" => "Sevilla",
				"country" => "Spain",
				"stadium" => "Ramón Sánchez Pizjuán",
				"home_page_url" => "http://sevillafc.es/nuevaweb/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Sevilla_FC",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "152",
				"name" => "Malaga",
				"country" => "Spain",
				"stadium" => "La Rosaleda",
				"home_page_url" => "http://www.malagacf.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/M%C3%A1laga_CF",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "153",
				"name" => "Zaragoza",
				"country" => "Spain",
				"stadium" => "La Romareda",
				"home_page_url" => "http://www.realzaragoza.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Real_Zaragoza",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "154",
				"name" => "Real Madrid",
				"country" => "Spain",
				"stadium" => "Estadio Santiago Bernabéu",
				"home_page_url" => "http://www.realmadrid.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Real_Madrid_C.F.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "155",
				"name" => "Barcelona",
				"country" => "Spain",
				"stadium" => "Camp Nou",
				"home_page_url" => "http://www.fcbarcelona.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Barcelona",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "156",
				"name" => "Villarreal",
				"country" => "Spain",
				"stadium" => "El Madrigal",
				"home_page_url" => "http://www.villarrealcf.es/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Villarreal_CF",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "157",
				"name" => "Giannina",
				"country" => "Greece",
				"stadium" => "Zosimades Stadium",
				"home_page_url" => "www.pasgiannina.gr",
				"wiki_link" => "http://en.wikipedia.org/wiki/PAS_Giannina_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "158",
				"name" => "Aris",
				"country" => "Greece",
				"stadium" => "Kleanthis Vikelidis Stadium",
				"home_page_url" => "http://www.arisfc.gr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Aris_F.C._(Thessaloniki)",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "159",
				"name" => "OFI",
				"country" => "Greece",
				"stadium" => "Theodoros Vardinogiannis ",
				"home_page_url" => "http://www.ofi.gr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/OFI_Crete",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "160",
				"name" => "Atromitos",
				"country" => "Greece",
				"stadium" => "Peristeri Stadium",
				"home_page_url" => "http://www.atromitosfc.gr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Atromitos_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "161",
				"name" => "Kerkyra",
				"country" => "Greece",
				"stadium" => "Kerkyra Stadium",
				"home_page_url" => "http://www.aokerkyra.com.gr",
				"wiki_link" => "http://en.wikipedia.org/wiki/Kerkyra_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "162",
				"name" => "Panathinaikos",
				"country" => "Greece",
				"stadium" => "Olympic Stadium",
				"home_page_url" => "http://www.pao.gr",
				"wiki_link" => "http://en.wikipedia.org/wiki/Panathinaikos_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "163",
				"name" => "Panionios",
				"country" => "Greece",
				"stadium" => "Panionios Stadium",
				"home_page_url" => "http://www.pgss.gr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Panionios_G.S.S.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "164",
				"name" => "Ergotelis",
				"country" => "Greece",
				"stadium" => "Pankritio Stadium",
				"home_page_url" => "http://www.ergotelis.gr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Ergotelis_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "165",
				"name" => "PAOK",
				"country" => "Greece",
				"stadium" => "Toumba Stadium",
				"home_page_url" => "http://www.paokfc.gr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/P.A.O.K._F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "166",
				"name" => "Xanthi",
				"country" => "Greece",
				"stadium" => "Skoda Xanthi Arena",
				"home_page_url" => "http://www.skodaxanthifc.gr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Skoda_Xanthi_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "167",
				"name" => "Panetolikos",
				"country" => "Greece",
				"stadium" => "Panetolikos Stadium",
				"home_page_url" => "http://www.panetolikos.gr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Panetolikos_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "168",
				"name" => "Asteras Tripolis",
				"country" => "Greece",
				"stadium" => "Asteras Tripolis Stadium",
				"home_page_url" => "http://www.asterastripolis.gr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Asteras_Tripoli_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "169",
				"name" => "AEK",
				"country" => "Greece",
				"stadium" => "Olympic Stadium",
				"home_page_url" => "http://www.aekfc.gr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/AEK_Athens_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "170",
				"name" => "Olympiakos",
				"country" => "Greece",
				"stadium" => "Karaiskakis Stadium",
				"home_page_url" => "http://www.olympiacos.org/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Olympiacos_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "171",
				"name" => "Levadeiakos",
				"country" => "Greece",
				"stadium" => "Levadia Municipal Stadium",
				"home_page_url" => "http://www.levadiakos.gr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Levadiakos_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "172",
				"name" => "Doxa Dramas",
				"country" => "Greece",
				"stadium" => "Doxa Drama Stadium",
				"home_page_url" => "http://www.doxa-dramas.gr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Doxa_Drama_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "173",
				"name" => "Excelsior",
				"country" => "Holland",
				"stadium" => "Stadion Woudestein",
				"home_page_url" => "http://www.sbvexcelsior.nl/",
				"wiki_link" => "http://en.wikipedia.org/wiki/SBV_Excelsior",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "174",
				"name" => "Feyenoord",
				"country" => "Holland",
				"stadium" => "Feijenoord Stadion (aka De Kuip)",
				"home_page_url" => "http://www.feyenoord.nl/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Feyenoord",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "175",
				"name" => "SC Heerenveen",
				"country" => "Holland",
				"stadium" => "Abe Lenstra Stadion",
				"home_page_url" => "http://www.sc-heerenveen.nl/",
				"wiki_link" => "http://en.wikipedia.org/wiki/SC_Heerenveen",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "176",
				"name" => "NEC Nijmegen",
				"country" => "Holland",
				"stadium" => "McDOS Goffertstadion",
				"home_page_url" => "http://www.nec-nijmegen.nl/",
				"wiki_link" => "http://en.wikipedia.org/wiki/N.E.C._(football_club)",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "177",
				"name" => "Roda JC",
				"country" => "Holland",
				"stadium" => "Parkstad Limburg Stadion",
				"home_page_url" => "http://www.rodajc.nl/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Roda_JC_Kerkrade",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "178",
				"name" => "FC Groningen",
				"country" => "Holland",
				"stadium" => "Euroborg",
				"home_page_url" => "http://www.fcgroningen.nl/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Groningen",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "179",
				"name" => "VVV Venlo",
				"country" => "Holland",
				"stadium" => "De Koel",
				"home_page_url" => "http://www.vvv-venlo.nl/",
				"wiki_link" => "http://en.wikipedia.org/wiki/VVV-Venlo",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "180",
				"name" => "FC Utrecht",
				"country" => "Holland",
				"stadium" => "Stadion Galgenwaard",
				"home_page_url" => "http://www.fcutrecht.nl/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Utrecht",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "181",
				"name" => "RKC Waalwijk",
				"country" => "Holland",
				"stadium" => "Mandemakers Stadion",
				"home_page_url" => "http://www.rkcwaalwijk.nl/",
				"wiki_link" => "http://en.wikipedia.org/wiki/RKC_Waalwijk",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "182",
				"name" => "SC Heracles Almelo",
				"country" => "Holland",
				"stadium" => "Polman Stadion",
				"home_page_url" => "http://www.heracles.nl/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Heracles_Almelo",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "183",
				"name" => "AZ Alkmaar",
				"country" => "Holland",
				"stadium" => "AFAS Stadion",
				"home_page_url" => "http://www.az.nl/",
				"wiki_link" => "http://en.wikipedia.org/wiki/AZ_(football_club)",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "184",
				"name" => "PSV Eindhoven",
				"country" => "Holland",
				"stadium" => "Philips Stadion",
				"home_page_url" => "www.psv.nl/home-english.html",
				"wiki_link" => "http://en.wikipedia.org/wiki/PSV_Eindhoven",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "185",
				"name" => "ADO Den Haag",
				"country" => "Holland",
				"stadium" => "Kyocera Stadion",
				"home_page_url" => "http://www.adodenhaag.nl/",
				"wiki_link" => "http://en.wikipedia.org/wiki/ADO_Den_Haag",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "186",
				"name" => "Vitesse",
				"country" => "Holland",
				"stadium" => "GelreDome",
				"home_page_url" => "http://www.vitesse.nl/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Vitesse",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "187",
				"name" => "De Graafschap",
				"country" => "Holland",
				"stadium" => "De Vijverberg",
				"home_page_url" => "http://www.degraafschap.nl/",
				"wiki_link" => "http://en.wikipedia.org/wiki/De_Graafschap",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "188",
				"name" => "Ajax",
				"country" => "Holland",
				"stadium" => "Amsterdam Arena",
				"home_page_url" => "http://www.ajax.nl/",
				"wiki_link" => "http://en.wikipedia.org/wiki/AFC_Ajax",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "189",
				"name" => "NAC Breda",
				"country" => "Holland",
				"stadium" => "Rat Verlegh Stadion",
				"home_page_url" => "http://www.nacbreda.nl/",
				"wiki_link" => "http://en.wikipedia.org/wiki/NAC_Breda",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "190",
				"name" => "FC Twente Enschede",
				"country" => "Holland",
				"stadium" => "De Grolsch Veste",
				"home_page_url" => "http://www.fctwente.nl/en/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Twente",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "191",
				"name" => "Oud-Heverlee Leuven",
				"country" => "Belgium",
				"stadium" => "Den Dreef",
				"home_page_url" => "http://www.ohl.be/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Oud-Heverlee_Leuven",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "192",
				"name" => "Anderlecht",
				"country" => "Belgium",
				"stadium" => "Constant Vanden Stock ",
				"home_page_url" => "http://www.rsca.be/go/fr/page/clubhistory",
				"wiki_link" => "http://en.wikipedia.org/wiki/R.S.C._Anderlecht",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "193",
				"name" => "Bergen",
				"country" => "Belgium",
				"stadium" => "Stade Charles Tondreau",
				"home_page_url" => "www.fcbergen.nl",
				"wiki_link" => "http://en.wikipedia.org/wiki/R.A.E.C._Mons",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "194",
				"name" => "Standard",
				"country" => "Belgium",
				"stadium" => "http://www.standard.be/",
				"home_page_url" => "Stade Maurice Dufrasne",
				"wiki_link" => "http://en.wikipedia.org/wiki/Standard_Li%C3%A8ge",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "195",
				"name" => "Genk",
				"country" => "Belgium",
				"stadium" => "Cristal Arena",
				"home_page_url" => "http://www.krcgenk.be/",
				"wiki_link" => "http://en.wikipedia.org/wiki/K.R.C._Genk",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "196",
				"name" => "Germinal",
				"country" => "Belgium",
				"stadium" => "Olympisch Stadion",
				"home_page_url" => "http://www.germinal-beerschot.be/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Beerschot_AC",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "197",
				"name" => "Gent",
				"country" => "Belgium",
				"stadium" => "Jules Ottenstadion",
				"home_page_url" => "www.kaagent.be",
				"wiki_link" => "http://en.wikipedia.org/wiki/K.A.A._Gent",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "198",
				"name" => "Cercle Brugge",
				"country" => "Belgium",
				"stadium" => "Jan Breydel Stadium",
				"home_page_url" => "http://www.cerclebrugge.be/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Cercle_Brugge_K.S.V.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "199",
				"name" => "Kortrijk",
				"country" => "Belgium",
				"stadium" => "Guldensporenstadion",
				"home_page_url" => "http://www.kvkortrijk.be/",
				"wiki_link" => "http://en.wikipedia.org/wiki/K.V._Kortrijk",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "200",
				"name" => "Lierse",
				"country" => "Belgium",
				"stadium" => "Herman Vanderpoortenstadion",
				"home_page_url" => "http://www.lierse.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Lierse_S.K.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "201",
				"name" => "Lokeren",
				"country" => "Belgium",
				"stadium" => "Daknamstadion",
				"home_page_url" => "http://www.sporting.be/",
				"wiki_link" => "http://en.wikipedia.org/wiki/K.S.C._Lokeren_Oost-Vlaanderen",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "202",
				"name" => "Waregem",
				"country" => "Belgium",
				"stadium" => "Regenboogstadion",
				"home_page_url" => "http://www.svzw.be/",
				"wiki_link" => "http://en.wikipedia.org/wiki/S.V._Zulte_Waregem",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "203",
				"name" => "Mechelen",
				"country" => "Belgium",
				"stadium" => "Argosstadion Achter de Kazerne",
				"home_page_url" => "http://www.kvmechelen.be/",
				"wiki_link" => "http://en.wikipedia.org/wiki/KV_Mechelen",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "204",
				"name" => "St Truiden",
				"country" => "Belgium",
				"stadium" => "Stayen",
				"home_page_url" => "http://www.stvv.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/K._Sint-Truidense_V.V.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "205",
				"name" => "Club Brugge",
				"country" => "Belgium",
				"stadium" => "Jan Breydelstadion",
				"home_page_url" => "http://www.clubbrugge.be/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Club_Brugge_K.V.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "206",
				"name" => "Westerlo",
				"country" => "Belgium",
				"stadium" => "Het Kuipje",
				"home_page_url" => "http://www.kvcwesterlo.be/",
				"wiki_link" => "http://en.wikipedia.org/wiki/K.V.C._Westerlo",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "207",
				"name" => "Ankaragucu",
				"country" => "Turkey",
				"stadium" => "Ankara 19 Mayıs Stadium",
				"home_page_url" => "http://www.ankaragucu.org.tr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/MKE_Ankarag%C3%BCc%C3%BC",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "208",
				"name" => "Mersin Idman Yurdu",
				"country" => "Turkey",
				"stadium" => "Nurullah Sağlam",
				"home_page_url" => "http://www.mersinidmanyurdu.com.tr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Mersin_%C4%B0dmanyurdu_SK",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "209",
				"name" => "Eskisehirspor",
				"country" => "Turkey",
				"stadium" => "Atatürk Stadyumu",
				"home_page_url" => "http://www.eskisehirspor.org.tr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Eski%C5%9Fehirspor",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "210",
				"name" => "Besiktas",
				"country" => "Turkey",
				"stadium" => "İnönü Stadium",
				"home_page_url" => "http://www.bjk.com.tr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Be%C5%9Fikta%C5%9F_J.K.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "211",
				"name" => "Manisaspor",
				"country" => "Turkey",
				"stadium" => "Manisa 19 Mayıs Stadium",
				"home_page_url" => "http://www.manisaspor.org.tr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Manisaspor",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "212",
				"name" => "Trabzonspor",
				"country" => "Turkey",
				"stadium" => "Hüseyin Avni Aker",
				"home_page_url" => "http://www.trabzonspor.org.tr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Trabzonspor",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "213",
				"name" => "Samsunspor",
				"country" => "Turkey",
				"stadium" => "Samsun 19 Mayis",
				"home_page_url" => "http://samsunspor.org.tr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Samsunspor",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "214",
				"name" => "Genclerbirligi",
				"country" => "Turkey",
				"stadium" => "19 Mayıs Stadyumu",
				"home_page_url" => "http://www.genclerbirligi.org.tr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Gen%C3%A7lerbirli%C4%9Fi_S.K.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "215",
				"name" => "Antalyaspor",
				"country" => "Turkey",
				"stadium" => "Mardan Sports Complex",
				"home_page_url" => "http://www.antalyaspor.com.tr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Antalyaspor",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "216",
				"name" => "Gaziantepspor",
				"country" => "Turkey",
				"stadium" => "Gaziantep Kamil Ocak Stadium",
				"home_page_url" => "http://www.gaziantepspor.org.tr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Gaziantepspor",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "217",
				"name" => "Bursaspor",
				"country" => "Turkey",
				"stadium" => "Bursa Atatürk Stadium",
				"home_page_url" => "http://www.bursaspor.org.tr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Bursaspor",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "218",
				"name" => "Kayserispor",
				"country" => "Turkey",
				"stadium" => "Kadir Has Stadium",
				"home_page_url" => "http://www.kayserispor.org.tr/tur/default.asp",
				"wiki_link" => "http://en.wikipedia.org/wiki/Kayserispor",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "219",
				"name" => "Buyuksehyr",
				"country" => "Turkey",
				"stadium" => "Atatürk Olympic Stadium",
				"home_page_url" => "http://www.ibbspor.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/%C4%B0stanbul_B%C3%BCy%C3%BCk%C5%9Fehir_Belediyespor_(football_team)",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "220",
				"name" => "Galatasaray",
				"country" => "Turkey",
				"stadium" => "Türk Telekom Arena",
				"home_page_url" => "http://www.galatasaray.org/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Galatasaray_S.K._(football_team)",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "221",
				"name" => "Karabukspor",
				"country" => "Turkey",
				"stadium" => "Yenişehir Stadium",
				"home_page_url" => "http://www.kardemirkarabukspor.org.tr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Karab%C3%BCkspor",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "222",
				"name" => "Sivasspor",
				"country" => "Turkey",
				"stadium" => "4 Eylül",
				"home_page_url" => "http://www.sivasspor.org.tr//",
				"wiki_link" => "http://en.wikipedia.org/wiki/Sivasspor",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "223",
				"name" => "Fenerbahce",
				"country" => "Turkey",
				"stadium" => "Şükrü Saracoğlu Stadium",
				"home_page_url" => "http://www.fenerbahce.org/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Fenerbah%C3%A7e_S.K._(football)",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "224",
				"name" => "Orduspor",
				"country" => "Turkey",
				"stadium" => "19 Eylül Stadium",
				"home_page_url" => "http://www.orduspor.org.tr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Orduspor",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "225",
				"name" => "Preston",
				"country" => "England",
				"stadium" => "Deepdale",
				"home_page_url" => "http://www.pnefc.net/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Preston_North_End_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "226",
				"name" => "Scunthorpe",
				"country" => "England",
				"stadium" => "Glanford Park",
				"home_page_url" => "http://www.scunthorpe-united.co.uk",
				"wiki_link" => "http://en.wikipedia.org/wiki/Scunthorpe_United_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "227",
				"name" => "Sheffield United",
				"country" => "England",
				"stadium" => "Bramall Lane",
				"home_page_url" => "http://www.sufc.co.uk",
				"wiki_link" => "http://en.wikipedia.org/wiki/Sheffield_United_F.C.",
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
				"team_id" => "229",
				"name" => "St Pauli",
				"country" => "Germany",
				"stadium" => "Millerntor-Stadion",
				"home_page_url" => "http://www.fcstpauli.de/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_St._Pauli",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "230",
				"name" => "Ein Frankfurt",
				"country" => "Germany",
				"stadium" => "Commerzbank-Arena",
				"home_page_url" => "http://www.eintracht.de/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Eintracht_Frankfurt",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "231",
				"name" => "Hercules",
				"country" => "Spain",
				"stadium" => "José Rico Pérez",
				"home_page_url" => "http://www.herculescf.es/",
				"wiki_link" => "http://en.wikipedia.org/wiki/H%C3%A9rcules_CF",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "232",
				"name" => "La Coruna",
				"country" => "Spain",
				"stadium" => "Riazor",
				"home_page_url" => "http://www.canaldeportivo.com/equipo/rcdeportivo.html",
				"wiki_link" => "http://en.wikipedia.org/wiki/Deportivo_de_La_Coru%C3%B1a",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "233",
				"name" => "Almeria",
				"country" => "Spain",
				"stadium" => "Juegos Mediterráneos",
				"home_page_url" => "http://www.udalmeriasad.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/UD_Almer%C3%ADa",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "234",
				"name" => "Frosinone",
				"country" => "Italy",
				"stadium" => "Stadio Matusa",
				"home_page_url" => "http://www.frosinonecalcio.com/index.php",
				"wiki_link" => "http://en.wikipedia.org/wiki/Frosinone_Calcio",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "235",
				"name" => "Piacenza",
				"country" => "Italy",
				"stadium" => "Stadio Leonardo Garilli",
				"home_page_url" => "http://www.piacenzacalcio.it/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Piacenza_Calcio",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "236",
				"name" => "Portogruaro",
				"country" => "Italy",
				"stadium" => "Stadio Pier Giovanni Mecchia",
				"home_page_url" => "http://www.portogruarosummaga.it/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Calcio_Portogruaro_Summaga",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "237",
				"name" => "Triestina",
				"country" => "Italy",
				"stadium" => "Stadio Nereo Rocco",
				"home_page_url" => "http://www.triestinacalcio.it/",
				"wiki_link" => "http://en.wikipedia.org/wiki/U.S._Triestina_Calcio",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "238",
				"name" => "Lens",
				"country" => "France",
				"stadium" => "Stade Félix Bollaert",
				"home_page_url" => "http://www.rclens.fr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/RC_Lens",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "239",
				"name" => "Monaco",
				"country" => "France",
				"stadium" => "Stade Louis II",
				"home_page_url" => "http://www.asm-fc.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/AS_Monaco_FC",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "240",
				"name" => "Arles",
				"country" => "France",
				"stadium" => "Parc des Sports",
				"home_page_url" => "http://www.acarlesavignon.fr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/AC_Arles-Avignon",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "241",
				"name" => "Eupen",
				"country" => "Belgium",
				"stadium" => "Kehrweg Stadion",
				"home_page_url" => "http://www.as-eupen.be/",
				"wiki_link" => "http://en.wikipedia.org/wiki/K.A.S._Eupen",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "242",
				"name" => "Charleroi",
				"country" => "Belgium",
				"stadium" => "Stade du Pays de Charleroi",
				"home_page_url" => "http://www.sporting-charleroi.be/hp/fr/hp.asp",
				"wiki_link" => "http://en.wikipedia.org/wiki/R._Charleroi_S.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "243",
				"name" => "Willem II",
				"country" => "Holland",
				"stadium" => "Koning Willem II Stadion",
				"home_page_url" => "http://www.willem-ii.nl/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Willem_II_(football_club)",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "244",
				"name" => "Iraklis",
				"country" => "Greece",
				"stadium" => "Kaftanzoglio Stadium",
				"home_page_url" => "http://www.iraklis-fc.gr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Iraklis_Thessaloniki_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "245",
				"name" => "Larisa",
				"country" => "Greece",
				"stadium" => "AEL FC Arena",
				"home_page_url" => "http://www.ael1964.gr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/AEL_1964_FC",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "246",
				"name" => "Olympiakos Volou",
				"country" => "Greece",
				"stadium" => "Panthessaliko Stadium",
				"home_page_url" => "http://www.paeolympiakosvoloufc.gr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Olympiakos_Volou_1937_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "247",
				"name" => "Kavala",
				"country" => "Greece",
				"stadium" => "Anthi Karagianni Stadium",
				"home_page_url" => "http://www.aokavalas.gr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Kavala_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "248",
				"name" => "Panserraikos",
				"country" => "Greece",
				"stadium" => "Serres Municipal Stadium",
				"home_page_url" => "http://www.paepanserraikos.gr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Panserraikos_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "249",
				"name" => "Bucaspor",
				"country" => "Turkey",
				"stadium" => "Yeni Buca Stadı",
				"home_page_url" => "http://www.bucaspor.org.tr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Bucaspor",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "250",
				"name" => "Kasimpasa",
				"country" => "Turkey",
				"stadium" => "Recep Tayyip Erdoğan Stadium",
				"home_page_url" => "http://www.kasimpasaspor.org.tr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Kas%C4%B1mpa%C5%9Fa_S.K.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "251",
				"name" => "Konyaspor",
				"country" => "Turkey",
				"stadium" => "Konya Atatürk Stadium",
				"home_page_url" => "http://www.konyaspor.org.tr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Konyaspor",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "252",
				"name" => "Plymouth",
				"country" => "England",
				"stadium" => "Home Park",
				"home_page_url" => "http://www.pafc.co.uk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Plymouth_Argyle_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "253",
				"name" => "Sheffield Weds",
				"country" => "England",
				"stadium" => "Hillsborough Stadium",
				"home_page_url" => "http://www.swfc.co.uk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Sheffield_Wednesday_F.C.",
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
				"team_id" => "255",
				"name" => "Bochum",
				"country" => "Germany",
				"stadium" => "Ruhrstadion",
				"home_page_url" => "http://www.vfl-bochum.de/",
				"wiki_link" => "http://en.wikipedia.org/wiki/VfL_Bochum",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "256",
				"name" => "Tenerife",
				"country" => "Spain",
				"stadium" => "Heliodoro Rodríguez López",
				"home_page_url" => "http://www.clubdeportivotenerife.es/",
				"wiki_link" => "http://en.wikipedia.org/wiki/CD_Tenerife",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "257",
				"name" => "Valladolid",
				"country" => "Spain",
				"stadium" => "José Zorrilla",
				"home_page_url" => "http://www.realvalladolid.es/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Real_Valladolid",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "258",
				"name" => "Xerez",
				"country" => "Spain",
				"stadium" => "Chapín",
				"home_page_url" => "http://www.xerezcd.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Xerez_CD",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "259",
				"name" => "Gallipoli",
				"country" => "Italy",
				"stadium" => "Stadio Antonio Bianco",
				"home_page_url" => "http://www.ilmiogallipoli.it/",
				"wiki_link" => "http://en.wikipedia.org/wiki/A.S.D._Gallipoli_Football_1909",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "260",
				"name" => "Ancona",
				"country" => "Italy",
				"stadium" => "Del Conero",
				"home_page_url" => "http://www.ancona1905.it/",
				"wiki_link" => "http://en.wikipedia.org/wiki/A.C._Ancona",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "261",
				"name" => "Mantova",
				"country" => "Italy",
				"stadium" => "Stadio Danilo Martelli",
				"home_page_url" => "http://www.mantovafc.it/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Mantova_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "262",
				"name" => "Salernitana",
				"country" => "Italy",
				"stadium" => "Stadio Arechi",
				"home_page_url" => "",
				"wiki_link" => "http://en.wikipedia.org/wiki/Salerno_Calcio",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "263",
				"name" => "Grenoble",
				"country" => "France",
				"stadium" => "Stade des Alpes",
				"home_page_url" => "http://www.gf38.fr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Grenoble_Foot_38",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "264",
				"name" => "Le Mans",
				"country" => "France",
				"stadium" => "MMArena",
				"home_page_url" => "http://www.lemansfc.fr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Le_Mans_FC",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "265",
				"name" => "Boulogne",
				"country" => "France",
				"stadium" => "Stade de la Libération",
				"home_page_url" => "http://www.usbco.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/US_Boulogne",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "266",
				"name" => "Roeselare",
				"country" => "Belgium",
				"stadium" => "Schiervelde Stadion",
				"home_page_url" => "http://www.ksvroeselare.be/",
				"wiki_link" => "http://en.wikipedia.org/wiki/K.S.V._Roeselare",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "267",
				"name" => "Charlton",
				"country" => "England",
				"stadium" => "The Valley",
				"home_page_url" => "http://www.cafc.co.uk/page/Welcome",
				"wiki_link" => "http://en.wikipedia.org/wiki/Charlton_Athletic_FC",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "268",
				"name" => "Bielefeld",
				"country" => "Germany",
				"stadium" => "Bielefelder Alm",
				"home_page_url" => "http://www.arminia-bielefeld.de/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Arminia_Bielefeld",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "269",
				"name" => "Cottbus",
				"country" => "Germany",
				"stadium" => "Stadion der Freundschaft",
				"home_page_url" => "http://www.fcenergie.de/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Energie_Cottbus",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "270",
				"name" => "Karlsruhe",
				"country" => "Germany",
				"stadium" => "Wildparkstadion",
				"home_page_url" => "http://www.ksc.de/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Karlsruher_SC",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "271",
				"name" => "Recreativo",
				"country" => "Spain",
				"stadium" => "Nuevo Colombino",
				"home_page_url" => "http://www.recreativohuelva.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Recreativo_de_Huelva",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "272",
				"name" => "Numancia",
				"country" => "Spain",
				"stadium" => "Los Pajaritos",
				"home_page_url" => "http://www.cdnumancia.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/CD_Numancia",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "273",
				"name" => "Rimini",
				"country" => "Italy",
				"stadium" => "Stadio Romeo Neri",
				"home_page_url" => "http://www.riminicalcio.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/A.C._Rimini_1912",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "274",
				"name" => "Avellino",
				"country" => "Italy",
				"stadium" => "Stadio Partenio",
				"home_page_url" => "http://www.asavellino.it/",
				"wiki_link" => "http://en.wikipedia.org/wiki/A.S._Avellino_1912",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "275",
				"name" => "Pisa",
				"country" => "Italy",
				"stadium" => "Arena Garibaldi – Romeo",
				"home_page_url" => "http://www.acpisa1909.it/",
				"wiki_link" => "http://en.wikipedia.org/wiki/A.C._Pisa_1909",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "276",
				"name" => "Treviso",
				"country" => "Italy",
				"stadium" => "Stadio Omobono Tenni",
				"home_page_url" => "http://www.fctreviso.it/",
				"wiki_link" => "http://en.wikipedia.org/wiki/F.C._Treviso",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "277",
				"name" => "Nantes",
				"country" => "France",
				"stadium" => "La Beaujoire-Louis",
				"home_page_url" => "http://www.fcnantes.com/accueil.php",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Nantes",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "278",
				"name" => "Le Havre",
				"country" => "France",
				"stadium" => "Stade Jules Deschaseaux",
				"home_page_url" => "http://www.hac-foot.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Le_Havre_AC",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "279",
				"name" => "Dender",
				"country" => "Belgium",
				"stadium" => "Florent Beeckmanstadion",
				"home_page_url" => "http://www.fcvdendereh.be/",
				"wiki_link" => "http://en.wikipedia.org/wiki/F.C._Verbroedering_Dender_Eendracht_Hekelgem",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "280",
				"name" => "Tubize",
				"country" => "Belgium",
				"stadium" => "Stade Leburton",
				"home_page_url" => "http://www.afctubize.be/",
				"wiki_link" => "http://en.wikipedia.org/wiki/A.F.C._Tubize",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "281",
				"name" => "Mouscron",
				"country" => "Belgium",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "http://en.wikipedia.org/wiki/R.E._Mouscron",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "282",
				"name" => "Sparta",
				"country" => "Holland",
				"stadium" => "Het Kasteel (The Castle)",
				"home_page_url" => "http://www.sparta-rotterdam.nl/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Sparta_Rotterdam",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "283",
				"name" => "FC Volendam",
				"country" => "Holland",
				"stadium" => "Kras Stadion",
				"home_page_url" => "http://www.fcvolendam.nl/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Volendam",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "284",
				"name" => "Denizlispor",
				"country" => "Turkey",
				"stadium" => "Atatürk Stadium",
				"home_page_url" => "http://www.denizlispor.org.tr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Denizlispor",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "285",
				"name" => "Hacettepespor",
				"country" => "Turkey",
				"stadium" => "Ankara 19 Mayıs Stadium",
				"home_page_url" => "http://www.hacettepespor.org.tr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Hacettepe_S.K.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "286",
				"name" => "Kocaelispor",
				"country" => "Turkey",
				"stadium" => "Ismet Paşa Stadium",
				"home_page_url" => "http://www.kocaelispor.org.tr/KS/index.php",
				"wiki_link" => "http://en.wikipedia.org/wiki/Kocaelispor",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "287",
				"name" => "Ankaraspor",
				"country" => "Turkey",
				"stadium" => "Yenikent Asaş Stadium",
				"home_page_url" => "http://www.fc-ankaraspor.nl/home.html",
				"wiki_link" => "http://en.wikipedia.org/wiki/Ankaraspor_A.%C5%9E.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "288",
				"name" => "Panthrakikos",
				"country" => "Greece",
				"stadium" => "OPAP-Municipal Komotini Stadium",
				"home_page_url" => "www.panthrakikos.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Panthrakikos_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "289",
				"name" => "Thrasyvoulos",
				"country" => "Greece",
				"stadium" => "Fyli Stadium",
				"home_page_url" => "http://www.thrasivoulos.gr/premises.html#",
				"wiki_link" => "http://en.wikipedia.org/wiki/Thrasyvoulos_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "290",
				"name" => "Colchester",
				"country" => "England",
				"stadium" => "Colchester Community Stadium",
				"home_page_url" => "www.cu-fc.com/page/Home",
				"wiki_link" => "http://en.wikipedia.org/wiki/Colchester_United_F.C.",
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
				"team_id" => "292",
				"name" => "Hansa Rostock",
				"country" => "Germany",
				"stadium" => "DKB-Arena",
				"home_page_url" => "www.fc-hansa.de/",
				"wiki_link" => "http://en.wikipedia.org/wiki/F.C._Hansa_Rostock",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "293",
				"name" => "Duisburg",
				"country" => "Germany",
				"stadium" => "Schauinsland-Reisen-Arena",
				"home_page_url" => "www.msv-duisburg.de/",
				"wiki_link" => "http://en.wikipedia.org/wiki/MSV_Duisburg",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "294",
				"name" => "Murcia",
				"country" => "Spain",
				"stadium" => "Nueva Condomina",
				"home_page_url" => "http://www.realmurcia.es/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Real_Murcia",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "295",
				"name" => "Spezia",
				"country" => "Italy",
				"stadium" => "Stadio Alberto Picco",
				"home_page_url" => "http://www.acspezia.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Spezia_Calcio",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "296",
				"name" => "Ravenna",
				"country" => "Italy",
				"stadium" => "Stadio Bruno Benelli",
				"home_page_url" => "http://www.ravennacalcio.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Ravenna_Calcio",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "297",
				"name" => "Messina",
				"country" => "Italy",
				"stadium" => "Stadio Comunale San Filippo",
				"home_page_url" => "http://www.acrmessinasrl.it/",
				"wiki_link" => "http://en.wikipedia.org/wiki/A.C.R._Messina",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "298",
				"name" => "Strasbourg",
				"country" => "France",
				"stadium" => "Stade de la Meinau",
				"home_page_url" => "http://www.rcstrasbourg.fr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/RC_Strasbourg",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "299",
				"name" => "Metz",
				"country" => "France",
				"stadium" => "http://www.fcmetz.com/",
				"home_page_url" => "Stade Municipal",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Metz",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "300",
				"name" => "FC Brussels",
				"country" => "Belgium",
				"stadium" => "Stade Edmond Machtens",
				"home_page_url" => "http://www.fc-brussels.be/",
				"wiki_link" => "http://en.wikipedia.org/wiki/F.C._Molenbeek_Brussels_Strombeek",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "301",
				"name" => "Rizespor",
				"country" => "Turkey",
				"stadium" => "Yeni Rize Şehir Stadı",
				"home_page_url" => "http://www.caykurrizespor.org.tr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/%C3%87aykur_Rizespor",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "302",
				"name" => "Kalamaria",
				"country" => "Greece",
				"stadium" => "http://www.apollonkalamariasfc.gr/",
				"home_page_url" => "www.apollonkalamariasfc.gr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Apollon_Kalamarias_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "303",
				"name" => "Veria",
				"country" => "Greece",
				"stadium" => "Veroia Stadium",
				"home_page_url" => "http://www.veriafc.gr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Veria_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "304",
				"name" => "Luton",
				"country" => "England",
				"stadium" => "Kenilworth Road",
				"home_page_url" => "http://www.lutontown.co.uk/page/Welcome",
				"wiki_link" => "http://en.wikipedia.org/wiki/Luton_Town_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "305",
				"name" => "Odense BK ",
				"country" => "Denmark",
				"stadium" => "TRE-FOR Park",
				"home_page_url" => "http://www.ob.dk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Odense_Boldklub",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "306",
				"name" => "FC Nordsjælland",
				"country" => "Denmark",
				"stadium" => "Farum Park",
				"home_page_url" => "http://www.fcn.dk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Nordsj%C3%A6lland",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "307",
				"name" => "FC Midtjylland ",
				"country" => "Denmark",
				"stadium" => "MCH Arena",
				"home_page_url" => "www.fcm.dk",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Midtjylland",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "308",
				"name" => "Silkeborg IF",
				"country" => "Denmark",
				"stadium" => "Silkeborg Stadion",
				"home_page_url" => "www.silkeborgif.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Silkeborg_IF",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "309",
				"name" => "Brøndby ",
				"country" => "Denmark",
				"stadium" => "Brøndby Stadium",
				"home_page_url" => "www.brondby.com",
				"wiki_link" => "http://en.wikipedia.org/wiki/Br%C3%B8ndby_IF",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "310",
				"name" => "AaB",
				"country" => "Denmark",
				"stadium" => "Aalborg Stadion",
				"home_page_url" => "http://www.aabsport.dk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Aalborg_Boldspilklub",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "311",
				"name" => "AC Horsens ",
				"country" => "Denmark",
				"stadium" => "CASA Arena Horsens",
				"home_page_url" => "www.achorsens.dk",
				"wiki_link" => "http://en.wikipedia.org/wiki/AC_Horsens",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "312",
				"name" => "Køge",
				"country" => "Denmark",
				"stadium" => "Køge Stadion",
				"home_page_url" => "http://www.koge-boldklub.dk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/K%C3%B8ge_Boldklub",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "313",
				"name" => "Sønderjyske ",
				"country" => "Denmark",
				"stadium" => "Haderslev Fodboldstadion",
				"home_page_url" => "www.soenderjyske.dk",
				"wiki_link" => "http://da.wikipedia.org/wiki/S%C3%B8nderjysk_Elitesport",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "314",
				"name" => "FC Copenhagen",
				"country" => "Denmark",
				"stadium" => "Parken",
				"home_page_url" => "www.fck.dk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/F.C._K%C3%B8benhavn",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "315",
				"name" => "AGF Aarhus ",
				"country" => "Denmark",
				"stadium" => "NRGi Park",
				"home_page_url" => "www.agf.dk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Aarhus_Gymnastikforening",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "316",
				"name" => "Lyngby",
				"country" => "Denmark",
				"stadium" => "Lyngby Stadion",
				"home_page_url" => "http://www.lyngby-boldklub.dk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Lyngby_Boldklub",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "317",
				"name" => "Poland",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "318",
				"name" => "Greece",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "319",
				"name" => "Russia",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "320",
				"name" => "Czech Republic",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "321",
				"name" => "Netherlands",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "322",
				"name" => "Denmark",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "323",
				"name" => "Germany",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "324",
				"name" => "Portugal",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "325",
				"name" => "Spain",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "326",
				"name" => "Italy",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "327",
				"name" => "Ireland",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "328",
				"name" => "Croatia",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "329",
				"name" => "France",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "330",
				"name" => "England",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "331",
				"name" => "Ukraine",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "332",
				"name" => "Sweden",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "333",
				"name" => "Winner Group A",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "334",
				"name" => "Runner-up Group B",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "335",
				"name" => "Winner Group B",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "336",
				"name" => "Runner-up Group A",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "337",
				"name" => "Winner Group C",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "338",
				"name" => "Runner-up Group D",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "339",
				"name" => "Runner-up Group C",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "340",
				"name" => "Winner Group D",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "341",
				"name" => "W25",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "342",
				"name" => "W27",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "343",
				"name" => "W26",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "344",
				"name" => "W28",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "345",
				"name" => "Winner SF1",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "346",
				"name" => "Winner SF2",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "349",
				"name" => "KV Oostende",
				"country" => "Belgium",
				"stadium" => "Albertparkstadion",
				"home_page_url" => "http://www.kvo.be/",
				"wiki_link" => "http://en.wikipedia.org/wiki/K.V._Oostende",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "351",
				"name" => "Huddersfield Town",
				"country" => "England",
				"stadium" => "Galpharm Stadium",
				"home_page_url" => "www.htafc.com/page/Home",
				"wiki_link" => "http://en.wikipedia.org/wiki/Huddersfield_Town_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "353",
				"name" => "Bastia",
				"country" => "France",
				"stadium" => "Stade Armand Cesari",
				"home_page_url" => "http://www.sc-bastia.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/SC_Bastia",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "354",
				"name" => "Troyes",
				"country" => "France",
				"stadium" => "Stade de l'Aube",
				"home_page_url" => "http://www.estac.fr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Troyes_AC",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "355",
				"name" => "Stade de Reims",
				"country" => "France",
				"stadium" => "Stade Auguste Delaune",
				"home_page_url" => "http://www.stade-de-reims.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Stade_de_Reims",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "350",
				"name" => "Fortuna Düsseldorf",
				"country" => "Germany",
				"stadium" => "Esprit Arena",
				"home_page_url" => "http://www.fortuna95.de/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Fortuna_D%C3%BCsseldorf",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "356",
				"name" => "PEC Zwolle",
				"country" => "Holland",
				"stadium" => "PEC Zwolle Stadion",
				"home_page_url" => "http://www.peczwolle.nl/",
				"wiki_link" => "http://en.wikipedia.org/wiki/PEC_Zwolle",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "357",
				"name" => "Celta Vigo",
				"country" => "Spain",
				"stadium" => "Balaídos",
				"home_page_url" => "http://www.celtavigo.net/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Celta_de_Vigo",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "358",
				"name" => "Randers FC",
				"country" => "Denmark",
				"stadium" => "AutoC Park Randers",
				"home_page_url" => "http://www.randersfc.dk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Randers_FC",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "359",
				"name" => "Esbjerg",
				"country" => "Denmark",
				"stadium" => "Blue Water Arena",
				"home_page_url" => "http://www.efb.dk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Esbjerg_fB",
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
				"team_id" => "348",
				"name" => "Waasland-Beveren",
				"country" => "Belgium",
				"stadium" => "Freethiel Stadion",
				"home_page_url" => "http://www.waasland-beveren.be/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Waasland-Beveren",
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
				"team_id" => "361",
				"name" => "Diyarbakirspor",
				"country" => "Turkey",
				"stadium" => "Diyarbakır Atatürk Stadium",
				"home_page_url" => "http://diyarbakirspor.org.tr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Diyarbak%C4%B1rspor",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "362",
				"name" => "Dynamo Kiev",
				"country" => "Ukraine",
				"stadium" => "Olimpiysky National Sports Complex",
				"home_page_url" => "http://www.fcdynamo.kiev.ua/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Dynamo_Kyiv",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "363",
				"name" => "Debrecen",
				"country" => "Hungary",
				"stadium" => "Stadion Oláh Gábor Út",
				"home_page_url" => "http://www.dvsc.hu/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Debreceni_VSC",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "364",
				"name" => "BATE Borisov",
				"country" => "Belarus",
				"stadium" => "City Stadium",
				"home_page_url" => "http://www.fcbate.by/bate.php?lang=en",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_BATE_Borisov",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "365",
				"name" => "F91 Dudelange",
				"country" => "Luxemborg",
				"stadium" => "Stade Jos Nosbaum",
				"home_page_url" => "http://www.f91.lu/",
				"wiki_link" => "http://en.wikipedia.org/wiki/F91_Dudelange",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "366",
				"name" => "NK Maribor",
				"country" => "Slovenia",
				"stadium" => "Ljudski vrt",
				"home_page_url" => "http://www.nkmaribor.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/NK_Maribor",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "367",
				"name" => "Neftchi",
				"country" => "Azerbaijan",
				"stadium" => "Tofik Bakhramov Stadium",
				"home_page_url" => "http://www.neftchifc.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Neftchi_Baku_PFC",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "368",
				"name" => "Hapoel Kiryat Shmona",
				"country" => "Israel",
				"stadium" => "Municipal Stadium",
				"home_page_url" => "",
				"wiki_link" => "http://en.wikipedia.org/wiki/Hapoel_Ironi_Kiryat_Shmona_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "369",
				"name" => "Helsingborg",
				"country" => "Sweden",
				"stadium" => "Olympia",
				"home_page_url" => "http://www.hif.se/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Helsingborgs_IF",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "370",
				"name" => "Slask Wroclaw",
				"country" => "Poland",
				"stadium" => "Stadion Miejski",
				"home_page_url" => "http://www.slaskwroclaw.pl/",
				"wiki_link" => "http://en.wikipedia.org/wiki/%C5%9Al%C4%85sk_Wroc%C5%82aw",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "371",
				"name" => "HJK Helsinki",
				"country" => "Finland",
				"stadium" => "Sonera Stadium",
				"home_page_url" => "http://www.hjk.fi/index.php?lang=en",
				"wiki_link" => "http://en.wikipedia.org/wiki/Helsingin_Jalkapalloklubi",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "372",
				"name" => "Liberec",
				"country" => "Czech Republic",
				"stadium" => "Stadion u Nisy",
				"home_page_url" => "http://www.fcslovanliberec.cz/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Slovan_Liberec",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "373",
				"name" => "CFR Cluj-Napoca",
				"country" => "Romania",
				"stadium" => "Dr. Constantin Rădulescu",
				"home_page_url" => "http://www.cfr1907.ro/",
				"wiki_link" => "http://en.wikipedia.org/wiki/CFR_Cluj",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "374",
				"name" => "FK Ekranas",
				"country" => "Lithuania",
				"stadium" => "Aukštaitija Stadium",
				"home_page_url" => "http://www.fkekranas.lt/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FK_Ekranas",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "375",
				"name" => "FC Basel",
				"country" => "Switzerland",
				"stadium" => "St. Jakob-Park",
				"home_page_url" => "www.fcb.ch",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Basel",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "376",
				"name" => "Molde",
				"country" => "Norway",
				"stadium" => "Aker Stadion",
				"home_page_url" => "http://www.moldefk.no/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Molde_FK",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "377",
				"name" => "FC Vaslui",
				"country" => "Romania",
				"stadium" => "Municipal",
				"home_page_url" => "http://www.vasluifc.ro/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Vaslui",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "378",
				"name" => "Partizan Belgrade",
				"country" => "Serbia",
				"stadium" => "Partizan Stadium",
				"home_page_url" => "http://www.partizan.rs/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FK_Partizan",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "379",
				"name" => "Dinamo Zagreb",
				"country" => "Croatia",
				"stadium" => "Stadion Maksimir",
				"home_page_url" => "http://www.gnkdinamo.hr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/GNK_Dinamo_Zagreb",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "380",
				"name" => "Sheriff Tiraspol",
				"country" => "Moldova",
				"stadium" => "Sheriff",
				"home_page_url" => "http://www.fc-sheriff.com/eng/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Sheriff_Tiraspol",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "381",
				"name" => "Tre Penne",
				"country" => "San Marino",
				"stadium" => "Stadio Fonte dell'Ovo",
				"home_page_url" => "http://www.trepenne.sm/",
				"wiki_link" => "http://en.wikipedia.org/wiki/S.P._Tre_Penne",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "382",
				"name" => "Valletta ",
				"country" => "Malta",
				"stadium" => "Ta' Qali Stadium",
				"home_page_url" => "http://www.vallettafc.net/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Valletta_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "383",
				"name" => "Lusitanos",
				"country" => "Andorra",
				"stadium" => "DEVK-Arena",
				"home_page_url" => "",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Lusitanos",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "384",
				"name" => "Linfield ",
				"country" => "Northern Ireland",
				"stadium" => "Windsor Park",
				"home_page_url" => "http://www.linfieldfc.com/front.asp",
				"wiki_link" => "http://en.wikipedia.org/wiki/Linfield_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "385",
				"name" => "B36 Torshavn",
				"country" => "Faroe Islands",
				"stadium" => "Gundadalur Stadium",
				"home_page_url" => "http://b36.fo/",
				"wiki_link" => "http://en.wikipedia.org/wiki/B36_T%C3%B3rshavn",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "386",
				"name" => "Uliss Yerevan ",
				"country" => "Armenia",
				"stadium" => "Hrazdan Stadium",
				"home_page_url" => "http://fculisses.am/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Ulisses_FC",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "387",
				"name" => "FC Flora Tallin ",
				"country" => "Estonia",
				"stadium" => "A. Le Coq Arena",
				"home_page_url" => "http://www.fcflora.ee/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Flora_Tallinn",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "388",
				"name" => "KR Reykjavik",
				"country" => "Iceland",
				"stadium" => "KR-völlur",
				"home_page_url" => "http://www.kr.is/knattspyrna/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Knattspyrnuf%C3%A9lag_Reykjav%C3%ADkur",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "389",
				"name" => "FC Zestafoni",
				"country" => "Georgia",
				"stadium" => "David Abashidze Stadium",
				"home_page_url" => "http://www.fczestafoni.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Zestafoni",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "390",
				"name" => "SV Salzburg",
				"country" => "Austria",
				"stadium" => "Red Bull Arena",
				"home_page_url" => "http://redbulls.com/soccer/salzburg/en/home.html",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Red_Bull_Salzburg",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "391",
				"name" => "Lanciano",
				"country" => "Italy",
				"stadium" => "Stadio Guido Biondi",
				"home_page_url" => "http://www.virtuslanciano.it/",
				"wiki_link" => "http://en.wikipedia.org/wiki/S.S._Virtus_Lanciano_1924",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "392",
				"name" => "Pro Vercelli",
				"country" => "Italy",
				"stadium" => "Stadio Silvio Piola",
				"home_page_url" => "http://www.fcprovercelli.it/",
				"wiki_link" => "http://en.wikipedia.org/wiki/F.C._Pro_Vercelli_1892",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "393",
				"name" => "Ternana",
				"country" => "Italy",
				"stadium" => "Stadio Libero Liberati",
				"home_page_url" => "http://www.ternanacalcio.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Ternana_Calcio",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "394",
				"name" => "Shakhter Karaganda",
				"country" => "Kazakhstan",
				"stadium" => "Shakhtyor Stadium",
				"home_page_url" => "http://www.shahter.kz/?lang=eng",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Shakhter_Karagandy",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "395",
				"name" => "MSK Zilina ",
				"country" => "Slovakia",
				"stadium" => "Štadión pod Dubňom",
				"home_page_url" => "http://www.mskzilina.sk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/M%C5%A0K_%C5%BDilina",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "396",
				"name" => "T.N.S. ",
				"country" => "Wales",
				"stadium" => "Park Hall",
				"home_page_url" => "http://www.tnsfc.co.uk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/The_New_Saints_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "397",
				"name" => "Skenderbeu ",
				"country" => "Albania",
				"stadium" => "Stadiumi Skënderbeu",
				"home_page_url" => "http://www.kf-skenderbeu.webs.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/KF_Sk%C3%ABnderbeu_Kor%C3%A7%C3%AB",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "398",
				"name" => "Shamrock ",
				"country" => "Ireland",
				"stadium" => "Tallaght Stadium",
				"home_page_url" => "http://www.shamrockrovers.ie/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Shamrock_Rovers_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "399",
				"name" => "Vardar",
				"country" => "Macedonia",
				"stadium" => "Philip II Arena",
				"home_page_url" => "http://www.fkvardar.mk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FK_Vardar",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "400",
				"name" => "Zeljeznicar Sarajevo",
				"country" => "Bosnia and Herzegovina",
				"stadium" => "Grbavica",
				"home_page_url" => "http://www.fkzeljeznicar.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FK_%C5%BDeljezni%C4%8Dar_Sarajevo",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "401",
				"name" => "Ludogorets Razgrad ",
				"country" => "Bulgarian",
				"stadium" => "Ludogorets Arena",
				"home_page_url" => "http://www.ludogorets.com/all_news.php",
				"wiki_link" => "http://en.wikipedia.org/wiki/PFC_Ludogorets_Razgrad",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "402",
				"name" => "FK Ventspils",
				"country" => "Latvia",
				"stadium" => "Ventspils Olimpiskais Stadions",
				"home_page_url" => "http://www.fkventspils.lv/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FK_Ventspils",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "403",
				"name" => "Buducnost Podgorica ",
				"country" => "Montenegro",
				"stadium" => "Stadion Pod Goricom",
				"home_page_url" => "http://www.fkbuducnost.co.me/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FK_Budu%C4%87nost_Podgorica",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "404",
				"name" => "Elfsborg",
				"country" => "Sweden",
				"stadium" => "Borås Arena",
				"home_page_url" => "http://www.elfsborg.se/",
				"wiki_link" => "http://en.wikipedia.org/wiki/IF_Elfsborg",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "405",
				"name" => "Dinamo Moscow",
				"country" => "Russia",
				"stadium" => "Arena Khimki",
				"home_page_url" => "http://www.fcdynamo.ru/?lang=eng",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Dynamo_Moscow",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "406",
				"name" => "Omonia Nicosia",
				"country" => "Cyprus",
				"stadium" => "GSP Stadium",
				"home_page_url" => "http://www.omonoia.com.cy/",
				"wiki_link" => "http://en.wikipedia.org/wiki/AC_Omonia",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "407",
				"name" => "Crvena Zvezda",
				"country" => "Serbia",
				"stadium" => "Red Star Stadium",
				"home_page_url" => "http://www.crvenazvezdafk.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Red_Star_Belgrade",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "408",
				"name" => "Aktobe Lento",
				"country" => "Kazakhstan",
				"stadium" => "Central Stadium Aktobe",
				"home_page_url" => "http://www.fc-aktobe.kz/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Aktobe",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "409",
				"name" => "Slaven Belupo Koprivnica",
				"country" => "Croatia",
				"stadium" => "Gradski stadion",
				"home_page_url" => "http://www.nk-slaven-belupo.hr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/NK_Slaven_Belupo",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "410",
				"name" => "Rosenborg",
				"country" => "Norway",
				"stadium" => "Lerkendal Stadion",
				"home_page_url" => "http://www.rbk.no/english",
				"wiki_link" => "http://en.wikipedia.org/wiki/Rosenborg_BK",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "411",
				"name" => "Servette",
				"country" => "Switzerland",
				"stadium" => "Stade de Genève",
				"home_page_url" => "http://www.servettefc.ch/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Servette_FC",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "412",
				"name" => "Legia Warsaw",
				"country" => "Poland",
				"stadium" => "Polish Army Stadium",
				"home_page_url" => "http://legia.com/www/index_en.php",
				"wiki_link" => "http://en.wikipedia.org/wiki/Legia_Warsaw",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "413",
				"name" => "SV Josko Ried",
				"country" => "Austria",
				"stadium" => "Keine Sorgen Arena",
				"home_page_url" => "http://www.svried.at/",
				"wiki_link" => "http://en.wikipedia.org/wiki/SV_Ried",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "414",
				"name" => "Anorthosis Famagusta",
				"country" => "Cyprus",
				"stadium" => "Antonis Papadopoulos Stadium",
				"home_page_url" => "http://anorthosis.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Anorthosis_Famagusta_FC",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "415",
				"name" => "Dila Gori",
				"country" => "Georgia",
				"stadium" => "Tengiz Burjanadze Stadium",
				"home_page_url" => "http://fcdila.ge/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Dila_Gori",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "416",
				"name" => "Metalurg Donetsk",
				"country" => "Ukraine",
				"stadium" => "Metalurh Stadium",
				"home_page_url" => "http://metallurg.donetsk.ua/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Metalurh_Donetsk",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "417",
				"name" => "Tromso",
				"country" => "Norway",
				"stadium" => "Alfheim Stadion",
				"home_page_url" => "http://www.til.no/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Troms%C3%B8_IL",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "418",
				"name" => "Aalesund",
				"country" => "Norway",
				"stadium" => "Color Line Stadion",
				"home_page_url" => "http://www.aafk.no/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Aalesunds_FK",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "419",
				"name" => "Apoel Nicosia",
				"country" => "Cyprus",
				"stadium" => "GSP Stadium",
				"home_page_url" => "http://www.apoelfc.com.cy/",
				"wiki_link" => "http://en.wikipedia.org/wiki/APOEL_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "420",
				"name" => "Mlada Boleslav",
				"country" => "Czech Republic",
				"stadium" => "Městský stadion",
				"home_page_url" => "http://www.fkmb.eu/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FK_Mlad%C3%A1_Boleslav",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "421",
				"name" => "Young Boys",
				"country" => "Switzerland",
				"stadium" => "Stade de Suisse",
				"home_page_url" => "http://www.bscyb.ch/",
				"wiki_link" => "http://en.wikipedia.org/wiki/BSC_Young_Boys",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "422",
				"name" => "Kalmar FF",
				"country" => "Sweden",
				"stadium" => "Guldfågeln Arena",
				"home_page_url" => "http://www.kalmarff.se/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Kalmar_FF",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "423",
				"name" => "Videoton FC Fehervar",
				"country" => "Hungary",
				"stadium" => "Sóstói Stadion",
				"home_page_url" => "http://vidi.hu/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Videoton_FC",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "424",
				"name" => "FC Spartak Trnava",
				"country" => "Slovakia",
				"stadium" => "Štadión Antona Malatinského",
				"home_page_url" => "http://www.spartak.sk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Spartak_Trnava",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "425",
				"name" => "Steaua Bucuresti",
				"country" => "Romania",
				"stadium" => "Stadionul Steaua",
				"home_page_url" => "http://www.steauafc.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Steaua_Bucure%C8%99ti",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "426",
				"name" => "Anzhi Makhachkala",
				"country" => "Russia",
				"stadium" => "Dinamo Stadium",
				"home_page_url" => "http://www.fc-anji.ru/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Anzhi_Makhachkala",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "427",
				"name" => "Sparta Prague",
				"country" => "Czech Republic",
				"stadium" => "Generali Arena",
				"home_page_url" => "http://www.sparta.cz/",
				"wiki_link" => "http://en.wikipedia.org/wiki/AC_Sparta_Prague",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "428",
				"name" => "FC Trenkwalder Admira",
				"country" => "Austria",
				"stadium" => "Trenkwalder Arena",
				"home_page_url" => "http://www.trenkwalder-admira.com/kampfmannschaft/kader",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Admira_Wacker_M%C3%B6dling",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "429",
				"name" => "Bnei Yehuda",
				"country" => "Israel",
				"stadium" => "Bloomfield Stadium",
				"home_page_url" => "http://www.bneiyehuda.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Bnei_Yehuda_Tel_Aviv_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "430",
				"name" => "Lech Poznan",
				"country" => "Poland",
				"stadium" => "Stadion Miejski",
				"home_page_url" => "http://www.lechpoznan.pl/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Lech_Pozna%C5%84",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "431",
				"name" => "AIK",
				"country" => "Sweden",
				"stadium" => "Råsunda Stadium",
				"home_page_url" => "http://www.aikfotboll.se/",
				"wiki_link" => "http://en.wikipedia.org/wiki/AIK_Fotboll",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "432",
				"name" => "Zeta",
				"country" => "Montenegro",
				"stadium" => "Stadion Trešnjica",
				"home_page_url" => "http://www.fkzeta.me/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FK_Zeta",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "433",
				"name" => "FK Sarajevo",
				"country" => "Bosnia and Herzegovina",
				"stadium" => "Asim Ferhatović Hase Stadium",
				"home_page_url" => "http://fcsarajevo.ba/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FK_Sarajevo",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "434",
				"name" => "Mura",
				"country" => "Slovenia",
				"stadium" => "Fazanerija",
				"home_page_url" => "http://www.mura05.si/",
				"wiki_link" => "http://en.wikipedia.org/wiki/ND_Mura_05",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "435",
				"name" => "CSKA Kiev",
				"country" => "Ukraine",
				"stadium" => "Valeriy Lobanovskyi",
				"home_page_url" => "http://www.fcarsenal.com.ua/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Arsenal_Kyiv",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "436",
				"name" => "Viktoria Plzen",
				"country" => "Czech Republic",
				"stadium" => "Štruncovy Sady",
				"home_page_url" => "http://www.fcviktoria.cz/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Viktoria_Plze%C5%88",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "437",
				"name" => "Ruch Chorzow",
				"country" => "Poland",
				"stadium" => "Stadion Miejski",
				"home_page_url" => "http://www.ruchchorzow.com.pl/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Ruch_Chorz%C3%B3w",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "438",
				"name" => "Rapid Bucuresti",
				"country" => "Romania",
				"stadium" => "Giulești – Valentin Stănescu",
				"home_page_url" => "http://www.fcrapid.ro/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Rapid_Bucure%C8%99ti",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "439",
				"name" => "St Patricks",
				"country" => "Ireland",
				"stadium" => "Richmond Park",
				"home_page_url" => "http://www.stpatsfc.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/St_Patrick's_Athletic_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "440",
				"name" => "KuPS Kuopio",
				"country" => "Finland",
				"stadium" => "Savon Sanomat Areena",
				"home_page_url" => "http://www.kups.fi/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Kuopion_Palloseura",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "441",
				"name" => "Hajduk Split",
				"country" => "Croatia",
				"stadium" => "Stadion Poljud",
				"home_page_url" => "http://www.hajduk.hr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/HNK_Hajduk_Split",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "442",
				"name" => "Gomel",
				"country" => "Belarus",
				"stadium" => "Central Stadion",
				"home_page_url" => "http://www.fcgomel.by/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Gomel",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "443",
				"name" => "Rapid Vienna",
				"country" => "Austria",
				"stadium" => "Gerhard Hanappi Stadium",
				"home_page_url" => "http://www.skrapid.at/",
				"wiki_link" => "http://en.wikipedia.org/wiki/SK_Rapid_Wien",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "444",
				"name" => "Vojvodina",
				"country" => "Serbia",
				"stadium" => "Karađorđe Stadium",
				"home_page_url" => "http://www.fkvojvodina.rs/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FK_Vojvodina",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "445",
				"name" => "Maritimo",
				"country" => "Portugal",
				"stadium" => "Estádio dos Barreiros",
				"home_page_url" => "http://www.csmaritimo.pt/",
				"wiki_link" => "http://en.wikipedia.org/wiki/C.S._Mar%C3%ADtimo",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "446",
				"name" => "Shkendija 79 ",
				"country" => "Macedonia",
				"stadium" => "City Stadium Tetovo",
				"home_page_url" => "http://www.fcshkendija.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FK_Shk%C3%ABndija",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "447",
				"name" => "Portadown",
				"country" => "Northern Ireland",
				"stadium" => "Shamrock Park",
				"home_page_url" => "http://www.portadownfc.co.uk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Portadown_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "448",
				"name" => "Vikingur ",
				"country" => "Faroe Islands",
				"stadium" => "Serpugerdi Stadium",
				"home_page_url" => "http://www.vikingur.fo/",
				"wiki_link" => "http://en.wikipedia.org/wiki/V%C3%ADkingur_G%C3%B8ta",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "449",
				"name" => "Trans Narva ",
				"country" => "Estonia",
				"stadium" => "Kreenholmi Staadion",
				"home_page_url" => "http://www.fctrans.ee/index.php?lang=en",
				"wiki_link" => "http://en.wikipedia.org/wiki/JK_Narva_Trans",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "450",
				"name" => "MTK Hungaria ",
				"country" => "Hungary",
				"stadium" => "Stadion Hidegkuti Nándor",
				"home_page_url" => "http://www.mtkhungaria.hu/",
				"wiki_link" => "http://en.wikipedia.org/wiki/MTK_Budapest_FC",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "451",
				"name" => "Inter Bratislava",
				"country" => "Slovakia",
				"stadium" => "Štadión FK Senica",
				"home_page_url" => "http://www.fksenica.eu/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FK_Senica",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "452",
				"name" => "Newi Cefn Druids ",
				"country" => "Wales",
				"stadium" => "The Rock",
				"home_page_url" => "http://www.cefndruidsafc.co.uk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Cefn_Druids_A.F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "453",
				"name" => "MyPa",
				"country" => "Finland",
				"stadium" => "Saviniemi",
				"home_page_url" => "http://www.mypa.fi/",
				"wiki_link" => "http://en.wikipedia.org/wiki/MYPA",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "454",
				"name" => "UE Santa Coloma",
				"country" => "Andorra",
				"stadium" => "DEVK-Arena",
				"home_page_url" => "http://fclubsantacoloma.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Santa_Coloma",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "455",
				"name" => "Olimpija Ljubljana ",
				"country" => "Slovenia",
				"stadium" => "Stožice Stadium",
				"home_page_url" => "http://www.nkolimpija.si/",
				"wiki_link" => "http://en.wikipedia.org/wiki/NK_Olimpija_Ljubljana_(2005)",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "456",
				"name" => "Jeunesse Esch",
				"country" => "Luxemborg",
				"stadium" => "Stade de la Frontière",
				"home_page_url" => "http://www.jeunesse-esch.lu/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Jeunesse_Esch",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "457",
				"name" => "Birkirkara ",
				"country" => "Malta",
				"stadium" => "Infetti Ground",
				"home_page_url" => "http://www.birkirkarafc.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Birkirkara_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "458",
				"name" => "Metalurg",
				"country" => "Macedonia",
				"stadium" => "Železarnica Stadium",
				"home_page_url" => "http://www.fcmetalurg.com.mk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FK_Metalurg_Skopje",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "459",
				"name" => "SK Tirana ",
				"country" => "Albania",
				"stadium" => "Qemal Stafa stadium",
				"home_page_url" => "http://www.kftirana.info/",
				"wiki_link" => "http://en.wikipedia.org/wiki/KF_Tirana",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "460",
				"name" => "CS Grevenmacher",
				"country" => "Luxemborg",
				"stadium" => "Op Flohr Stadion",
				"home_page_url" => "http://www.csg.lu/",
				"wiki_link" => "http://en.wikipedia.org/wiki/CS_Grevenmacher",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "461",
				"name" => "Floriana FC",
				"country" => "Malta",
				"stadium" => "Independence Ground",
				"home_page_url" => "http://www.florianafc.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Floriana_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "462",
				"name" => "Santa Coloma ",
				"country" => "Andorra",
				"stadium" => "DEVK-Arena",
				"home_page_url" => "http://fclubsantacoloma.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Santa_Coloma",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "463",
				"name" => "Osijek",
				"country" => "Croatia",
				"stadium" => "Stadion Gradski vrt",
				"home_page_url" => "http://www.nk-osijek.hr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/NK_Osijek",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "464",
				"name" => "Torpedo Kutaisi ",
				"country" => "Georgia",
				"stadium" => "Givi Kiladze Stadium",
				"home_page_url" => "http://www.fctorpedo.ge/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Torpedo_Kutaisi",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "465",
				"name" => "Bohemians ",
				"country" => "Ireland",
				"stadium" => "Dalymount Park",
				"home_page_url" => "http://www.bohemians.ie/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Bohemian_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "466",
				"name" => "Thor",
				"country" => "Iceland",
				"stadium" => "Þórsvöllur",
				"home_page_url" => "http://www.thorsport.is/",
				"wiki_link" => "http://en.wikipedia.org/wiki/%C3%9E%C3%B3r_Akureyri",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "467",
				"name" => "Pyunik ",
				"country" => "Armenia",
				"stadium" => "Republican Stadium",
				"home_page_url" => "http://www.fcpyunik.am/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Pyunik",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "468",
				"name" => "FC Levadia Tallinn ",
				"country" => "Estonia",
				"stadium" => "Kadriorg Stadium",
				"home_page_url" => "http://fclevadia.ee/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Levadia_Tallinn",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "469",
				"name" => "FK Siauliai",
				"country" => "Lithuania",
				"stadium" => "Savivaldybė Stadium",
				"home_page_url" => "http://www.fcsiauliai.lt/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FK_%C5%A0iauliai",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "470",
				"name" => "FK Suduva ",
				"country" => "Lithuania",
				"stadium" => "Sūduva stadium",
				"home_page_url" => "http://www.fksuduva.lt/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FK_S%C5%ABduva_Marijampol%C4%97",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "471",
				"name" => "FC Daugava",
				"country" => "Latvia",
				"stadium" => "Daugavas stadions",
				"home_page_url" => "http://fcdaugava.lv/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Daugava",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "472",
				"name" => "Bangor City ",
				"country" => "Wales",
				"stadium" => "Nantporth",
				"home_page_url" => "http://www.bangorcityfc.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Bangor_City_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "473",
				"name" => "Zimbru Chisinau",
				"country" => "Moldova",
				"stadium" => "Zimbru",
				"home_page_url" => "http://www.zimbru.md/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Zimbru_Chi%C5%9Fin%C4%83u",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "474",
				"name" => "Jetysu Taldykorgan",
				"country" => "Kazakhstan",
				"stadium" => "Zhetysu Stadium",
				"home_page_url" => "http://www.fc-zhetisu.kz/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Zhetysu",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "475",
				"name" => "JJK ",
				"country" => "Finland",
				"stadium" => "Harjun Stadion",
				"home_page_url" => "http://www.fcjjk.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/JJK_Jyv%C3%A4skyl%C3%A4",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "476",
				"name" => "Stabaek",
				"country" => "Norway",
				"stadium" => "Nadderud Stadion",
				"home_page_url" => "http://www.stabak.no/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Stab%C3%A6k_Fotball",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "477",
				"name" => "KS Teuta ",
				"country" => "Albania",
				"stadium" => "Stadiumi Niko Dovana",
				"home_page_url" => "",
				"wiki_link" => "http://en.wikipedia.org/wiki/Teuta_Durr%C3%ABs",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "478",
				"name" => "Metalurgi Rustavi",
				"country" => "Georgia",
				"stadium" => "Poladi Stadium",
				"home_page_url" => "http://fcml.ge/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Metalurgi_Rustavi",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "479",
				"name" => "FC Dacia ",
				"country" => "Moldova",
				"stadium" => "Zimbru",
				"home_page_url" => "http://www.fcdacia.md/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Dacia_Chi%C5%9Fin%C4%83u",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "480",
				"name" => "CMC Publikum",
				"country" => "Slovenia",
				"stadium" => "Arena Petrol",
				"home_page_url" => "http://www.nk-celje.si/",
				"wiki_link" => "http://en.wikipedia.org/wiki/NK_Celje",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "481",
				"name" => "Khazar Lenkoran ",
				"country" => "Azerbaijan",
				"stadium" => "Lankaran City Stadium",
				"home_page_url" => "http://www.lankaranfc.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FK_Khazar_Lankaran",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "482",
				"name" => "Nomme Kalju",
				"country" => "Estonia",
				"stadium" => "Kadrioru Stadium",
				"home_page_url" => "http://www.jkkalju.ee/",
				"wiki_link" => "http://en.wikipedia.org/wiki/JK_N%C3%B5mme_Kalju",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "483",
				"name" => "FK Baku ",
				"country" => "Azerbaijan",
				"stadium" => "Tofig Bakhramov Stadium",
				"home_page_url" => "http://www.fcbaku.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Baku",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "484",
				"name" => "IBV",
				"country" => "Iceland",
				"stadium" => "Hásteinsvöllur",
				"home_page_url" => "http://www.ibv.is/",
				"wiki_link" => "http://en.wikipedia.org/wiki/%C3%8D%C3%BEr%C3%B3ttabandalag_Vestmannaeyja",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "485",
				"name" => "Cliftonville ",
				"country" => "Northern Ireland",
				"stadium" => "Solitude",
				"home_page_url" => "http://www.cliftonvillefc.net/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Cliftonville_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "486",
				"name" => "FC 03 Differdange ",
				"country" => "Luxemborg",
				"stadium" => "Stade du Thillenberg",
				"home_page_url" => "http://www.fcd03.lu/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Differdange_03",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "487",
				"name" => "NSI Runavik",
				"country" => "Faroe Islands",
				"stadium" => "Runavík Stadium",
				"home_page_url" => "http://www.nsi.fo/",
				"wiki_link" => "http://en.wikipedia.org/wiki/NS%C3%8D_Runav%C3%ADk",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "488",
				"name" => "Rudar Pljevlja ",
				"country" => "Montenegro",
				"stadium" => "Stadion Gradski",
				"home_page_url" => "http://www.fcrudarpljevlja.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FK_Rudar_Pljevlja",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "489",
				"name" => "Shirak",
				"country" => "Armenia",
				"stadium" => "Gyumri City Stadium",
				"home_page_url" => "http://fcshirak.am/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Shirak_FC",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "490",
				"name" => "EB Streymur ",
				"country" => "Faroe Islands",
				"stadium" => "Við Margáir",
				"home_page_url" => "http://www.eb-streymur.fo/",
				"wiki_link" => "http://en.wikipedia.org/wiki/EB/Streymur",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "491",
				"name" => "Gandzasar Kapan",
				"country" => "Armenia",
				"stadium" => "Gandzasar Stadium",
				"home_page_url" => "http://www.fcgandzasar.info/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Gandzasar_FC",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "493",
				"name" => "Kispest Honved",
				"country" => "Hungary",
				"stadium" => "Bozsik Stadion",
				"home_page_url" => "http://www.honvedfc.hu/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Budapest_Honv%C3%A9d_FC",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "494",
				"name" => "Renova ",
				"country" => "Macedonia",
				"stadium" => "City Stadium Tetovo",
				"home_page_url" => "http://www.renova.com.mk/en/non-economic_activities/fc_renova.aspx",
				"wiki_link" => "http://en.wikipedia.org/wiki/FK_Renova",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "495",
				"name" => "Libertas",
				"country" => "San Marino",
				"stadium" => "Campo sportivo di Borgo Maggiore",
				"home_page_url" => "",
				"wiki_link" => "http://en.wikipedia.org/wiki/A.C._Libertas",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "496",
				"name" => "Llanelli",
				"country" => "Wales",
				"stadium" => "Stebonheath Park",
				"home_page_url" => "http://www.llanelliafc.org/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Llanelli_A.F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "497",
				"name" => "Fiorita ",
				"country" => "San Marino",
				"stadium" => "Stadio Igor Crescentini",
				"home_page_url" => "http://www.lafiorita.sm/",
				"wiki_link" => "http://en.wikipedia.org/wiki/S.P._La_Fiorita",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "498",
				"name" => "FK Metalurgs",
				"country" => "Belarus",
				"stadium" => "Daugava Stadium",
				"home_page_url" => "http://www.skliepajasmetalurgs.lv/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FK_Liep%C4%81jas_Metalurgs",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "499",
				"name" => "FK Jagodina ",
				"country" => "Serbia",
				"stadium" => "Jagodina City Stadium",
				"home_page_url" => "http://www.fkjagodina.org.rs/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FK_Jagodina",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "500",
				"name" => "Ordabasy Shymkent",
				"country" => "Kazakhstan",
				"stadium" => "K.Munaitpasov Stadium",
				"home_page_url" => "http://www.fcordabasy.kz/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Ordabasy",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "501",
				"name" => "Crusaders ",
				"country" => "Northern Ireland",
				"stadium" => "Seaview",
				"home_page_url" => "http://www.crusadersfc.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Crusaders_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "502",
				"name" => "Borac Cacak ",
				"country" => "Serbia",
				"stadium" => "Čačak Stadium",
				"home_page_url" => "http://www.boracfk.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FK_Borac_%C4%8Ca%C4%8Dak",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "503",
				"name" => "Celik",
				"country" => "Bosnia and Herzegovina",
				"stadium" => "Bilino Polje",
				"home_page_url" => "http://www.nkcelik.ba/",
				"wiki_link" => "http://en.wikipedia.org/wiki/NK_%C4%8Celik_Zenica",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "504",
				"name" => "FH Hafnarfjordur ",
				"country" => "Iceland",
				"stadium" => "Kaplakriki",
				"home_page_url" => "http://www.fh.is/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Fimleikaf%C3%A9lag_Hafnarfjar%C3%B0ar",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "505",
				"name" => "USV Eschen/Mauren",
				"country" => "Switzerland",
				"stadium" => "Sportpark Eschen-Mauren",
				"home_page_url" => "http://www.usv.li/",
				"wiki_link" => "http://en.wikipedia.org/wiki/USV_Eschen/Mauren",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "506",
				"name" => "FK Senica ",
				"country" => "Slovakia",
				"stadium" => "http://www.fksenica.eu/",
				"home_page_url" => "http://www.fksenica.eu/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FK_Senica",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "507",
				"name" => "FC Milsami ",
				"country" => "Moldova",
				"stadium" => "Complexul Sportiv Raional",
				"home_page_url" => "http://www.milsami.md/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Milsami",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "508",
				"name" => "Levski Sofia ",
				"country" => "Bulgarian",
				"stadium" => "Georgi Asparuhov Stadium",
				"home_page_url" => "http://www.levski.bg/",
				"wiki_link" => "http://en.wikipedia.org/wiki/PFC_Levski_Sofia",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "509",
				"name" => "FC Inter",
				"country" => "Finland",
				"stadium" => "Veritas Stadion",
				"home_page_url" => "http://www.fcinter.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Inter_Turku",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "510",
				"name" => "Maccabi Netanya ",
				"country" => "Israel",
				"stadium" => "Sar-Tov Stadium",
				"home_page_url" => "http://www.fcmn.co.il/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Maccabi_Netanya_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "511",
				"name" => "CSKA Sofia",
				"country" => "Bulgarian",
				"stadium" => "Balgarska Armia Stadium",
				"home_page_url" => "http://www.cska.bg/",
				"wiki_link" => "http://en.wikipedia.org/wiki/PFC_CSKA_Sofia",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "512",
				"name" => "Skonto Riga",
				"country" => "Latvia",
				"stadium" => "Skonto Stadium",
				"home_page_url" => "http://www.skontofc.lv/lv/main",
				"wiki_link" => "http://en.wikipedia.org/wiki/Skonto_FC",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "513",
				"name" => "Slovan Bratislava ",
				"country" => "Slovakia",
				"stadium" => "Pasienky",
				"home_page_url" => "http://www.skslovan.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/%C5%A0K_Slovan_Bratislava",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "514",
				"name" => "Shakhter Soligorsk ",
				"country" => "Belarus",
				"stadium" => "Stroitel Stadium",
				"home_page_url" => "http://www.fcshakhter.by/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Shakhtyor_Salihorsk",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "515",
				"name" => "Lokomotiv Plovdiv ",
				"country" => "Bulgarian",
				"stadium" => "Lokomotiv Stadium",
				"home_page_url" => "http://lokomotivpd.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/PFC_Lokomotiv_Plovdiv",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "516",
				"name" => "Sligo",
				"country" => "Ireland",
				"stadium" => "Showgrounds",
				"home_page_url" => "http://www.sligorovers.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Sligo_Rovers_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "517",
				"name" => "Naftan Novopolotsk ",
				"country" => "Belarus",
				"stadium" => "Atlant Stadium",
				"home_page_url" => "http://www.fcnaftan.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Naftan_Novopolotsk",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "518",
				"name" => "VMFD Zalgiris ",
				"country" => "Lithuania",
				"stadium" => "LFF stadium",
				"home_page_url" => "http://www.zalgiris-vilnius.lt/lt/pagrindine_komanda",
				"wiki_link" => "http://en.wikipedia.org/wiki/VMFD_%C5%BDalgiris_Vilnius",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "519",
				"name" => "Siroki Brijeg ",
				"country" => "Bosnia and Herzegovina",
				"stadium" => "Pecara Stadium",
				"home_page_url" => "http://www.nk-sirokibrijeg.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/NK_%C5%A0iroki_Brijeg",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "520",
				"name" => "Spartak Moscow",
				"country" => "Russia",
				"stadium" => "Luzhniki Stadium",
				"home_page_url" => "http://www.spartak.com/main",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Spartak_Moscow",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "521",
				"name" => "Braga",
				"country" => "Portugal",
				"stadium" => "Estádio Municipal",
				"home_page_url" => "http://www.scbraga.pt/",
				"wiki_link" => "http://en.wikipedia.org/wiki/S.C._Braga",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "352",
				"name" => "SPVGG Greuther Fürth",
				"country" => "Germany",
				"stadium" => "Trolli Arena",
				"home_page_url" => "http://www.greuther-fuerth.de/",
				"wiki_link" => "http://en.wikipedia.org/wiki/SpVgg_Greuther_F%C3%BCrth",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "523",
				"name" => "Akhisar Belediyespor",
				"country" => "Turkey",
				"stadium" => "Akhisar Belediye",
				"home_page_url" => "http://www.akhisarspor.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Akhisar_Belediyespor",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "524",
				"name" => "Elazigspor",
				"country" => "Turkey",
				"stadium" => "Elazığ Atatürk Stadı",
				"home_page_url" => "http://www.elazigspor.org.tr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Elaz%C4%B1%C4%9Fspor",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "525",
				"name" => "Platanias",
				"country" => "Greece",
				"stadium" => "http://www.fcplatanias.gr/",
				"home_page_url" => "Perivolia Municipal Stadium",
				"wiki_link" => "http://en.wikipedia.org/wiki/Platanias_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "526",
				"name" => "Ternana Calcio",
				"country" => "Italy",
				"stadium" => "Stadio Libero Liberati",
				"home_page_url" => "http://www.ternanacalcio.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Ternana_Calcio",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "492",
				"name" => "Flamurtari Vlorë",
				"country" => "Albania",
				"stadium" => "Stadiumi Flamurtari",
				"home_page_url" => "http://www.skflamurtari.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Flamurtari_Vlor%C3%AB",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "527",
				"name" => "FC Pro Vercelli 1892",
				"country" => "Italy",
				"stadium" => "Stadio Silvio Piola",
				"home_page_url" => "http://www.fcprovercelli.it/",
				"wiki_link" => "http://en.wikipedia.org/wiki/F.C._Pro_Vercelli_1892",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "528",
				"name" => "Olhanense ",
				"country" => "Portugal",
				"stadium" => "José Arcanjo",
				"home_page_url" => "http://www.scolhanense.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/S.C._Olhanense",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "529",
				"name" => "Estoril-Praia",
				"country" => "Portugal",
				"stadium" => "Estádio António Coimbra da Mota",
				"home_page_url" => "http://www.estorilpraia.pt/",
				"wiki_link" => "http://en.wikipedia.org/wiki/G.D._Estoril_Praia",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "530",
				"name" => "Rio Ave ",
				"country" => "Portugal",
				"stadium" => "Estádio do Rio Ave",
				"home_page_url" => "http://www.rioave-fc.pt/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Rio_Ave_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "531",
				"name" => "Benfica ",
				"country" => "Portugal",
				"stadium" => "Estádio da Luz",
				"home_page_url" => "http://www.slbenfica.pt/",
				"wiki_link" => "http://en.wikipedia.org/wiki/S.L._Benfica",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "532",
				"name" => "CD Nacional de Madeira ",
				"country" => "Portugal",
				"stadium" => "Estádio da Madeira",
				"home_page_url" => "http://www.cdnacional.pt/",
				"wiki_link" => "http://en.wikipedia.org/wiki/C.D._Nacional",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "533",
				"name" => "Vitoria Setubal",
				"country" => "Portugal",
				"stadium" => "Estádio do Bonfim",
				"home_page_url" => "http://www.vfc.pt/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Vit%C3%B3ria_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "534",
				"name" => "F.C. Paços de Ferreira",
				"country" => "Portugal",
				"stadium" => "Mata Real",
				"home_page_url" => "http://www.fcpf.pt/",
				"wiki_link" => "http://en.wikipedia.org/wiki/F.C._Pa%C3%A7os_de_Ferreira",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "535",
				"name" => "Moreirense",
				"country" => "Portugal",
				"stadium" => "Parque Joaquim Almeida Freitas",
				"home_page_url" => "http://www.moreirensefc.pt/inicio.php",
				"wiki_link" => "http://en.wikipedia.org/wiki/Moreirense_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "536",
				"name" => "Gil Vicente ",
				"country" => "Portugal",
				"stadium" => "Estádio Cidade de Barcelos",
				"home_page_url" => "http://www.gilvicentefc.pt/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Gil_Vicente_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "537",
				"name" => "FC Porto",
				"country" => "Portugal",
				"stadium" => "Estádio do Dragão",
				"home_page_url" => "http://www.fcporto.pt/",
				"wiki_link" => "http://en.wikipedia.org/wiki/F.C._Porto",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "538",
				"name" => "Guimaraes",
				"country" => "Portugal",
				"stadium" => "Estádio D. Afonso Henriques",
				"home_page_url" => "http://www.vitoriasc.pt/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Vit%C3%B3ria_S.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "539",
				"name" => "Sporting Lisbon",
				"country" => "Portugal",
				"stadium" => "Estádio José Alvalade",
				"home_page_url" => "http://www.sporting.pt/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Sporting_Clube_de_Portugal",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "540",
				"name" => "Beira Mar",
				"country" => "Portugal",
				"stadium" => "Estádio Municipal",
				"home_page_url" => "http://www.beiramar.pt/",
				"wiki_link" => "http://en.wikipedia.org/wiki/S.C._Beira-Mar",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "541",
				"name" => "Associação Académica de Coimbra",
				"country" => "Portugal",
				"stadium" => "Estádio Cidade de Coimbra",
				"home_page_url" => "http://www.academica-oaf.pt/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Associa%C3%A7%C3%A3o_Acad%C3%A9mica_de_Coimbra_-_O.A.F.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "542",
				"name" => "Dnipro",
				"country" => "Ukraine",
				"stadium" => "Dnipro Arena",
				"home_page_url" => "http://www.fcdnipro.ua/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Dnipro_Dnipropetrovsk",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "543",
				"name" => "CSKA Moscow",
				"country" => "Russia",
				"stadium" => "Arena Khimki",
				"home_page_url" => "http://www.pfc-cska.com/splash/index_en.html",
				"wiki_link" => "http://en.wikipedia.org/wiki/PFC_CSKA_Moscow",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "544",
				"name" => "Dinamo Bucuresti ",
				"country" => "Romania",
				"stadium" => "Stadionul Dinamo",
				"home_page_url" => "http://www.fcdinamo.ro/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Dinamo_Bucure%C8%99ti",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "545",
				"name" => "FC Metalist Kharkiv",
				"country" => "Ukraine",
				"stadium" => "Metalist Stadium",
				"home_page_url" => "http://metalist.ua/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Metalist_Kharkiv",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "546",
				"name" => "Lucerne ",
				"country" => "Switzerland",
				"stadium" => "Swissporarena",
				"home_page_url" => "http://www.fcl.ch/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Luzern",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "547",
				"name" => "Hapoel Tel-Aviv",
				"country" => "Israel",
				"stadium" => "Bloomfield Stadium",
				"home_page_url" => "http://hapoelta-fc.co.il/en/about/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Hapoel_Tel_Aviv_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "548",
				"name" => "Zenit St Petersburg",
				"country" => "Russia",
				"stadium" => "Petrovsky Stadium",
				"home_page_url" => "http://www.fc-zenit.ru/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Zenit_Saint_Petersburg",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "549",
				"name" => "Shakhtar Donetsk",
				"country" => "Ukraine",
				"stadium" => "Donbass Arena",
				"home_page_url" => "http://shakhtar.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Shakhtar_Donetsk",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "550",
				"name" => "FK Rubin Kazan",
				"country" => "Russia",
				"stadium" => "Tsentralnyi Stadion",
				"home_page_url" => "http://www.rubin-kazan.ru/en/main/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Rubin_Kazan",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "551",
				"name" => "SS Virtus Lanciano 1924",
				"country" => "Italy",
				"stadium" => "Stadio Guido Biondi",
				"home_page_url" => "http://www.virtuslanciano.it/",
				"wiki_link" => "http://en.wikipedia.org/wiki/S.S._Virtus_Lanciano_1924",
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
				"team_id" => "567",
				"name" => "Ajax/Steaua Bucuresti",
				"country" => "Holland",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "568",
				"name" => "Sparta Prague/Chelsea",
				"country" => "Czech Republic",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "569",
				"name" => "Atletico Madrid/Rubin Kazan",
				"country" => "Spain",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "570",
				"name" => "Levante/Olympiacos",
				"country" => "Greece",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "571",
				"name" => "Philadelphia Union",
				"country" => "USA",
				"stadium" => "PPL Park",
				"home_page_url" => "http://www.philadelphiaunion.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Philadelphia_Union",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "572",
				"name" => "Sporting Kansas City",
				"country" => "USA",
				"stadium" => "Sporting Park",
				"home_page_url" => "http://www.sportingkc.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Sporting_Kansas_City",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "573",
				"name" => "Houston Dynamo",
				"country" => "USA",
				"stadium" => "BBVA Compass Stadium",
				"home_page_url" => "http://www.houstondynamo.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Houston_Dynamo",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "574",
				"name" => "DC United",
				"country" => "USA",
				"stadium" => "RFK Stadium",
				"home_page_url" => "http://www.dcunited.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/D.C._United",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "575",
				"name" => "FC Dallas",
				"country" => "USA",
				"stadium" => "FC Dallas Stadium",
				"home_page_url" => "http://www.fcdallas.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Dallas",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "576",
				"name" => "Colorado Rapids",
				"country" => "USA",
				"stadium" => "Dick's Sporting Goods Park",
				"home_page_url" => "http://www.coloradorapids.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Colorado_Rapids",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "577",
				"name" => "Vancouver Whitecaps",
				"country" => "USA",
				"stadium" => "BC Place",
				"home_page_url" => "http://www.whitecapsfc.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Vancouver_Whitecaps_FC",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "578",
				"name" => "Toronto FC",
				"country" => "USA",
				"stadium" => "BMO Field",
				"home_page_url" => "http://www.torontofc.ca/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Toronto_FC",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "579",
				"name" => "Seattle Sounders FC",
				"country" => "USA",
				"stadium" => "CenturyLink Field",
				"home_page_url" => "http://www.soundersfc.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Seattle_Sounders_FC",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "580",
				"name" => "Montreal Impact",
				"country" => "USA",
				"stadium" => "Saputo Stadium",
				"home_page_url" => "http://www.impactmontreal.com/en",
				"wiki_link" => "http://en.wikipedia.org/wiki/Montreal_Impact",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "581",
				"name" => "CD Chivas USA",
				"country" => "USA",
				"stadium" => "The Home Depot Center",
				"home_page_url" => "http://www.cdchivasusa.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/C.D._Chivas_USA",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "582",
				"name" => "Columbus Crew",
				"country" => "USA",
				"stadium" => "Columbus Crew Stadium",
				"home_page_url" => "http://www.thecrew.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Columbus_Crew",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "583",
				"name" => "L.A. Galaxy",
				"country" => "USA",
				"stadium" => "The Home Depot Center",
				"home_page_url" => "http://www.lagalaxy.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Los_Angeles_Galaxy",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "584",
				"name" => "Chicago Fire",
				"country" => "USA",
				"stadium" => "Toyota Park",
				"home_page_url" => "http://www.chicago-fire.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Chicago_Fire_Soccer_Club",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "585",
				"name" => "Portland Timbers",
				"country" => "USA",
				"stadium" => "Jeld-Wen Field",
				"home_page_url" => "http://www.portlandtimbers.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Portland_Timbers",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "586",
				"name" => "New York Red Bulls",
				"country" => "USA",
				"stadium" => "Red Bull Arena",
				"home_page_url" => "http://www.newyorkredbulls.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/New_York_Red_Bulls",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "587",
				"name" => "San Jose Earthquakes",
				"country" => "USA",
				"stadium" => "Buck Shaw Stadium",
				"home_page_url" => "http://www.sjearthquakes.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/San_Jose_Earthquakes",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "588",
				"name" => "Real Salt Lake",
				"country" => "USA",
				"stadium" => "Rio Tinto Stadium",
				"home_page_url" => "http://www.realsaltlake.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Real_Salt_Lake",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "589",
				"name" => "New England Rev.",
				"country" => "USA",
				"stadium" => "Gillette Stadium",
				"home_page_url" => "http://www.revolutionsoccer.net/",
				"wiki_link" => "http://en.wikipedia.org/wiki/New_England_Revolution",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "590",
				"name" => "Hacken",
				"country" => "Sweden",
				"stadium" => "Rambergsvallen",
				"home_page_url" => "http://www.bkhacken.se/",
				"wiki_link" => "http://en.wikipedia.org/wiki/BK_H%C3%A4cken",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "591",
				"name" => "IFK Gothenburg",
				"country" => "Sweden",
				"stadium" => "Gamla Ullevi",
				"home_page_url" => "http://www.ifkgoteborg.se/",
				"wiki_link" => "http://en.wikipedia.org/wiki/IFK_G%C3%B6teborg",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "592",
				"name" => "Djurgaarden",
				"country" => "Sweden",
				"stadium" => "Stockholms Stadion",
				"home_page_url" => "http://dif.se//",
				"wiki_link" => "http://en.wikipedia.org/wiki/Djurg%C3%A5rdens_IF_Fotboll",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "593",
				"name" => "Syrianska",
				"country" => "Sweden",
				"stadium" => "Södertälje Fotbollsarena",
				"home_page_url" => "http://www.syrianskafc.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Syrianska_FC",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "594",
				"name" => "Mjallby",
				"country" => "Sweden",
				"stadium" => "Strandvallen",
				"home_page_url" => "http://www.maif.se/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Mj%C3%A4llby_AIF",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "595",
				"name" => "Norrkoping",
				"country" => "Sweden",
				"stadium" => "Idrottsparken",
				"home_page_url" => "http://www.ifknorrkoping.se/",
				"wiki_link" => "http://en.wikipedia.org/wiki/IFK_Norrk%C3%B6ping",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "596",
				"name" => "Malmo FF",
				"country" => "Sweden",
				"stadium" => "Swedbank Stadion",
				"home_page_url" => "http://www.mff.se/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Malm%C3%B6_FF",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "597",
				"name" => "Halmstad",
				"country" => "Sweden",
				"stadium" => "Örjans Vall",
				"home_page_url" => "http://www.hbk.se/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Halmstads_BK",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "598",
				"name" => "Gefle",
				"country" => "Sweden",
				"stadium" => "Strömvallen",
				"home_page_url" => "http://www.gefleiffotboll.se/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Gefle_IF",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "599",
				"name" => "Åtvidaberg",
				"country" => "Sweden",
				"stadium" => "Kopparvallen",
				"home_page_url" => "http://www.atvidabergsff.se/",
				"wiki_link" => "http://en.wikipedia.org/wiki/%C3%85tvidabergs_FF",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "600",
				"name" => "Brommapojkarna",
				"country" => "Sweden",
				"stadium" => "Grimsta IP",
				"home_page_url" => "http://www.brommapojkarna.se/",
				"wiki_link" => "http://en.wikipedia.org/wiki/IF_Brommapojkarna",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "601",
				"name" => "Osters IF",
				"country" => "Sweden",
				"stadium" => "Myresjöhus Arena",
				"home_page_url" => "http://www.ostersif.se/",
				"wiki_link" => "http://en.wikipedia.org/wiki/%C3%96sters_IF",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "602",
				"name" => "Levante/Olympiakos",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "603",
				"name" => "Basel/Dnipro",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "604",
				"name" => "Zenit Petersburg/Liverpool",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "605",
				"name" => "SSC Napoli/Plzen",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "606",
				"name" => "BATE Borisov/Fenerbahce",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "607",
				"name" => "Bayer Leverkusen/Benfica",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "608",
				"name" => "Dynamo Kiev/Bordeaux",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "609",
				"name" => "Anzhi Makhachkala/Hannover 96",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "610",
				"name" => "Newcastle/Metalist Kharkiv",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "611",
				"name" => "VfB Stuttgart/Genk",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "612",
				"name" => "Borussia Monchengladbach/Lazio",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "613",
				"name" => "Tottenham/Lyon",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "614",
				"name" => "Inter/CFR Cluj",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "615",
				"name" => "Oldham",
				"country" => "England",
				"stadium" => "Boundary Park",
				"home_page_url" => "http://www.oldhamathletic.co.uk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Oldham_Athletic_A.F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "616",
				"name" => "Oldham/Everton",
				"country" => "England",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "617",
				"name" => "Manchester United/Reading",
				"country" => "England",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "618",
				"name" => "Middlesbrough/Chelsea",
				"country" => "England",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "619",
				"name" => "Bradford",
				"country" => "England",
				"stadium" => "Valley Parade",
				"home_page_url" => "http://www.bradfordcityfc.co.uk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Bradford_City_A.F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "620",
				"name" => "Morelia",
				"country" => "Mexico",
				"stadium" => "Estadio Morelos",
				"home_page_url" => "http://www.fuerzamonarca.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Monarcas_Morelia",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "621",
				"name" => "Pachuca",
				"country" => "Mexico",
				"stadium" => "Estadio Hidalgo",
				"home_page_url" => "http://www.tuzos.com.mx/",
				"wiki_link" => "http://en.wikipedia.org/wiki/C.F._Pachuca",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "622",
				"name" => "Santos",
				"country" => "Mexico",
				"stadium" => "Estadio Corona",
				"home_page_url" => "http://www.clubsantoslaguna.com.mx/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Club_Santos_Laguna",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "623",
				"name" => "CF America",
				"country" => "Mexico",
				"stadium" => "Estadio Azteca",
				"home_page_url" => "http://www.clubamerica.com.mx/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Club_Am%C3%A9rica",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "624",
				"name" => "Queretaro FC",
				"country" => "Mexico",
				"stadium" => "Estadio La Corregidora",
				"home_page_url" => "http://www.clubqueretaro.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Quer%C3%A9taro_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "625",
				"name" => "Atlas",
				"country" => "Mexico",
				"stadium" => "Jalisco",
				"home_page_url" => "http://www.atlas.com.mx/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Club_Atlas",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "626",
				"name" => "Cruz Azul",
				"country" => "Mexico",
				"stadium" => "Estadio Azul",
				"home_page_url" => "http://www.cruzazulfc.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Cruz_Azul",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "627",
				"name" => "Tigres",
				"country" => "Mexico",
				"stadium" => "Estadio Universitario",
				"home_page_url" => "http://www.tigres.com.mx/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Tigres_de_la_UANL",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "628",
				"name" => "Monterrey",
				"country" => "Mexico",
				"stadium" => "Tecnológico",
				"home_page_url" => "http://www.rayados.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/C.F._Monterrey",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "629",
				"name" => "Puebla",
				"country" => "Mexico",
				"stadium" => "Estadio Cuauhtémoc",
				"home_page_url" => "http://www.pueblafutbolclub.com.mx/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Puebla_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "630",
				"name" => "San Luis",
				"country" => "Mexico",
				"stadium" => "Estadio Alfonso Lastras",
				"home_page_url" => "http://www.clubsanluis.com.mx/",
				"wiki_link" => "http://en.wikipedia.org/wiki/San_Luis_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "631",
				"name" => "Pumas",
				"country" => "Mexico",
				"stadium" => "Estadio Olímpico Universitario",
				"home_page_url" => "http://www.clubpumasunam.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Club_Universidad_Nacional",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "632",
				"name" => "Tijuana",
				"country" => "Mexico",
				"stadium" => "Estadio Caliente",
				"home_page_url" => "http://xolos.com.mx/sitio/index.php/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Club_Tijuana",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "633",
				"name" => "Atlante",
				"country" => "Mexico",
				"stadium" => "Andrés Quintana Roo",
				"home_page_url" => "http://www.atlantefc.com.mx/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Atlante_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "634",
				"name" => "Toluca",
				"country" => "Mexico",
				"stadium" => "Nemesio Díez",
				"home_page_url" => "http://www.deportivotolucafc.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Deportivo_Toluca_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "635",
				"name" => "Jaguares",
				"country" => "Mexico",
				"stadium" => "Estadio Victor Manuel Reyna",
				"home_page_url" => "http://www.soyjaguar.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Jaguares_de_Chiapas",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "636",
				"name" => "CD Guadalajara",
				"country" => "Mexico",
				"stadium" => "Estadio Omnilife",
				"home_page_url" => "http://www.chivasdecorazon.com.mx/",
				"wiki_link" => "http://en.wikipedia.org/wiki/C.D._Guadalajara",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "637",
				"name" => "Leon",
				"country" => "Mexico",
				"stadium" => "Nou Camp",
				"home_page_url" => "http://www.clubleon-fc.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Club_Le%C3%B3n",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "663",
				"name" => "Manchester United/Chelsea",
				"country" => "England",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "664",
				"name" => "Southend",
				"country" => "England",
				"stadium" => "Roots Hall",
				"home_page_url" => "http://www.southendunited.premiumtv.co.uk/page/Home/0,,10444,00.html",
				"wiki_link" => "http://en.wikipedia.org/wiki/Southend_United_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "665",
				"name" => "Aachen",
				"country" => "Germany",
				"stadium" => "New Tivoli",
				"home_page_url" => "http://www.alemannia-aachen.de/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Alemannia_Aachen",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "666",
				"name" => "Gimnastic",
				"country" => "Spain",
				"stadium" => "Nou Estadi",
				"home_page_url" => "http://www.gimnasticdetarragona.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Gimn%C3%A0stic_de_Tarragona",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "667",
				"name" => "Arezzo",
				"country" => "Italy",
				"stadium" => "Stadio Città di Arezzo",
				"home_page_url" => "http://www.atleticoarezzo.it/",
				"wiki_link" => "http://en.wikipedia.org/wiki/U.S.D._Arezzo",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "668",
				"name" => "Sedan",
				"country" => "France",
				"stadium" => "Stade Louis Dugauguez",
				"home_page_url" => "http://www.cssedan.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/CS_Sedan_Ardennes",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "669",
				"name" => "Erciyesspor",
				"country" => "Turkey",
				"stadium" => "Kadir Has Stadium",
				"home_page_url" => "http://www.erciyesspor.org.tr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Kayseri_Erciyesspor",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "670",
				"name" => "Sakaryaspor",
				"country" => "Turkey",
				"stadium" => "Adapazarı Atatürk Stadyumu",
				"home_page_url" => "http://www.sakaryaspor.com.tr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Sakaryaspor",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "671",
				"name" => "Egaleo",
				"country" => "Greece",
				"stadium" => "Stavros Mavrothalassitis",
				"home_page_url" => "",
				"wiki_link" => "http://en.wikipedia.org/wiki/Egaleo_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "672",
				"name" => "Ionikos",
				"country" => "Greece",
				"stadium" => "Neapolis Public Stadium",
				"home_page_url" => "http://www.ionikos-fc.gr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Ionikos_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "673",
				"name" => "Crewe",
				"country" => "England",
				"stadium" => "Alexandra Stadium",
				"home_page_url" => "http://www.crewealex.net/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Crewe_Alexandra_F.C.",
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
				"team_id" => "676",
				"name" => "Alaves",
				"country" => "Spain",
				"stadium" => "Mendizorroza",
				"home_page_url" => "http://www.alaves.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Deportivo_Alav%C3%A9s",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "677",
				"name" => "Cadiz",
				"country" => "Spain",
				"stadium" => "Ramón de Carranza",
				"home_page_url" => "http://www.cadizcf.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/C%C3%A1diz_CF",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "678",
				"name" => "Catanzaro",
				"country" => "Italy",
				"stadium" => "Stadio Nicola Ceravolo",
				"home_page_url" => "http://www.uscatanzaro1929.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/U.S._Catanzaro_1929",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "679",
				"name" => "Cremonese",
				"country" => "Italy",
				"stadium" => "Stadio Giovanni Zini",
				"home_page_url" => "http://www.uscremonese.it/",
				"wiki_link" => "http://en.wikipedia.org/wiki/U.S._Cremonese",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "680",
				"name" => "Louvieroise",
				"country" => "Belgium",
				"stadium" => "Stade du Tivoli",
				"home_page_url" => "",
				"wiki_link" => "http://en.wikipedia.org/wiki/R.A.A._Louvi%C3%A9roise",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "681",
				"name" => "Roosendaal",
				"country" => "Holland",
				"stadium" => "Sportpark Rimboe",
				"home_page_url" => "",
				"wiki_link" => "http://en.wikipedia.org/wiki/RBC_Roosendaal",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "682",
				"name" => "Malatyaspor",
				"country" => "Turkey",
				"stadium" => "Malatya İnönü Stadi",
				"home_page_url" => "http://www.malatyaspor.org.tr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Malatyaspor",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "683",
				"name" => "Kallithea",
				"country" => "Greece",
				"stadium" => "Gregoris Lambrakis Stadium",
				"home_page_url" => "http://www.kallitheafc.gr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Kallithea_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "684",
				"name" => "Akratitos",
				"country" => "Greece",
				"stadium" => "Yannis Pathiakakis Stadium",
				"home_page_url" => "",
				"wiki_link" => "http://en.wikipedia.org/wiki/Akratitos_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "685",
				"name" => "Gillingham",
				"country" => "England",
				"stadium" => "Priestfield Stadium",
				"home_page_url" => "http://www.gillinghamfootballclub.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Gillingham_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "686",
				"name" => "Rotherham",
				"country" => "England",
				"stadium" => "New York Stadium",
				"home_page_url" => "http://www.themillers.co.uk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Rotherham_United_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "687",
				"name" => "Albacete",
				"country" => "Spain",
				"stadium" => "Carlos Belmonte",
				"home_page_url" => "http://www.albacete-bp.es/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Albacete_Balompi%C3%A9",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "688",
				"name" => "Perugia",
				"country" => "Italy",
				"stadium" => "Stadio Renato Curi",
				"home_page_url" => "http://www.acperugiacalcio.it/index.php",
				"wiki_link" => "http://en.wikipedia.org/wiki/A.C._Perugia_Calcio",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "689",
				"name" => "Venezia",
				"country" => "Italy",
				"stadium" => "Stadio Pierluigi Penzo",
				"home_page_url" => "http://www.fbcunionevenezia.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/F.B.C._Unione_Venezia",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "690",
				"name" => "Istres",
				"country" => "France",
				"stadium" => "Stade Parsemain",
				"home_page_url" => "http://www.fcistres.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Istres",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "691",
				"name" => "FC Den Bosch",
				"country" => "Holland",
				"stadium" => "de Vliert",
				"home_page_url" => "http://www.fcdenbosch.nl/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Den_Bosch",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "692",
				"name" => "A. Sebatspor",
				"country" => "Turkey",
				"stadium" => "Akçaabat Fatih Stadyumu",
				"home_page_url" => "",
				"wiki_link" => "http://en.wikipedia.org/wiki/Ak%C3%A7aabat_Sebatspor",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "693",
				"name" => "Istanbulspor",
				"country" => "Turkey",
				"stadium" => "Bahçelievler Stadium",
				"home_page_url" => "http://www.istanbulspor.com.tr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/%C4%B0stanbulspor_A.%C5%9E.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "694",
				"name" => "Chalkidona",
				"country" => "Greece",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "http://wiki.phantis.com/index.php/Chalkidona_FC",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "695",
				"name" => "Walsall",
				"country" => "England",
				"stadium" => "Bescot Stadium",
				"home_page_url" => "http://www.saddlers.co.uk/page/Home",
				"wiki_link" => "http://en.wikipedia.org/wiki/Walsall_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "696",
				"name" => "Wimbledon",
				"country" => "England",
				"stadium" => "National Hockey Stadium",
				"home_page_url" => "http://www.afcwimbledon.co.uk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Wimbledon_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "697",
				"name" => "Munich 1860",
				"country" => "Germany",
				"stadium" => "Allianz Arena",
				"home_page_url" => "http://www.tsv1860.de/",
				"wiki_link" => "http://en.wikipedia.org/wiki/TSV_1860_M%C3%BCnchen",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "698",
				"name" => "Como",
				"country" => "Italy",
				"stadium" => "Giuseppe Sinigaglia",
				"home_page_url" => "http://www.calciocomo1907.it/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Calcio_Como",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "699",
				"name" => "Guingamp",
				"country" => "France",
				"stadium" => "Stade du Roudourou",
				"home_page_url" => "http://www.eaguingamp.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/En_Avant_de_Guingamp",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "700",
				"name" => "Antwerp",
				"country" => "Belgium",
				"stadium" => "Broodstraat",
				"home_page_url" => "http://www.rafc.be/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Royal_Antwerp_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "701",
				"name" => "Heusden Zolder",
				"country" => "Belgium",
				"stadium" => "",
				"home_page_url" => "http://www.kbhz.be/",
				"wiki_link" => "http://en.wikipedia.org/wiki/K._Beringen-Heusden-Zolder",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "702",
				"name" => "Adanaspor",
				"country" => "Turkey",
				"stadium" => "Adana 5 Ocak Stadı",
				"home_page_url" => "http://www.adanaspor.com.tr/index.php",
				"wiki_link" => "http://en.wikipedia.org/wiki/Adanaspor",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "703",
				"name" => "Paniliakos",
				"country" => "Greece",
				"stadium" => "Pirgos Municipal Stadium",
				"home_page_url" => "",
				"wiki_link" => "http://en.wikipedia.org/wiki/Paniliakos_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "704",
				"name" => "Proodeftiki",
				"country" => "Greece",
				"stadium" => "Proodeftiki stadium",
				"home_page_url" => "http://www.proodeytiki-neolaia.gr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Proodeftiki_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "705",
				"name" => "Grimsby",
				"country" => "England",
				"stadium" => "Blundell Park",
				"home_page_url" => "http://www.grimsby-townfc.co.uk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Grimsby_Town_F.C.",
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
				"team_id" => "708",
				"name" => "Cosenza",
				"country" => "Italy",
				"stadium" => "Stadio San Vito",
				"home_page_url" => "http://www.nuovacosenzacalcio.it/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Nuova_Cosenza_Calcio",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "709",
				"name" => "Altay",
				"country" => "Turkey",
				"stadium" => "Alsancak Stadium",
				"home_page_url" => "http://www.altay.org.tr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Altay_S.K.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "710",
				"name" => "Goztep",
				"country" => "Turkey",
				"stadium" => "",
				"home_page_url" => "http://www.goztepe.org.tr/",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "711",
				"name" => "Panahaiki",
				"country" => "Greece",
				"stadium" => "Kostas Davourlis Stadium",
				"home_page_url" => "http://www.panachaikifc.gr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Panachaiki_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "712",
				"name" => "Yiannina",
				"country" => "Greece",
				"stadium" => "Zosimades Stadium",
				"home_page_url" => "http://www.pasgiannina.gr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/PAS_Giannina_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "713",
				"name" => "Stockport",
				"country" => "England",
				"stadium" => "Edgeley Park",
				"home_page_url" => "http://www.stockportcounty.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Stockport_County_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "714",
				"name" => "Las Palmas",
				"country" => "Spain",
				"stadium" => "Gran Canaria",
				"home_page_url" => "http://www.udlaspalmas.es/",
				"wiki_link" => "http://en.wikipedia.org/wiki/UD_Las_Palmas",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "715",
				"name" => "Pistoiese",
				"country" => "Italy",
				"stadium" => "Stadio Marcello Melani",
				"home_page_url" => "http://www.uspistoiese1921.it/",
				"wiki_link" => "http://en.wikipedia.org/wiki/U.S._Pistoiese_1921",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "716",
				"name" => "Lommel",
				"country" => "Belgium",
				"stadium" => "Soevereinstadion",
				"home_page_url" => "http://www.lommelunited.be/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Lommel_United",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "717",
				"name" => "Molenbeek",
				"country" => "Belgium",
				"stadium" => "Stade Edmond Machtens",
				"home_page_url" => "http://www.fc-brussels.be/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Brussels",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "718",
				"name" => "Aalst",
				"country" => "Belgium",
				"stadium" => "Pierre Cornelisstadion",
				"home_page_url" => "http://www.eendracht-aalst.be/",
				"wiki_link" => "http://en.wikipedia.org/wiki/SC_Eendracht_Aalst",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "719",
				"name" => "Fortuna Sittard",
				"country" => "Holland",
				"stadium" => "Trendwork Arena",
				"home_page_url" => "http://www.fortunasittard.nl/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Fortuna_Sittard",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "720",
				"name" => "Yozgatspor",
				"country" => "Turkey",
				"stadium" => "Bozok Stadium",
				"home_page_url" => "http://www.yozgatspor.net/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Yimpa%C5%9F_Yozgatspor",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "721",
				"name" => "Eth Asteras",
				"country" => "Greece",
				"stadium" => "Michalis Kritikopoulos",
				"home_page_url" => "http://www.paeasteras.gr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Ethnikos_Asteras_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "722",
				"name" => "Tranmere",
				"country" => "England",
				"stadium" => "Prenton Park",
				"home_page_url" => "http://www.tranmererovers.co.uk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Tranmere_Rovers_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "723",
				"name" => "Unterhaching",
				"country" => "Germany",
				"stadium" => "Generali Sportpark",
				"home_page_url" => "http://www.spvggunterhaching.de/",
				"wiki_link" => "http://en.wikipedia.org/wiki/SpVgg_Unterhaching",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "724",
				"name" => "Oviedo",
				"country" => "Spain",
				"stadium" => "Carlos Tartiere",
				"home_page_url" => "http://www.realoviedo.es/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Real_Oviedo",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "725",
				"name" => "Monza",
				"country" => "Italy",
				"stadium" => "Stadio Brianteo",
				"home_page_url" => "http://www.acmonzabrianza.it/",
				"wiki_link" => "http://en.wikipedia.org/wiki/A.C._Monza_Brianza_1912",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "726",
				"name" => "Harelbeke",
				"country" => "Belgium",
				"stadium" => "Forestiersstadion",
				"home_page_url" => "http://sportingwestharelbeke.be/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Sporting_West_Harelbeke",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "727",
				"name" => "Erzurumspor",
				"country" => "Turkey",
				"stadium" => "Cemal Gürsel Stadium",
				"home_page_url" => "Cemal Gürsel Stadium",
				"wiki_link" => "http://en.wikipedia.org/wiki/Erzurumspor",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "728",
				"name" => "Siirt Jet-PA",
				"country" => "Turkey",
				"stadium" => "Siirt Atatürk Stadium",
				"home_page_url" => "",
				"wiki_link" => "http://en.wikipedia.org/wiki/Siirtspor",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "729",
				"name" => "Athinaikos",
				"country" => "Greece",
				"stadium" => "National Stadium of Vyrona",
				"home_page_url" => "http://www.athinaikosfc.gr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Athinaikos_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "730",
				"name" => "Kalamata",
				"country" => "Greece",
				"stadium" => "Kalamata Metropolitan Stadium",
				"home_page_url" => "http://www.paekalamata.gr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Kalamata_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "731",
				"name" => "Borussia Dortmund/Real Madrid",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "732",
				"name" => "Bayern München/Barcelona",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "733",
				"name" => "Fenerbahce/Benfica",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "734",
				"name" => "Basel/Chelsea",
				"country" => "Europe",
				"stadium" => "",
				"home_page_url" => "",
				"wiki_link" => "",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "735",
				"name" => "Vitoria",
				"country" => "Brazil",
				"stadium" => "Barradão",
				"home_page_url" => "http://www.ecvitoria.com.br/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Esporte_Clube_Vit%C3%B3ria",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "736",
				"name" => "Internacional",
				"country" => "Brazil",
				"stadium" => "Beira-Rio",
				"home_page_url" => "http://www.internacional.com.br/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Sport_Club_Internacional",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "737",
				"name" => "Vasco da Gama",
				"country" => "Brazil",
				"stadium" => "São Januário",
				"home_page_url" => "http://www.crvascodagama.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/CR_Vasco_da_Gama",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "738",
				"name" => "Portuguesa",
				"country" => "Brazil",
				"stadium" => "Canindé",
				"home_page_url" => "http://www.portuguesa.com.br/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Associa%C3%A7%C3%A3o_Portuguesa_de_Desportos",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "739",
				"name" => "Corinthians",
				"country" => "Brazil",
				"stadium" => "Pacaembu",
				"home_page_url" => "http://www.corinthians.com.br/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Sport_Club_Corinthians_Paulista",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "740",
				"name" => "Botafogo RJ",
				"country" => "Brazil",
				"stadium" => "Estádio Olímpico",
				"home_page_url" => "http://www.botafogo.com.br/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Botafogo_de_Futebol_e_Regatas",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "741",
				"name" => "Santos FC",
				"country" => "Brazil",
				"stadium" => "Vila Belmiro",
				"home_page_url" => "http://www.santosfc.com.br/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Santos_FC",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "742",
				"name" => "Flamengo",
				"country" => "Brazil",
				"stadium" => "Estádio do Maracanã",
				"home_page_url" => "http://www.flamengo.com.br/",
				"wiki_link" => "https://en.wikipedia.org/wiki/Clube_de_Regatas_do_Flamengo",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "743",
				"name" => "Gremio",
				"country" => "Brazil",
				"stadium" => "Arena do Grêmio",
				"home_page_url" => "http://www.gremio.net/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Gr%C3%AAmio_Foot-Ball_Porto_Alegrense",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "744",
				"name" => "Nautico",
				"country" => "Brazil",
				"stadium" => "Estádio dos Aflitos",
				"home_page_url" => "http://www.nautico-pe.com.br/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Clube_N%C3%A1utico_Capibaribe",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "745",
				"name" => "Ponte Preta",
				"country" => "Brazil",
				"stadium" => "Estádio Moisés Lucarelli",
				"home_page_url" => "http://www.pontepretaesportes.com.br/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Associa%C3%A7%C3%A3o_Atl%C3%A9tica_Ponte_Preta",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "746",
				"name" => "Sao Paulo",
				"country" => "Brazil",
				"stadium" => "Morumbi",
				"home_page_url" => "http://www.saopaulofc.net/",
				"wiki_link" => "http://en.wikipedia.org/wiki/S%C3%A3o_Paulo_FC",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "747",
				"name" => "Criciuma",
				"country" => "Brazil",
				"stadium" => "Heriberto Hülse",
				"home_page_url" => "http://www.criciumaesporteclube.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Crici%C3%BAma_Esporte_Clube",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "748",
				"name" => "Bahia",
				"country" => "Brazil",
				"stadium" => "Arena Fonte Nova",
				"home_page_url" => "http://www.esporteclubebahia.com.br/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Esporte_Clube_Bahia",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "749",
				"name" => "Cruzeiro",
				"country" => "Brazil",
				"stadium" => "Mineirão",
				"home_page_url" => "http://www.cruzeiro.com.br/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Cruzeiro_Esporte_Clube",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "750",
				"name" => "Goias",
				"country" => "Brazil",
				"stadium" => "Serra Dourada",
				"home_page_url" => "http://www.goiasesporteclube.com.br/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Goi%C3%A1s_Esporte_Clube",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "751",
				"name" => "Fluminense",
				"country" => "Brazil",
				"stadium" => "Maracanã",
				"home_page_url" => "http://www.fluminense.com.br/",
				"wiki_link" => "https://en.wikipedia.org/wiki/Fluminense_Football_Club",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "752",
				"name" => "Atletico PR",
				"country" => "Brazil",
				"stadium" => "Estádio Joaquim Américo Guimarães",
				"home_page_url" => "http://www.atleticoparanaense.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Clube_Atl%C3%A9tico_Paranaense",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "753",
				"name" => "Coritiba",
				"country" => "Brazil",
				"stadium" => "Couto Pereira",
				"home_page_url" => "http://www.coritiba.com.br/site/index_eng.php",
				"wiki_link" => "http://en.wikipedia.org/wiki/Coritiba_Foot_Ball_Club",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "754",
				"name" => "Atletico MG",
				"country" => "Brazil",
				"stadium" => "Estádio Independência",
				"home_page_url" => "http://www.atletico.com.br/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Clube_Atl%C3%A9tico_Mineiro",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "755",
				"name" => "Yeovil",
				"country" => "England",
				"stadium" => "Huish Park",
				"home_page_url" => "http://www.ytfc.net/page/Home",
				"wiki_link" => "http://en.wikipedia.org/wiki/Yeovil_Town_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "756",
				"name" => "Bournemouth",
				"country" => "England",
				"stadium" => "Dean Court",
				"home_page_url" => "http://www.afcb.premiumtv.co.uk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/A.F.C._Bournemouth",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "757",
				"name" => "Braunschweig",
				"country" => "Germany",
				"stadium" => "Eintracht-Stadion",
				"home_page_url" => "http://www.eintracht.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Eintracht_Braunschweig",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "758",
				"name" => "SC Cambuur",
				"country" => "Holland",
				"stadium" => "Cambuur Stadion",
				"home_page_url" => "http://www.cambuur.nl/",
				"wiki_link" => "http://en.wikipedia.org/wiki/SC_Cambuur",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "759",
				"name" => "Go Ahead Eagles",
				"country" => "Holland",
				"stadium" => "Adelaarshorst",
				"home_page_url" => "http://www.ga-eagles.nl/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Go_Ahead_Eagles",
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
			Team.create!(
				"team_id" => "761",
				"name" => "Veracruz",
				"country" => "Mexico",
				"stadium" => "Estadio Luis Pirata Fuente",
				"home_page_url" => "http://www.fctiburonesrojos.com/",
				"wiki_link" => "https://en.wikipedia.org/wiki/Tiburones_Rojos_de_Veracruz",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "762",
				"name" => "Viborg",
				"country" => "Denmark",
				"stadium" => "Viborg Stadion",
				"home_page_url" => "http://www.vff.dk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Viborg_FF",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "763",
				"name" => "Vestsjaelland",
				"country" => "Denmark",
				"stadium" => "Slagelse Stadion",
				"home_page_url" => "http://www.fcv2008.dk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Vestsj%C3%A6lland",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "764",
				"name" => "Lusitans",
				"country" => "Andorra",
				"stadium" => "Sant Julià de Lòria",
				"home_page_url" => "http://www.uefa.com/footballeurope/club=75986/domestic.html",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Lusitanos",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "765",
				"name" => "Sutjeska",
				"country" => "Montenegro",
				"stadium" => "City stadium “Kraj Bistrice”",
				"home_page_url" => "http://www.facebook.com/sutjeskafc.me/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FK_Sutjeska_Nik%C5%A1i%C4%87",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "766",
				"name" => "Daugavpils",
				"country" => "Latvia",
				"stadium" => "Daugavas stadions",
				"home_page_url" => "http://fcdaugava.lv/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Daugava",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "767",
				"name" => "TNS",
				"country" => "Wales",
				"stadium" => "Park Hall",
				"home_page_url" => "http://www.tnsfc.co.uk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/The_New_Saints_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "768",
				"name" => "Fola",
				"country" => "Luxemborg",
				"stadium" => "Stade Émile Mayrisch",
				"home_page_url" => "http://www.fola.lu/",
				"wiki_link" => "http://en.wikipedia.org/wiki/CS_Fola_Esch",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "769",
				"name" => "Gyor",
				"country" => "Hungary",
				"stadium" => "ETO Park",
				"home_page_url" => "http://www.eto.hu/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Gy%C5%91ri_ETO_FC",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "770",
				"name" => "Maccabi Tel Aviv",
				"country" => "Israel",
				"stadium" => "Bloomfield Stadium",
				"home_page_url" => "http://www.maccabi-tlv.co.il/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Maccabi_Tel_Aviv_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "771",
				"name" => "Airbus",
				"country" => "Wales",
				"stadium" => "The Airfield",
				"home_page_url" => "http://www.airbusfc.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Airbus_UK_Broughton_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "772",
				"name" => "Bala",
				"country" => "Wales",
				"stadium" => "Maes Tegid",
				"home_page_url" => "http://www.balatownfc.co.uk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Bala_Town_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "773",
				"name" => "Celje",
				"country" => "Slovenia",
				"stadium" => "Arena Petrol",
				"home_page_url" => "http://www.nk-celje.si/",
				"wiki_link" => "http://en.wikipedia.org/wiki/NK_Celje",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "774",
				"name" => "Chikhura",
				"country" => "Georgia",
				"stadium" => "Tsentral",
				"home_page_url" => "http://www.fcchikhura.ge/",
				"wiki_link" => "https://en.wikipedia.org/wiki/FC_Chikhura_Sachkhere",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "775",
				"name" => "Vaduz",
				"country" => "Switzerland",
				"stadium" => "Rheinpark Stadion",
				"home_page_url" => "http://www.fcvaduz.li/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Vaduz",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "776",
				"name" => "Domzale",
				"country" => "Slovenia",
				"stadium" => "Sports Park",
				"home_page_url" => "http://www.nkdomzale.si/",
				"wiki_link" => "http://en.wikipedia.org/wiki/NK_Dom%C5%BEale",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "777",
				"name" => "Astra ",
				"country" => "Romania",
				"stadium" => "Stadionul Marin Anastasovici",
				"home_page_url" => "http://www.afcastragiurgiu.ro/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Astra_Giurgiu",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "778",
				"name" => "Met. Skopje",
				"country" => "Macedonia",
				"stadium" => "Stadion Avtokomanda",
				"home_page_url" => "http://macedonianfootball.com/index.php?option=com_content&view=article&id=106:skopje&catid=19:1-liga-first-league&Itemid=190",
				"wiki_link" => "http://en.wikipedia.org/wiki/FK_Skopje",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "779",
				"name" => "Karabakh Agdam",
				"country" => "Azerbaijan",
				"stadium" => "Guzanli Olympic Complex Stadium",
				"home_page_url" => "http://www.qarabagh.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Qaraba%C4%9F_FK",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "780",
				"name" => "Sliema",
				"country" => "Malta",
				"stadium" => "Ta' Qali Stadium",
				"home_page_url" => "http://www.sliemawfc.org/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Sliema_Wanderers_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "781",
				"name" => "Kukesi",
				"country" => "Albania",
				"stadium" => "Zeqir Ymeri Stadium",
				"home_page_url" => "http://www.fk-kukesi.al/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FK_Kuk%C3%ABsi",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "782",
				"name" => "IF Fuglafjordur",
				"country" => "Faroe Islands",
				"stadium" => "Fløtugerði",
				"home_page_url" => "http://www.if.fo/",
				"wiki_link" => "http://en.wikipedia.org/wiki/%C3%8DF_Fuglafj%C3%B8r%C3%B0ur",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "783",
				"name" => "Turnovo",
				"country" => "Macedonia",
				"stadium" => "Kukuš Stadium",
				"home_page_url" => "http://fkhorizont-turnovo.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FK_Turnovo",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "784",
				"name" => "TPS",
				"country" => "Finland",
				"stadium" => "Veritas Stadion",
				"home_page_url" => "http://fc.tps.fi/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Turun_Palloseura",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "785",
				"name" => "FC Tiraspol",
				"country" => "Moldova",
				"stadium" => "Sheriff",
				"home_page_url" => "http://fc-tiraspol.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Tiraspol",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "786",
				"name" => "MIKA Ashtarak",
				"country" => "Armenia",
				"stadium" => "Mika Stadium",
				"home_page_url" => "http://www.fcmika.am/",
				"wiki_link" => "https://en.wikipedia.org/wiki/FC_Mika",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "787",
				"name" => "Drogheda",
				"country" => "Ireland",
				"stadium" => "Hunky Dorys Park",
				"home_page_url" => "http://www.droghedaunited.ie/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Drogheda_United_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "788",
				"name" => "Inter Turku",
				"country" => "Finland",
				"stadium" => "Veritas Stadion",
				"home_page_url" => "http://www.fcinter.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Inter_Turku",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "789",
				"name" => "Prestatyn",
				"country" => "Wales",
				"stadium" => "Bastion Road",
				"home_page_url" => "http://www.ptfconline.co.uk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Prestatyn_Town_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "790",
				"name" => "Teteks",
				"country" => "Macedonia",
				"stadium" => "Gradski stadion Tetovo",
				"home_page_url" => "http://www.teteksfans.mk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FK_Teteks",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "791",
				"name" => "Vestmannaeyjar",
				"country" => "Iceland",
				"stadium" => "Hásteinsvöllur",
				"home_page_url" => "http://www.ibvsport.is/fotbolti/",
				"wiki_link" => "http://en.wikipedia.org/wiki/%C3%8D%C3%BEr%C3%B3ttabandalag_Vestmannaeyja",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "792",
				"name" => "HB Torshavn",
				"country" => "Faroe Islands",
				"stadium" => "Gundadalur Stadium",
				"home_page_url" => "http://www.hb.fo/",
				"wiki_link" => "http://en.wikipedia.org/wiki/HB_T%C3%B3rshavn",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "793",
				"name" => "Mariehamn",
				"country" => "Finland",
				"stadium" => "Wiklöf Holding Arena",
				"home_page_url" => "http://www.ifkmariehamn.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/IFK_Mariehamn",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "794",
				"name" => "Kruoja",
				"country" => "Lithuania",
				"stadium" => "Pakruojis city stadium",
				"home_page_url" => "http://www.fkkruoja.lt/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FK_Kruoja_Pakruojis",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "795",
				"name" => "Din. Minsk",
				"country" => "Russia",
				"stadium" => "Dinamo-Yuni",
				"home_page_url" => "http://www.dinamo-minsk.by/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Dinamo_Minsk",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "796",
				"name" => "Glentoran",
				"country" => "Northern Ireland",
				"stadium" => "The Oval",
				"home_page_url" => "http://www.glentoran.com/",
				"wiki_link" => "https://en.wikipedia.org/wiki/Glentoran_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "797",
				"name" => "Zrinjski",
				"country" => "Bosnia and Herzegovina",
				"stadium" => "Bijeli Brijeg Stadium",
				"home_page_url" => "http://www.hskzrinjski.ba/",
				"wiki_link" => "http://en.wikipedia.org/wiki/H%C5%A0K_Zrinjski_Mostar",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "798",
				"name" => "FC Astana",
				"country" => "Kazakhstan",
				"stadium" => "Astana Arena",
				"home_page_url" => "http://fca.kz/",
				"wiki_link" => "https://en.wikipedia.org/wiki/FC_Astana",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "799",
				"name" => "Botev Plovdiv",
				"country" => "Bulgarian",
				"stadium" => "Hristo Botev",
				"home_page_url" => "http://www.botevplovdiv.bg/",
				"wiki_link" => "http://en.wikipedia.org/wiki/PFC_Botev_Plovdiv",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "800",
				"name" => "La Fiorita",
				"country" => "Montenegro",
				"stadium" => "Stadio Igor Crescentini",
				"home_page_url" => "http://www.lafiorita.sm/",
				"wiki_link" => "http://en.wikipedia.org/wiki/S.P._La_Fiorita",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "801",
				"name" => "Mladost Podgorica",
				"country" => "Montenegro",
				"stadium" => "Cvijetni Brijeg Stadium",
				"home_page_url" => "http://www.fscg.co.me/klubovi.php?klub_id=8",
				"wiki_link" => "http://en.wikipedia.org/wiki/FK_Mladost_Podgorica",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "802",
				"name" => "FC Santa Coloma",
				"country" => "Andorra",
				"stadium" => "DEVK-Arena",
				"home_page_url" => "http://fclubsantacoloma.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Santa_Coloma",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "803",
				"name" => "Breidablik",
				"country" => "Iceland",
				"stadium" => "Kópavogsvöllur",
				"home_page_url" => "http://www.breidablik.is/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Brei%C3%B0ablik_UBK",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "804",
				"name" => "I. Pavlodar",
				"country" => "Kazakhstan",
				"stadium" => "Central Stadium",
				"home_page_url" => "http://www.fcirtysh.kz/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Irtysh_Pavlodar",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "805",
				"name" => "Laci",
				"country" => "Albania",
				"stadium" => "Stadiumi Laçi",
				"home_page_url" => "http://kflaci.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/KF_La%C3%A7i",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "806",
				"name" => "Stromsgodset",
				"country" => "Norway",
				"stadium" => "Marienlyst Stadion",
				"home_page_url" => "http://www.godset.no/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Str%C3%B8msgodset_IF",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "807",
				"name" => "Beroe",
				"country" => "Bulgarian",
				"stadium" => "Beroe Stadium",
				"home_page_url" => "http://www.beroe.bg/",
				"wiki_link" => "http://en.wikipedia.org/wiki/PFC_Beroe_Stara_Zagora",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "808",
				"name" => "Honka",
				"country" => "Finland",
				"stadium" => "Tapiolan Urheilupuisto",
				"home_page_url" => "http://www.fchonka.fi/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Honka",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "809",
				"name" => "Trencin",
				"country" => "Slovakia",
				"stadium" => "Štadión na Sihoti",
				"home_page_url" => "http://www.astrencin.sk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FK_AS_Tren%C4%8D%C3%ADn",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "810",
				"name" => "Derry City",
				"country" => "Northern Ireland",
				"stadium" => "Brandywell Stadium",
				"home_page_url" => "http://www.derrycityfc.net/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Derry_City_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "811",
				"name" => "Brentford",
				"country" => "England",
				"stadium" => "Griffin Park",
				"home_page_url" => "http://www.brentfordfc.co.uk/page/Home",
				"wiki_link" => "http://en.wikipedia.org/wiki/Brentford_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "812",
				"name" => "Dagenham & Red.",
				"country" => "England",
				"stadium" => "Victoria Road",
				"home_page_url" => "http://www.daggers.co.uk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Dagenham_%26_Redbridge_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "813",
				"name" => "Newport",
				"country" => "England",
				"stadium" => "Rodney Parade",
				"home_page_url" => "http://www.newport-county.co.uk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Newport_County_A.F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "814",
				"name" => "Bristol Rovers",
				"country" => "England",
				"stadium" => "Memorial Stadium",
				"home_page_url" => "http://www.bristolrovers.co.uk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Bristol_Rovers_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "815",
				"name" => "Bury",
				"country" => "England",
				"stadium" => "Gigg Lane Stadium",
				"home_page_url" => "http://www.buryfc.co.uk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Bury_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "816",
				"name" => "Carlisle",
				"country" => "England",
				"stadium" => "Brunton Park",
				"home_page_url" => "http://www.carlisleunited.co.uk/index.aspx",
				"wiki_link" => "http://en.wikipedia.org/wiki/Carlisle_United_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "817",
				"name" => "Oxford Utd",
				"country" => "England",
				"stadium" => "http://www.oufc.co.uk/",
				"home_page_url" => "http://www.oufc.co.uk/page/Home/0,,10342,00.html",
				"wiki_link" => "http://en.wikipedia.org/wiki/Oxford_United_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "818",
				"name" => "Cheltenham",
				"country" => "England",
				"stadium" => "Whaddon Road",
				"home_page_url" => "http://www.ctfc.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Cheltenham_Town_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "819",
				"name" => "Crawley",
				"country" => "England",
				"stadium" => "Broadfield Stadium",
				"home_page_url" => "http://www.crawleytownfc.net/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Crawley_Town_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "820",
				"name" => "Rochdale",
				"country" => "England",
				"stadium" => "Spotland",
				"home_page_url" => "http://www.rochdaleafc.co.uk/",
				"wiki_link" => "https://en.wikipedia.org/wiki/Rochdale_A.F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "821",
				"name" => "Exeter",
				"country" => "England",
				"stadium" => "St James Park",
				"home_page_url" => "http://www.exetercityfc.co.uk/",
				"wiki_link" => "https://en.wikipedia.org/wiki/Exeter_City_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "822",
				"name" => "Chesterfield",
				"country" => "England",
				"stadium" => "Proact Stadium",
				"home_page_url" => "http://www.chesterfield-fc.co.uk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Chesterfield_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "823",
				"name" => "Leyton Orient",
				"country" => "England",
				"stadium" => "Matchroom Stadium",
				"home_page_url" => "http://www.leytonorient.com/",
				"wiki_link" => "https://en.wikipedia.org/wiki/Leyton_Orient_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "824",
				"name" => "Accrington",
				"country" => "England",
				"stadium" => "Crown Ground",
				"home_page_url" => "http://www.accringtonstanley.co.uk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Accrington_Stanley_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "825",
				"name" => "Morecambe",
				"country" => "England",
				"stadium" => "Globe Arena",
				"home_page_url" => "http://www.morecambefc.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Morecambe_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "826",
				"name" => "Northampton",
				"country" => "England",
				"stadium" => "Sixfields Stadium",
				"home_page_url" => "http://www.ntfc.co.uk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Northampton_Town_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "827",
				"name" => "Milton Keynes Dons",
				"country" => "England",
				"stadium" => "Stadium mk",
				"home_page_url" => "http://www.mkdons.co.uk/",
				"wiki_link" => "https://en.wikipedia.org/wiki/Milton_Keynes_Dons_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "828",
				"name" => "Hartlepool",
				"country" => "England",
				"stadium" => "Victoria Park",
				"home_page_url" => "http://www.hartlepoolunited.co.uk/page/Home",
				"wiki_link" => "http://en.wikipedia.org/wiki/Hartlepool_United_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "829",
				"name" => "Notts County",
				"country" => "England",
				"stadium" => "Meadow Lane",
				"home_page_url" => "http://www.nottscountyfc.co.uk/page/Welcome",
				"wiki_link" => "http://en.wikipedia.org/wiki/Notts_County_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "830",
				"name" => "Fleetwood Town",
				"country" => "England",
				"stadium" => "Highbury Stadium",
				"home_page_url" => "http://www.fleetwoodtownfc.com/",
				"wiki_link" => "https://en.wikipedia.org/wiki/Fleetwood_Town_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "831",
				"name" => "Port Vale",
				"country" => "England",
				"stadium" => "Vale Park",
				"home_page_url" => "http://www.port-vale.co.uk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Port_Vale_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "832",
				"name" => "Burton",
				"country" => "England",
				"stadium" => "Pirelli Stadium",
				"home_page_url" => "http://www.burtonalbionfc.co.uk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Burton_Albion_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "833",
				"name" => "Shrewsbury",
				"country" => "England",
				"stadium" => "New Meadow",
				"home_page_url" => "http://www.shrewsburytown.co.uk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Shrewsbury_Town_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "834",
				"name" => "Stevenage",
				"country" => "England",
				"stadium" => "Broadhall Way",
				"home_page_url" => "http://www.stevenagefc.com/page/Home/0,,10839,00.html",
				"wiki_link" => "http://en.wikipedia.org/wiki/Stevenage_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "835",
				"name" => "Swindon",
				"country" => "England",
				"stadium" => "The County Ground",
				"home_page_url" => "http://www.swindontownfc.co.uk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Swindon_Town_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "836",
				"name" => "Torquay",
				"country" => "England",
				"stadium" => "Plainmoor",
				"home_page_url" => "http://www.torquayunited.premiumtv.co.uk/page/Welcome",
				"wiki_link" => "https://en.wikipedia.org/wiki/Torquay_United_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "837",
				"name" => "Mansfield",
				"country" => "England",
				"stadium" => "Field Mill",
				"home_page_url" => "http://www.mansfieldtown.net/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Mansfield_Town_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "838",
				"name" => "Wycombe",
				"country" => "England",
				"stadium" => "Adams Park",
				"home_page_url" => "http://www.wycombewanderers.co.uk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Wycombe_Wanderers_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "839",
				"name" => "York",
				"country" => "England",
				"stadium" => "Bootham Crescent",
				"home_page_url" => "http://www.yorkcityfootballclub.co.uk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/York_City_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "840",
				"name" => "Elche",
				"country" => "Spain",
				"stadium" => "Martínez Valero",
				"home_page_url" => "http://www.elchecf.es/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Elche_CF",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "841",
				"name" => "Dinamo Tbilisi",
				"country" => "Georgia",
				"stadium" => "Dinamo Arena",
				"home_page_url" => "http://www.fcdinamo.ge/",
				"wiki_link" => "https://en.wikipedia.org/wiki/FC_Dinamo_Tbilisi",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "842",
				"name" => "Belenenses",
				"country" => "Portugal",
				"stadium" => "Estádio do Restelo",
				"home_page_url" => "http://www.osbelenenses.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/C.F._Os_Belenenses",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "843",
				"name" => "Arouca",
				"country" => "Portugal",
				"stadium" => "Estádio Municipal",
				"home_page_url" => "http://www.fcarouca.eu/",
				"wiki_link" => "http://en.wikipedia.org/wiki/F.C._Arouca",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "844",
				"name" => "Apollon Smirnis",
				"country" => "Greece",
				"stadium" => "Rizoupoli Stadium",
				"home_page_url" => "http://www.fcapollon.gr/",
				"wiki_link" => "https://en.wikipedia.org/wiki/Apollon_Smyrni_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "845",
				"name" => "Kalloni Lekanopedio",
				"country" => "Greece",
				"stadium" => "Mytilene Municipal Stadium",
				"home_page_url" => "http://www.aelk.gr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Kalloni_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "846",
				"name" => "Austria Vienna",
				"country" => "Austria",
				"stadium" => "Franz Horr Stadium",
				"home_page_url" => "http://www.fk-austria.at/",
				"wiki_link" => "https://en.wikipedia.org/wiki/FK_Austria_Wien",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "847",
				"name" => "Grasshoppers",
				"country" => "Switzerland",
				"stadium" => "Letzigrund",
				"home_page_url" => "http://www.gcz.ch/",
				"wiki_link" => "https://en.wikipedia.org/wiki/Grasshopper_Club_Z%C3%BCrich",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "848",
				"name" => "Ch. Odessa",
				"country" => "Ukraine",
				"stadium" => "Chornomorets Stadium",
				"home_page_url" => "http://chernomorets.odessa.ua/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Chornomorets_Odesa",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "849",
				"name" => "Hapoel Ramat Gan",
				"country" => "Israel",
				"stadium" => "Winter Stadium",
				"home_page_url" => "http://www.hapoelrg-fc.co.il/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Hapoel_Ramat_Gan_Giv'atayim_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "850",
				"name" => "FC Minsk",
				"country" => "Belarus",
				"stadium" => "Dinamo Stadium",
				"home_page_url" => "http://www.fcminsk.by/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Minsk",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "851",
				"name" => "Thun",
				"country" => "Switzerland",
				"stadium" => "Arena Thun",
				"home_page_url" => "http://www.fcthun.ch/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Thun",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "852",
				"name" => "Jablonec",
				"country" => "Czech Republic",
				"stadium" => "Chance Arena",
				"home_page_url" => "http://www.fkjablonec.cz/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FK_Baumit_Jablonec",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "853",
				"name" => "Zurich",
				"country" => "Switzerland",
				"stadium" => "Letzigrund",
				"home_page_url" => "http://www.fcz.ch/de/main/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Z%C3%BCrich",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "855",
				"name" => "Pandurii",
				"country" => "Romania",
				"stadium" => "Tudor Vladimirescu",
				"home_page_url" => "http://www.pandurii-tg-jiu.ro/",
				"wiki_link" => "http://en.wikipedia.org/wiki/CS_Pandurii_T%C3%A2rgu_Jiu",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "856",
				"name" => "Petrolul",
				"country" => "Romania",
				"stadium" => "Ilie Oană",
				"home_page_url" => "http://www.fcpetrolul.ro/",
				"wiki_link" => "https://en.wikipedia.org/wiki/FC_Petrolul_Ploie%C8%99ti",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "857",
				"name" => "Rijeka",
				"country" => "Croatia",
				"stadium" => "Stadion Kantrida",
				"home_page_url" => "http://www.nk-rijeka.hr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/HNK_Rijeka",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "858",
				"name" => "Maccabi Haifa",
				"country" => "Israel",
				"stadium" => "Kiryat Eliezer",
				"home_page_url" => "http://maccabi-haifafc.walla.co.il/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Maccabi_Haifa_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "859",
				"name" => "Aldershot",
				"country" => "England",
				"stadium" => "Recreation Ground",
				"home_page_url" => "http://www.theshots.co.uk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Aldershot_Town_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "860",
				"name" => "Barnet",
				"country" => "England",
				"stadium" => "The Hive Stadium",
				"home_page_url" => "http://www.barnetfc.premiumtv.co.uk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Barnet_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "861",
				"name" => "Trapani",
				"country" => "Italy",
				"stadium" => "Stadio Polisportivo Provinciale",
				"home_page_url" => "http://www.trapanicalcio.it/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Trapani_Calcio",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "862",
				"name" => "Latina",
				"country" => "Italy",
				"stadium" => "Stadio Domenico Francioni",
				"home_page_url" => "http://www.uslatinacalcio.it/",
				"wiki_link" => "http://en.wikipedia.org/wiki/U.S._Latina_Calcio",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "863",
				"name" => "Carpi",
				"country" => "Italy",
				"stadium" => "Stadio Sandro Cabassi",
				"home_page_url" => "http://www.carpifc1909.it/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Carpi_F.C._1909",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "864",
				"name" => "St. Gallen",
				"country" => "Switzerland",
				"stadium" => "AFG Arena",
				"home_page_url" => "http://www.fcsg.ch/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_St._Gallen",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "865",
				"name" => "Apollon Limassol",
				"country" => "Cyprus",
				"stadium" => "Tsirion Stadium",
				"home_page_url" => "http://www.apollon.com.cy/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Apollon_Limassol",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "866",
				"name" => "Superfund Pasching",
				"country" => "Austria",
				"stadium" => "Waldstadion",
				"home_page_url" => "http://www.geomix.at/verein/fc-pasching/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Pasching",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "867",
				"name" => "Kallonis",
				"country" => "Greece",
				"stadium" => "Mytilene Municipal Stadium",
				"home_page_url" => "http://www.aelk.gr/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Kalloni_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "868",
				"name" => "Ardley United",
				"country" => "England",
				"stadium" => "The Playing Fields",
				"home_page_url" => "http://www.ardleyunited.co.uk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Ardley_United_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "869",
				"name" => "Binfield",
				"country" => "England",
				"stadium" => "Stubb's Lane",
				"home_page_url" => "http://www.binfieldfc.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Binfield_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "870",
				"name" => "Ashton",
				"country" => "England",
				"stadium" => "Hurst Cross",
				"home_page_url" => "http://www.pitchero.com/clubs/ashtonunited/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Ashton_United_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "871",
				"name" => "Witton",
				"country" => "England",
				"stadium" => "Wincham Park",
				"home_page_url" => "http://www.wittonalbion.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Witton_Albion_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "872",
				"name" => "Atherstone",
				"country" => "England",
				"stadium" => "`The Snake Pit`",
				"home_page_url" => "http://www.atherstonetownfc.co.uk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Atherstone_Town_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "873",
				"name" => "Redditch",
				"country" => "England",
				"stadium" => "The Valley",
				"home_page_url" => "http://www.redditchutdfc.co.uk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Redditch_United_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "874",
				"name" => "Aveley",
				"country" => "England",
				"stadium" => "The Mill Field",
				"home_page_url" => "http://www.aveleyfc.net/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Aveley_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "875",
				"name" => "Canvey",
				"country" => "England",
				"stadium" => "Park Lane",
				"home_page_url" => "http://www.canveyislandfc.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Canvey_Island_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "876",
				"name" => "Aylesbury",
				"country" => "England",
				"stadium" => "Haywood Way",
				"home_page_url" => "http://www.aylesburyfootballclub.co.uk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Aylesbury_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "877",
				"name" => "Shortwood",
				"country" => "England",
				"stadium" => "The Meadowbank Ground",
				"home_page_url" => "http://www.pitchero.com/clubs/shortwoodunited/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Shortwood_United_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "878",
				"name" => "Banbury",
				"country" => "England",
				"stadium" => "Spencer Stadium",
				"home_page_url" => "http://www.banburyunited.co.uk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Banbury_United_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "879",
				"name" => "Cirencester",
				"country" => "England",
				"stadium" => "Corinium Stadium",
				"home_page_url" => "http://www.cirentownfc.com/Index.asp",
				"wiki_link" => "http://en.wikipedia.org/wiki/Cirencester_Town_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "880",
				"name" => "Basford Utd.",
				"country" => "England",
				"stadium" => "Greenwich Avenue",
				"home_page_url" => "http://www.pitchero.com/clubs/basfordunitedfc/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Basford_United_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "881",
				"name" => "Matlock",
				"country" => "England",
				"stadium" => "Causeway Lane",
				"home_page_url" => "http://www.matlocktownfc.co.uk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Matlock_Town_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "882",
				"name" => "Zorya",
				"country" => "Ukraine",
				"stadium" => "Avanhard Stadium",
				"home_page_url" => "http://www.zarya-lugansk.com/home.php",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Zorya_Luhansk",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "883",
				"name" => "Volyn",
				"country" => "Ukraine",
				"stadium" => "Avanhard Stadium",
				"home_page_url" => "http://fcvolyn.net./",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Volyn_Lutsk",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "884",
				"name" => "Illichivets",
				"country" => "Ukraine",
				"stadium" => "Illichivets Stadium",
				"home_page_url" => "http://fcilich.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Illichivets_Mariupol",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "885",
				"name" => "Hoverla Uzhhorod",
				"country" => "Ukraine",
				"stadium" => "Avanhard Stadium",
				"home_page_url" => "http://fcgoverla.uz.ua/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Hoverla_Uzhhorod",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "886",
				"name" => "Karpaty",
				"country" => "Ukraine",
				"stadium" => "Ukraina Stadium",
				"home_page_url" => "http://www.fckarpaty.lviv.ua/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Karpaty_Lviv",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "887",
				"name" => "Tavriia",
				"country" => "Ukraine",
				"stadium" => "RSC Lokomotiv",
				"home_page_url" => "http://www.sctavriya.com/home/",
				"wiki_link" => "http://en.wikipedia.org/wiki/SC_Tavriya_Simferopol",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "888",
				"name" => "Vorskla",
				"country" => "Ukraine",
				"stadium" => "Butovsky Vorskla Stadium",
				"home_page_url" => "http://www.vorskla.com.ua/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Vorskla_Poltava",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "889",
				"name" => "Met. Zaporizhzhia",
				"country" => "Ukraine",
				"stadium" => "Slavutych-Arena",
				"home_page_url" => "http://www.fcmetalurg.com/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Metalurh_Zaporizhya",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "891",
				"name" => "Sevastopol",
				"country" => "Ukraine",
				"stadium" => "Sevastopol Sports Complex",
				"home_page_url" => "http://www.fcsevastopol.com/home/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Sevastopol",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "892",
				"name" => "Krylya Sovetov Samara",
				"country" => "Russia",
				"stadium" => "Metallurg Stadion",
				"home_page_url" => "http://eng.kc-camapa.ru/cgi-bin/stadium.cgi",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Krylia_Sovetov_Samara",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "854",
				"name" => "FC Krasnodar",
				"country" => "Russia",
				"stadium" => "Kuban Stadium",
				"home_page_url" => "http://www.fckrasnodar.ru/index.shtml",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Krasnodar",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "893",
				"name" => "Terek Grozny",
				"country" => "Russia",
				"stadium" => "Akhmat Arena",
				"home_page_url" => "http://fc-terek.ru/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Terek_Grozny",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "894",
				"name" => "Tomsk",
				"country" => "Russia",
				"stadium" => "Trud Stadium",
				"home_page_url" => "http://www.football.tomsk.ru/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Tom_Tomsk",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "895",
				"name" => "Volga Nyzhnyi",
				"country" => "Russia",
				"stadium" => "Lokomotiv Stadium",
				"home_page_url" => "http://www.fcvolgann.ru/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Volga_Nizhny_Novgorod",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "896",
				"name" => "Amkar",
				"country" => "Russia",
				"stadium" => "Zvezda Stadium",
				"home_page_url" => "http://fc-amkar.org/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Amkar_Perm",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "897",
				"name" => "FK Rostov",
				"country" => "Russia",
				"stadium" => "Olimp – 2",
				"home_page_url" => "http://www.fc-rostov.ru/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Rostov",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "898",
				"name" => "Ural S.R",
				"country" => "Russia",
				"stadium" => "Central Stadium",
				"home_page_url" => "http://www.fc-ural.ru/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Ural_Sverdlovsk_Oblast",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "899",
				"name" => "Lok. Moscow",
				"country" => "Russia",
				"stadium" => "Lokomotiv Stadium",
				"home_page_url" => "http://www.fclm.ru/ru/splash/index.php",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Lokomotiv_Moscow",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "900",
				"name" => "Kuban Krasnodar",
				"country" => "Russia",
				"stadium" => "Kuban Stadium",
				"home_page_url" => "http://www.fckuban.ru/index/",
				"wiki_link" => "http://en.wikipedia.org/wiki/FC_Kuban_Krasnodar",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "901",
				"name" => "Grays",
				"country" => "England",
				"stadium" => "Mill Field",
				"home_page_url" => "http://www.graysathletic.co.uk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Grays_Athletic_F.C.",
				"data_file_id" => "0",
			)
			Team.create!(
				"team_id" => "902",
				"name" => "Daventry",
				"country" => "England",
				"stadium" => "Communications Park",
				"home_page_url" => "http://www.dtfc.co.uk/",
				"wiki_link" => "http://en.wikipedia.org/wiki/Daventry_Town_F.C.",
				"data_file_id" => "0",
			)
		end
	end
end
