require "json"
require "orchestrate-v0"
require "./orchestrate-utils"

puts Gem.loaded_specs['orchestrate-v0'].full_gem_path

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
@all_fixture_ids = JSON.parse(open("#{@src_dir}/#{@root_name}-fixtures-all-fixtures-f1-list.json").read)['all-fixture-ids']
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
	# population_groups = [:leagues, :orphans, :members, 'member-teams', :fixtures]
	population_groups = [:orphans, :members, 'member-teams']
	population_groups += [:competitions, :standings, 'league-fixtures', 'team-fixtures']
	population_groups.each do |x|
		@population_control[x] = true
	end

	if false
		['member-teams', :standings, :leagues].each do |group|
			@population_control[group] = :delete
		end
	end
end


setup_population_control


# =================================================================================================
#  Populate the Orchestrate.io application (fff-info)
# =================================================================================================

def populate_my_app(orchestrate)

	# -----------------------------------------------------------------------------------
	#  Populate the 'leagues' collection
	#
	# unless @population_control[:leagues]
	# 	populate_keys(client: orchestrate, collection: 'leagues', keys: @all_league_ids, jmc: 'a1')
	# end

	# # -----------------------------------------------------------------------------------
	# #  Populate the 'teams' collection for non-league (orphan) teams
	# #
	# unless @population_control[:orphans]
	# 	populate_keys(client: orchestrate, collection: 'teams', keys: @orphan_team_ids, jmc: 't1')
	# end

	# # -----------------------------------------------------------------------------------
	# #  Populate the 'teams' collection for league (member) teams
	# #
	# unless @population_control[:members]
	# 	populate_keys(client: orchestrate, collection: 'teams', keys: @member_team_ids, jmc: 't2')
	# end

	# -----------------------------------------------------------------------------------
	#  Populate the 'fixtures' collection
	#
	my_fixture_ids = ["299537", "299538"]
	unless @population_control[:fixtures]
		populate_keys(client: orchestrate, collection: 'fixtures', keys: my_fixture_ids, jmc: 'f1')
		# populate_keys(client: orchestrate, collection: 'fixtures', keys: @all_fixture_ids, jmc: 'f1')
	end

	# # -----------------------------------------------------------------------------------
	# #  Populate 'league/standings' events for each league
	# #
	# unless @population_control[:standings]
	# 	@all_league_ids.each do |league_id_str|
	# 		populate_events({
	# 			client:     orchestrate,
	# 			collection: :leagues,
	# 			key:        league_id_str,
	# 			event_type: :standings,
	# 			list:       'standings-ids',
	# 			jmc:        's1',
	# 		})
	# 	end
	# end

	# # -----------------------------------------------------------------------------------
	# #  Create the 'league/teams' relationship for each league
	# #
	# unless @population_control['member-teams']
	# 	@all_league_ids.each do |league_id_str|
	# 		get_relation_list({
	# 			collection_A: :leagues,
	# 			key_A:        league_id_str,
	# 			relation:     :teams,
	# 			collection_B: :teams,
	# 		  list:         'member-team-ids',
	# 		  jmc:          't2',
	# 		}).each do |key_B|
	# 			orchestrate.put_relation({
	# 				collection_A: :leagues,
	# 				key_A:        league_id_str,
	# 				relation:     :teams,
	# 				collection_B: :teams,
	# 				key_B:        key_B
	# 			})
	# 		end
	# 		# populate_relation({
	# 		# 	client:       orchestrate,
	# 		# 	collection_A: :leagues,
	# 		# 	key_A:        league_id_str,
	# 		# 	relation:     :teams,
	# 		# 	collection_B: :teams,
	# 		#   list:         'member-team-ids',
	# 		#   jmc:          't2',
	# 		# })
	# 	end
	# end

	# # -----------------------------------------------------------------------------------
	# #  Create the 'teams/competitions' relationship for each participating team
	# # 
	# unless @population_control[:competitions]
	# 	@comp_team_ids.each do |team_id_str|
	# 		populate_relation({
	# 			client:       orchestrate,
	# 			collection_A: :teams,
	# 			key_A:        team_id_str,
	# 			relation:     :competitions,
	# 			collection_B: :leagues,
	# 			list:         'competition-ids',
	# 			jmc:          't2',
	# 		})
	# 	end
	# end

	# # -----------------------------------------------------------------------------------
	# #  Create the 'league/fixtures' relationship for each league
	# #
	# unless @population_control['league-fixtures']
	# 	@all_league_ids.each do |league_id_str|
	# 		populate_relation({
	# 			client:       orchestrate,
	# 			collection_A: :leagues,
	# 			key_A:        league_id_str,
	# 			relation:     :fixtures,
	# 			collection_B: :fixtures,
	# 	    keys_B:       'fixture-ids',
	# 			jmc:          'f1',
	# 		})
	# 	end
	# end

	# # -----------------------------------------------------------------------------------
	# #  Create the 'team/fixtures' relationship for each team
	# #
	# unless @population_control['team-fixtures']
	# 	@all_team_ids.each do |team_id_str|
	# 		populate_relation({
	# 			client:       orchestrate,
	# 			collection_A: :teams,
	# 			key_A:        team_id_str,
	# 			relation:     :fixtures,
	# 			collection_B: :fixtures,
	# 	    keys_B:       'fixture-ids',
	# 			jmc:          'f1',
	# 		})
	# 	end
	# end


	# -----------------------------------------------------------------------------------
	#  Update each 'fixtures' record with the 'report_id'
	#
	unless @population_control['fixtures-report']
		# @update_fixture_ids.each do |fixture_id_str|

		my_fixture_ids.each do |fixture_id_str|
			update_key({
				client:      orchestrate,
				collection:  'fixtures',
				key:         fixture_id_str,
				update_idx:  'match_id',
				jmc:         'r1',
			})
		end
	end

