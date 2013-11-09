require "json"
require "./orch-utils"

# =================================================================================================
#  Routines to initialize, populate and update application-specific Orchestrate collections
#
#  These 'convenience methods' perform basic Orchestrate actions for lists of items, with the 
#  json data coming from a pre-defined known source.
#
#  @orch_config is initialized in orch-utils
# =================================================================================================

@src_dir   = @orch_config['src-dir']
@root_name = @orch_config['root-name']

# -------------------------------------------------------------------------------------------------
#  Name: populate_collection_init
#  Desc: convenience method -> put_collection for a list of keys, with known data source
# -------------------------------------------------------------------------------------------------
def populate_collection_init(args)
	collection = args[:collection]
	args[:keys].each do |key|
		api_url = "#{@base_url}/#{collection}/#{key}"
		json = open("#{@src_dir}/#{@root_name}-#{collection}-#{key}-create-#{args[:jmc]}-record.json")
		puts do_the_put_call({ url: api_url, user: @user, json: json })
		$stdout.flush
	end
end

# -------------------------------------------------------------------------------------------------
#  Name: populate_events_init
#  Desc: convenience method, put_events for list of events for specified key 
# -------------------------------------------------------------------------------------------------
def populate_events_init(args)
	args[:events].each do |event|
		api_url = "#{base_url}/#{args[:collection]}/#{args[:key]}/events/#{event}"
		json = open("#{@src_dir}/#{@root_name}-#{collection}-#{key}-create-#{args[:jmc]}-events.json")
		puts do_the_put_call({ url: api_url, user: @user, json: json })
	end
end

# -------------------------------------------------------------------------------------------------
#  Name: populate_relation_init
#  Desc: convenience method, put_relation for list of relations for specified key (coll_A/key_A)
# -------------------------------------------------------------------------------------------------
def populate_relation_init(args)
	filename = "#{@root_name}-#{args[:coll_A]}-#{args[:key_A]}-#{args[:coll_B]}-#{args[:jmc]}-relation.json"
	keys_B = JSON.parse(open("#{@src_dir}/#{filename}").read)[args[:keys_B]]
	keys_B.each do |key_B|
		api_url = "#{@base_url}/#{args[:coll_A]}/#{args[:key_A]}/relation/#{args[:relation]}/#{args[:coll_B]}/#{key_B}"
		puts do_the_put_call({ url: api_url, user: @user, json: '{}' })
		$stdout.flush
	end
end


# =================================================================================================
#  Application-specific data
# =================================================================================================
@all_league_ids = @orch_config['all-league-ids']

@all_team_ids    = JSON.parse(open("#{@src_dir}/#{@root_name}-teams-all-teams-t1-list.json").read)['all-team-ids']
@member_team_ids = JSON.parse(open("#{@src_dir}/#{@root_name}-teams-all-leagues-t2-list.json").read)['all-team-ids']
@orphan_team_ids = @all_team_ids - @member_team_ids

@all_comp_ids = @orch_config['all-competition-ids']
@comp_team_ids = JSON.parse(open("#{@src_dir}/#{@root_name}-teams-all-competitions-t2-list.json").open)['all-team-ids']

# =================================================================================================
#  Populate the Orchestrate.io application (fff-info)
# =================================================================================================

def populate_my_app

	population_control = Hash.new
	population_groups = [:leagues, :orphans, :members,'member-teams']
	population_groups += [:competitions, :fixtures, 'league-fixtures', 'team-fixtures']
	population_groups.each do |x|
		population_control[x] = true
	end

	# Populate the leagues collection
	#
	unless population_control[:leagues]
		populate_collection_init(collection: :leagues, keys: @all_league_ids, json: json, jmc: 'a1')
	end

	# Populate the teams collection for non-league (orphaned) teams
	#
		populate_collection_init(collection: :teams, keys: @orphan_team_ids, jmc: 't1')
		end
	end

	# Populate the teams collection for league (member) teams
	#
	unless population_control[:members]
		populate_collection_init(collection: :teams, keys: @member_team_ids, jmc: 't2')
	end

	# Populate the fixtures collection
	#
	unless population_control[:fixtures]
		populate_collection_init(collection: :fixtures, keys: @fixture_ids, jmc: 'f1')
	end

	# Add league standings events for each league
	#
	unless population_control[:standings]
		@all_league_ids.each do |league_id_str|
			populate_event({
				collection: :leagues,
				key:        league_id_str.
				type:       :standings,
				jmc:        'a1',
			})
		end
	end

	# Create the league/teams relationship for each league
	#
	unless population_control['member-teams']
		@all_league_ids.each do |league_id_str|
			populate_relation({
				coll_A:   :leagues,
				key_A:    league_id_str,
				relation: :teams,
				coll_B:   :teams,
		    keys_B:   'member-team-ids',
				jmc:      't2',
			})
		end
	end

	# Create the teams/competitions relationship for each participating team
	# 
	unless population_control[:competitions]
		@comp_team_ids.each do |team_id_str|
			populate_relation({
				coll_A:   :teams,
				key_A:    team_id_str,
				relation: :competitions,
				coll_B:   leagues,
				keys_B:   'competition-ids',
				jmc:      't2',
				})
		end
	end

	# Create the league/fixtures relationship for each league
	#
	unless population_control['league-fixtures']
		@all_league_ids.each do |league_id_str|
			populate_relation({
				coll_A:   :leagues,
				key_A:    league_id_str,
				relation: :fixtures,
				coll_B:   :fixtures,
		    keys_B:   'fixture-ids',
				jmc:      'f1',
			})
		end
	end

	# Create the team/fixtures relationship for each team
	#
	unless population_control['team-fixtures']
		@all_team_ids.each do |team_id_str|
			populate_relation({
				coll_A:   :teams,
				key_A:    team_id_str,
				relation: :fixtures,
				coll_B:   :fixtures,
		    keys_B:   'fixture-ids',
				jmc:      'f1',
			})
		end
	end

end

populate_my_app


# =================================================================================================
# 
# =================================================================================================

def jmc_delete_crapola
	api_url = "#{@base_url}/leagues/league_id"
	puts do_the_delete_call({ url: api_url, user: @user })
	$stdout.flush
end

def do_some_testing(args={})
	base_url = "https://api.orchestrate.io/v0"
	collection = 'leagues'

  key = 16
	api_url = "#{base_url}/#{collection}/#{key}"
	puts do_the_get_call( url: api_url, user: @user )

	api_url = "#{base_url}/#{collection}?query=country=Scotland"
	puts do_the_get_call( url: api_url, user: @user )

	api_url = "#{base_url}/#{collection}?query=country=Spain"
	puts do_the_get_call( url: api_url, user: @user )

	api_url = "#{base_url}/#{collection}?query=country=England"
	puts do_the_get_call( url: api_url, user: @user )
end

# do_some_testing

# require 'uri'
# require 'open-uri'
# def using_open_uri_calls
# 	key = args[:key]
# 	api_url = "#{base_url}/#{collection}/#{key}"
# 	response = open(api_url, http_basic_authentication: [ args[:user] ])
# 	puts response.read
# 	api_url = "#{base_url}/#{collection}?query=country=USA"
# 	response = open(api_url, http_basic_authentication: [ args[:user] ])
# 	puts response.read
# end


