
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

# ===================================================================================
#  These 'convenience methods' perform put/delete actions for lists of keys

# -------------------------------------------------------------------
#  Name: populate_collection
#  Desc: put_collection for a list of keys
#  Args: collection, keys, json (hash-of-strings)
# -------------------------------------------------------------------
def populate_collection(args)
	args[:keys].each do |key|
		api_url = "#{@base_url}/#{args[:collection]}/#{key}"
		puts do_the_put_call({ url: api_url, json: args[:json][key] })
		$stdout.flush
	end
end

# -------------------------------------------------------------------
#  Name: delete_collection
#  Desc: delete_collection for a list of keys
#  Args: collection, keys
# -------------------------------------------------------------------
def delete_collection(args)
	args[:keys].each do |key|
		api_url = "#{@base_url}/#{args[:collection]}/#{key}"
		puts do_the_delete_call({ url: api_url })
		$stdout.flush
	end
end


# -------------------------------------------------------------------
#  Name: populate_events
#  Desc: put_events for list of events for specified key 
#  Args: collection, key, events, json
# -------------------------------------------------------------------
def populate_events(args)
	args[:events].each do |event|
		api_url = "#{base_url}/#{args[:collection]}/#{args[:key]}/events/#{args[:type]}"
		puts do_the_put_call({ url: api_url, json: args[:json][event] })
		$stdout.flush
	end
end

# -------------------------------------------------------------------
#  Name: populate_relation
#  Desc: put_relation for list of relations (keys_B) for key (coll_A/key_A)
#  Args: collection_A, key_A, relation, collection_B, keys_B
# -------------------------------------------------------------------
def populate_relation(args)
	args[:keys_B].each do |key_B|
		api_url = "#{@base_url}/#{args[:collection_A]}/#{args[:key_A]}/relation/" +
		          "#{args[:relation]}/#{args[:collection_B]}/#{key_B}"
		puts do_the_put_call({ url: api_url, json: '{}' })
		$stdout.flush
	end
end

# -------------------------------------------------------------------
#  Name: delete_events_list
#  Desc: delete_events for list of events for specified key
#  Args: collection, key, events
# -------------------------------------------------------------------
def delete_events_list(args)
	args[:events].each do |event|
		api_url = "#{base_url}/#{args[:collection]}/#{args[:key]}/events/#{event}"
		puts do_the_delete_call({ url: api_url })
		$stdout.flush
	end
end

# -------------------------------------------------------------------
#  Name: delete_relation_list
#  Desc: delete_relation for list of relations for specified key (coll_A/key_A)
#  Args: collection_A, key_A, relation
# -------------------------------------------------------------------
def delete_relation_list(args)
	api_url = "#{@base_url}/#{args[:collection_A]}/#{args[:key_A]}/relations/#{args[:relation]}"
	puts do_the_delete_call( url: api_url )
	$stdout.flush
end