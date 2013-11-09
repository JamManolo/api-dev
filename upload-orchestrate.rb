require "json"
require "./mygem/orchestrate/lib/orchestrate"

# =================================================================================================
#  Initialize application-specific data
#
#  This is what 'orch_config.json' looks like:
# 	 {
#    	 "base-url":"https://api.orchestrate.io/v0",
#   	 "user":"<user-key-from-orchestrate.io>"
# 	 }
# =================================================================================================
@orch_config = JSON.parse(open("orch_config.json").read)
@src_dir         = @orch_config['src-dir']
@root_name       = @orch_config['root-name']
@all_league_ids  = @orch_config['all-league-ids']
@all_comp_ids    = @orch_config['all-competition-ids']
# @all_fixture_ids = JSON.parse(open("#{@src_dir}/#{@root_name}-fixtures-all-fixtures-f1-list.json").read)['all-fixture-ids']
@comp_team_ids   = JSON.parse(open("#{@src_dir}/#{@root_name}-teams-all-competitions-t2-list.json").read)['all-team-ids']
@all_team_ids    = JSON.parse(open("#{@src_dir}/#{@root_name}-teams-all-teams-t1-list.json").read)['all-team-ids']
@member_team_ids = JSON.parse(open("#{@src_dir}/#{@root_name}-teams-all-leagues-t2-list.json").read)['all-team-ids']
@orphan_team_ids = @all_team_ids - @member_team_ids


# -----------------------------------------------------------------------------------
#  Population Control!  Don't populate groups that:
#  1) = have already been populated
#  2) += are awaiting generation of population source data
# -----------------------------------------------------------------------------------
def setup_population_control
	@population_control = Hash.new
	population_groups = [:leagues, :orphans, :members, 'member-teams']
	population_groups += [:competitions, :standings, :fixtures, 'league-fixtures', 'team-fixtures']
	population_groups.each do |x|
		@population_control[x] = true
	end
end
setup_population_control


# =================================================================================================
#  Populate the Orchestrate.io application (fff-info)
# =================================================================================================