end


# =================================================================================================
#  Cleanup/empty/reset/delete/etc the Orchestrate.io application data (fff-info)
# =================================================================================================
def clean_up_my_app(orchestrate)

	# -----------------------------------------------------------------------------------
	#  Delete the 'league/teams' relationship for each league
	#
	if @population_control['member-teams'] == :delete
		if false
			@all_league_ids.each do |league_id_str|
				# # Try deleting each relation individually (directly via the API)
				# filename = "#{@root_name}-leagues-#{league_id_str}-teams-t2-relation.json"
				# keys_B = JSON.parse(open("#{@src_dir}/#{filename}").read)['member-team-ids']
				# keys_B.each do |key_B|
				# 	orchestrate.delete_relation({
				# 		collection_A: :leagues,
				# 		key_A:        league_id_str,
				# 		relation:     :teams,
				# 		collection_B: :teams,
				# 		key_B:        key_B,
				# 	})
				# end

				# Try deleting each relation individually (via the helper)
				delete_relation_list({
					client:       orchestrate,
					collection_A: 'leagues',
					key_A:        league_id_str, 
					relation:     'teams'
				})

				# Try deleting the entire relationship
				orchestrate.delete_relations(collection_A: 'leagues', key_A: league_id_str, relation: 'teams')
			end
		end
	end

	# -----------------------------------------------------------------------------------
	#  Delete the 'league/standings' events for each league
	#
	if @population_control[:standings] == :delete
		if false
			@all_league_ids.each do |league_id_str|
				orchestrate.delete_events(collection_A: 'leagues', key: league_id_str, event_type: 'standings')
			end
		end
	end

	# -----------------------------------------------------------------------------------
	#  Delete the 'leagues' collection keys
	#
	if @population_control[:leagues] == :delete
		@all_league_ids.each do |league_id_str|
			orchestrate.delete_key(collection: 'leagues', key: league_id_str)
		end
	end
end


# =================================================================================================
#  Get a client and get started!
#
#  This is what 'orch_config.json' looks like:
# 	 {
#    	 "base-url":"https://api.orchestrate.io/v0",
#   	 "user-example":"user-key-from-orchestrate.io"
# 	 }
# =================================================================================================
@orch_config = JSON.parse(open('orch_config.json').read)

def get_orchestrate_client
  client = NoDB::Orchestrate.new({
    'base-url' => @orch_config['base-url'], user: @orch_config['user'], verbose: true
  })
end

orchestrate_client = get_orchestrate_client

# clean_up_my_app(orchestrate_client)
populate_my_app(orchestrate_client)



