require "json"
require "orchestrate-v0"
require "./orch-example-data"

# =================================================================================================
#  Populate the Orchestrate.io example application
#
#   Creating a collection: put_collection doesn't do the job, but the collection does appear to be
#   created automatically when the first put_key is executed.
# =================================================================================================

def populate_example_app(orchestrate)

  # -----------------------------------------------------------------------------------
  #  Create the 'films' collection
  #
  orchestrate.put_collection(collection: 'films')

	# -----------------------------------------------------------------------------------
	#  Populate the 'films' collection
	#
  @films.keys.each do |key|
  	orchestrate.put_key(collection: 'films',	key: key, json: @films[key])
  end

	# -----------------------------------------------------------------------------------
	#  Populate 'films/comments' events for key 'the_godfather'
	#
  already_populated = 
    JSON.parse(orchestrate.get_events(collection: 'films', key: 'the_godfather', event_type: 'comments'))['count'] > 0

  unless already_populated == true
   	@comments.each do |comment|
  		orchestrate.put_event(collection: 'films', key: 'the_godfather', event_type: 'comments', json: comment)
    end
  end

	# -----------------------------------------------------------------------------------
	#  Create the 'films/sequel' relations for the Godfather series
	#
	orchestrate.put_relation(collection_A: 'films', key_A: 'the_godfather', relation: 'sequel',
													 collection_B: 'films', key_B: 'the_godfather_part_2')

	orchestrate.put_relation(collection_A: 'films', key_A: 'the_godfather_part_2', relation: 'sequel',
													 collection_B: 'films', key_B: 'the_godfather_part_3')
end


# =================================================================================================
#  Test the Orchestrate.io example application
#
# =================================================================================================
@show_response = true

def show_response(response)
  if @show_response == true
    puts response
    $stdout.flush
  end
end

def test_example_app(orchestrate)

  # -----------------------------------------------------------------------------------
  #  Get the entire 'films' collection
  #
  # Try creating the collection explicitly.  It does get created implicitly when the first key is created.
  show_response orchestrate.get_collection(collection: 'films')

  # -----------------------------------------------------------------------------------
  #  Get each film from the 'films' collection
  #
  @films.keys.each do |key|
    show_response orchestrate.get_key(collection: 'films',  key: key)
  end

  # -----------------------------------------------------------------------------------
  #  Get 'films/comments' events for 'the_godfather'
  #
  show_response orchestrate.get_events(collection: 'films', key: 'the_godfather', event_type: 'comments')

  # -----------------------------------------------------------------------------------
  #  Get the 'films/sequel' relations for the Godfather series
  #
  show_response orchestrate.get_relations(collection: 'films', key: 'the_godfather', relation: 'sequel')
  show_response orchestrate.get_relations(collection: 'films', key: 'the_godfather', relation: 'sequel/sequel')
  show_response orchestrate.get_relations(collection: 'films', key: 'the_godfather_part_2', relation: 'sequel')

  # Try to get individual relations - (corresponding to how they were 'put')
  show_response orchestrate.get_relation(collection_A: 'films', key_A: 'the_godfather', relation: 'sequel',
                                  collection_B: 'films', key_B: 'the_godfather_part_2')

  show_response orchestrate.get_relation(collection_A: 'films', key_A: 'the_godfather_part_2', relation: 'sequel',
                                  collection_B: 'films', key_B: 'the_godfather_part_3')

  # -----------------------------------------------------------------------------------
  #  Do some queries
  #
  query = "Rated:M"
  show_response orchestrate.query(collection: 'films', query: query)

  query = "Genre:crime"
  show_response orchestrate.query(collection: 'films', query: query)

  query = "*"
  show_response orchestrate.query(collection: 'films', query: query)

  query = "*will*"
  show_response orchestrate.query(collection: 'films', query: query)
end


# =================================================================================================
#  Cleanup/empty/reset/delete/etc the Orchestrate.io sample application
#
#   Deleting a collection's keys or deleting the entire collection works as expected. 
#   Not true for relations and events. (didn't make it into the v0 beta?)
#
# =================================================================================================
def clean_up_example_app(orchestrate)

	# -----------------------------------------------------------------------------------
	#  Delete the 'films/films' sequel relationship
	#
	# Try deleting each relation individually (corresponding to how they were 'put')
	orchestrate.delete_relation(collection_A: 'films', key_A: 'the_godfather', relation: 'sequel',
		   												collection_B: 'films', key_B: 'the_godfather_part_2')
	orchestrate.delete_relation(collection_A: 'films', key_A: 'the_godfather_part_2', relation: 'sequel',
															collection_B: 'films', key_B: 'the_godfather_part_3',)

	# Try deleting all 'sequel' relations [that may have associated with key 'the_godfather'
	orchestrate.delete_relations(collection_A: 'films', key_A: 'the_godfather', relation: 'sequel')

  # Try deleting all 'sequel' relations associated with key 'pulp_fiction'
  orchestrate.delete_relations(collection_A: 'films', key_A: 'pulp_fiction', relation: 'sequel')

	# -----------------------------------------------------------------------------------
	#  Delete the 'films/comments' events for key 'the_godfather'
	#
	# Try deleting all 'comments' events associated with the key
	orchestrate.delete_events(collection_A: 'films', key: 'the_godfather', event_type: 'comments')

	# -----------------------------------------------------------------------------------
	#  Delete the 'films' collection keys
	#
	@films.keys.each do |key|
		orchestrate.delete_key(collection: 'films',	key: key)
	end

  # -----------------------------------------------------------------------------------
  #  Delete the entire 'films' collection
  #
  orchestrate.delete_collection(collection: 'films')
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
	user = @orch_config['user-example'] 
	client = NoDB::Orchestrate.new('base-url' => @orch_config['base-url'], user: user, verbose: true)
	puts "user: '#{user}'"
	client
end

orch_client = get_orchestrate_client

clean_up_example_app(orch_client)
populate_example_app(orch_client)
test_example_app(orch_client)




