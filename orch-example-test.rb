require "json"
# require "orchestrate-v0"
require "../Gems/orchestrate-v0/lib/orchestrate-v0"
require "./orch-example-data"

def error_msg(name, actual, expected)
  puts "***** FAIL: #{name}: actual: '#{actual}', expected: '#{expected}'"
  $stdout.flush
end

def check_response(args)
  if args[:test] =~ /_key$/
    actual = args[:actual].gsub(/\s+/, '').scan(/\w+/)
    expected = args[:expected].gsub(/\s+/, '').scan(/\w+/)
  else
    actual = args[:actual]
    expected = args[:expected]
  end

  if actual == expected
    puts "----- pass"
  else
    error_msg args[:test], actual, expected
  end
end

@expected = {
  put_collection: '{"message":"A provided search query param is invalid.",' +
                  '"details":{"query":"Query is empty."},"code":"search_param_invalid"}',
  get_collection: '{"message":"A provided search query param is invalid.",' +
                  '"details":{"query":"Query is empty."},"code":"search_param_invalid"}',
  put_relation:   'Internal Server Error'
}

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
  response = orchestrate.put_collection(collection: 'films')
  check_response(test: :put_collection, response: response, expected: @expected[:put_collection])

	# -----------------------------------------------------------------------------------
	#  Populate the 'films' collection
	#
  @films.keys.each do |key|
  	response = orchestrate.put_key(collection: 'films',	key: key, json: @films[key])
    check_response(test: :put_key, actual: response, expected: @films[key])
  end

	# -----------------------------------------------------------------------------------
	#  Populate 'films/comments' events for key 'the_godfather'
	#
 	@comments.each do |comment|
		response = orchestrate.put_event(collection: 'films', key: 'the_godfather', event_type: :comments, json: comment)
  end
  response = JSON.parse(orchestrate.get_events(collection: 'films', key: 'the_godfather', event_type: :comments))
  check_response(test: :put_event, actual: response['count'], expected: @comments.length)

	# -----------------------------------------------------------------------------------
	#  Create the 'films/sequel' relations for the Godfather series
	#
  response = 
	orchestrate.put_relation(collection_A: 'films', key_A: 'the_godfather', relation: 'sequel',
													 collection_B: 'films', key_B: 'the_godfather_part_2')
  check_response(test: 'put_relation', actual: JSON.parse(response)['message'], expected: @expected[:put_relation])

  response = 
	orchestrate.put_relation(collection_A: 'films', key_A: 'the_godfather_part_2', relation: 'sequel',
													 collection_B: 'films', key_B: 'the_godfather_part_3')
  check_response(test: 'put_relation', actual: JSON.parse(response)['message'], expected: @expected[:put_relation])
  # -----------------------------------------------------------------------------------
  #  Create the 'films/sequel' relations for the Pulp Fiction 'for-testing-purposes-only' series
  #
  response = 
  orchestrate.put_relation(collection_A: 'films', key_A: 'pulp_fiction', relation: 'sequel',
                           collection_B: 'films', key_B: 'pulp_fiction_part_2A')
  check_response(test: 'put_relation', actual: JSON.parse(response)['message'], expected: @expected[:put_relation])

  response = 
  orchestrate.put_relation(collection_A: 'films', key_A: 'pulp_fiction', relation: 'sequel',
                           collection_B: 'films', key_B: 'pulp_fiction_part_2B')
  check_response(test: 'put_relation', actual: JSON.parse(response)['message'], expected: @expected[:put_relation])
end



# =================================================================================================
#  Test the Orchestrate.io example application
#
# =================================================================================================
def test_example_app(orchestrate)

  # # -----------------------------------------------------------------------------------
  # #  Get the entire 'films' collection
  # #
  # # Try creating the collection explicitly.  It does get created implicitly when the first key is created.
  # response = orchestrate.get_collection(collection: 'films')
  # unless response == @expected[:get_collection]
  #   puts "ERROR: < - - - - - - >"
  #   $stdout.flush
  # end

  # # -----------------------------------------------------------------------------------
  # #  Get each film from the 'films' collection
  # #
  # @films.keys.each do |key|
  #   response = orchestrate.get_key(collection: 'films',  key: key)
  #   expected = @films[key]
  #   unless response.gsub!(/\s+/, '').scan(/\w+/) == expected.gsub!(/\s+/, '').scan(/\w+/)
  #     puts "ERROR: < - - - - - - >"
  #     $stdout.flush
  #   end
  # end

  # # -----------------------------------------------------------------------------------
  # #  Get 'films/comments' events for 'the_godfather'
  # #
  # puts orchestrate.get_events(collection: 'films', key: 'the_godfather', event_type: :comments)

  # # -----------------------------------------------------------------------------------
  # #  Get the 'films/sequel' relations for the Godfather series
  # #
  response = orchestrate.get_relations(collection: 'films', key: 'the_godfather', relation: 'sequel')
  puts response
  $stdout.flush

  # puts orchestrate.get_relations(collection: 'films', key: 'the_godfather', relation: 'sequel/sequel')
  # $stdout.flush

  # puts orchestrate.get_relations(collection: 'films', key: 'the_godfather_part_2', relation: 'sequel')
  # $stdout.flush

  # Try to get individual relations - (corresponding to how they were 'put')
  puts orchestrate.get_relation(collection_A: 'films', key_A: 'the_godfather', relation: 'sequel',
                                collection_B: 'films', key_B: 'the_godfather_part_2')
  puts orchestrate.get_relation(collection_A: 'films', key_A: 'the_godfather_part_2', relation: 'sequel',
                                collection_B: 'films', key_B: 'the_godfather_part_3')
  $stdout.flush

  # -----------------------------------------------------------------------------------
  #  Get the 'films/sequel' relations for the Pulp Fiction series
  #
  response =  orchestrate.get_relations(collection: 'films', key: 'pulp_fiction', relation: 'sequel')
  $stdout.flush

  # -----------------------------------------------------------------------------------
  #  Do some queries
  #
  query = "Rated:M"
  response = orchestrate.query(collection: 'films', query: query)
  $stdout.flush

  query = "Genre:crime"
  response = orchestrate.query(collection: 'films', query: query)
  $stdout.flush

  query = "*"
  response = orchestrate.query(collection: 'films', query: query)
  $stdout.flush

  query = "*will*"
  response = orchestrate.query(collection: 'films', query: query)
  $stdout.flush
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

# test_example_app(orch_client)

# clean_up_example_app(orch_client)