def populate_my_app

  orchestrate = NoDB::Orchestrate.new({
		'base-url' => @orch_config['base-url'],
		'user'     => @orch_config['user'],
	})

	# -----------------------------------------------------------------------------------
	#  Populate the leagues collection
	#
	unless @population_control[:leagues]
		collection = 'leagues'
		json = Hash.new
		@all_league_ids.each do |key|
			json[key] = open("#{@src_dir}/#{@root_name}-#{collection}-#{key}-create-a1-record.json")
		end
		orchestrate.populate_collection(collection: collection,	keys: @all_league_ids, json: json)
	end

	# -----------------------------------------------------------------------------------
	#  Populate the teams collection for non-league (orphan) teams
	#
	unless @population_control[:orphans]
		collection = 'teams'
		json = Hash.new
		@orphan_team_ids.each do |key|
			json[key] = open("#{@src_dir}/#{@root_name}-#{collection}-#{key}-create-t1-record.json")
		end
		orchestrate.populate_collection(collection: collection, keys: @orphan_team_ids, json: json)
	end

	# -----------------------------------------------------------------------------------
	#  Populate the teams collection for league (member) teams
	#
	unless @population_control[:members]
		collection = 'teams'
		json = Hash.new
		@member_team_ids.each do |key|
			json[key] = open("#{@src_dir}/#{@root_name}-#{collection}-#{key}-create-t2-record.json")
		end
		orchestrate.populate_collection(collection: collection, keys: @member_team_ids, json: json)
	end

	# -----------------------------------------------------------------------------------
	#  Populate the fixtures collection
	#
	unless @population_control[:fixtures]
		collection = 'fixtures'
		json = Hash.new
		@all_fixture_ids.each do |key|
			json[key] = open("#{@src_dir}/#{@root_name}-#{collection}-#{key}-create-f1-record.json")
		end
		orchestrate.populate_collection(collection: collection, keys: @all_fixture_ids, json: json)
	end

	# -----------------------------------------------------------------------------------
	#  Populate league/standings events for each league
	#
	unless @population_control[:standings]
		collection = :leagues
		type       = :standings
		@all_league_ids.each do |league_id_str|
			key = league_id_str
			filename = "#{@src_dir}/#{@root_name}-#{collection}-#{key}-#{type}-s1-list.json"
			JSON.parse(open(filename).read)['standings-ids'].each do |event|
				filename = "#{@root_name}-#{collection}-#{key}-#{type}-#{event}-create-s1-event.json"
				json = open("#{@src_dir}/#{filename}")
				orchestrate.put_events({
					collection: collection,
					key:        key,
					event_type: type,
					json:       json,
				})
			end
		end
	end

	# -----------------------------------------------------------------------------------
	#  Create the league/teams relationship for each league
	#
	unless @population_control['member-teams']
		collection_A = :leagues
		collection_B = :teams
		@all_league_ids.each do |league_id_str|
			key_A        = league_id_str
			filename = "#{@root_name}-#{collection_A}-#{key_A}-#{collection_B}-t2-relation.json"
			keys_B = JSON.parse(open("#{@src_dir}/#{filename}").read)['member-team-ids']
			orchestrate.populate_relation({
				collection_A: collection_A,
				key_A:        key_A,
				relation:     :teams,
				collection_B: collection_B,
		    keys_B:       keys_B,
			})
		end
	end

	# -----------------------------------------------------------------------------------
	#  Create the teams/competitions relationship for each participating team
	# 
	unless @population_control[:competitions]
		@comp_team_ids.each do |team_id_str|
			orchestrate.populate_relation({
				collection_A: :teams,
				key_A:        team_id_str,
				relation:     :competitions,
				collection_B: leagues,
				keys_B:       'competition-ids',
				jmc:          't2',
				})
		end
	end

	# -----------------------------------------------------------------------------------
	#  Create the league/fixtures relationship for each league
	#
	unless @population_control['league-fixtures']
		@all_league_ids.each do |league_id_str|
			orchestrate.populate_relation({
				collection_A: :leagues,
				key_A:        league_id_str,
				relation:     :fixtures,
				collection_B: :fixtures,
		    keys_B:       'fixture-ids',
				jmc:          'f1',
			})
		end
	end

	# -----------------------------------------------------------------------------------
	#  Create the team/fixtures relationship for each team
	#
	unless @population_control['team-fixtures']
		@all_team_ids.each do |team_id_str|
			orchestrate.populate_relation({
				collection_A: :teams,
				key_A:        team_id_str,
				relation:     :fixtures,
				collection_B: :fixtures,
		    keys_B:       'fixture-ids',
				jmc:          'f1',
			})
		end
	end

end

populate_my_app


# =================================================================================================
#  Cleanup/empty/reset/delete/etc the Orchestrate.io application data (fff-info)
# =================================================================================================
def clean_up_my_app

	orchestrate = NoDB::Orchestrate.new({
		'base-url' => @orch_config['base-url'],
		'user'     => @orch_config['user'],
	})

	# -----------------------------------------------------------------------------------
	#  Delete the league/teams relationship for each league
	#
	#  JMC - This doesn't seem to work - ? for Matt from orchestrate.io
	if @population_control['member-teams']
		@all_league_ids.each do |league_id_str|
			# Try deleting each relation individually
			filename = "#{@root_name}-leagues-#{league_id_str}-teams-t2-relation.json"
			keys_B = JSON.parse(open("#{@src_dir}/#{filename}").read)['member-team-ids']
			keys_B.each do |key_B|
				orchestrate.delete_relation({
					collection_A: :leagues,
					key_A:        league_id_str,
					relation:     :teams,
					collection_B: :teams,
					key_B:        key_B,
				})
				$stdout.flush
			end
			# Try just deleting the entire relationship
			orchestrate.delete_relation_list(collection_A: 'leagues', key_A: league_id_str, relation: 'teams')
		end
	end

	# # -----------------------------------------------------------------------------------
	# #  Delete the league/standings events for each league
	# #
	# if @population_control[:standings]
	# 	@all_league_ids.each do |league_id_str|
	# 		orchestrate.delete_events(collection_A: :leagues, key: league_id_str, event: :standings)
	# 	end
	# end

	# # -----------------------------------------------------------------------------------
	# #  Delete the leagues collection keys
	# #
	# if @population_control[:leagues]
	# 	@all_league_ids.each do |league_id_str|
	# 		orchestrate.delete_collection(collection: :leagues,	keys: @all_league_ids)
	# 	end
	# end
	
end

clean_up_my_app









