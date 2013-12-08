# =================================================================================================
#  Routines to initialize, populate and update application-specific Orchestrate collections
#
#  These 'convenience methods' perform basic Orchestrate actions for lists of items, with the 
#  json data coming from the production data store.
# =================================================================================================

# -------------------------------------------------------------------------------------------------
#  Name: get_the_json
#  Desc: 
# -------------------------------------------------------------------------------------------------
@use_ds = nil

def get_the_json(file_str)
	filename = "#{@root_name}-#{file_str}.json"
	puts "Reading JSON from '#{filename}'"
	json = @use_ds ? aws_fetch_data(path: 'soccer/nodb', name: filename)
	               : open("#{@src_dir}/#{filename}").read
end

@show_response = true
def show_response(response)
	if @show_response
		puts response
		$stdout.flush
	end
end

# =================================================================================================
#   KEYS

# -------------------------------------------------------------------------------------------------
#  Name: populate_keys
#  Desc: convenience method -> put_collection for a list of keys, from known data source
# -------------------------------------------------------------------------------------------------
def populate_keys(args)
	args[:keys].each do |key|
		json = get_the_json("#{args[:collection]}-#{key}-create-#{args[:jmc]}-record")
		show_response args[:client].put_key(collection: args[:collection], key: key, json: json)
	end
end

# -------------------------------------------------------------------------------------------------
#  Name: update_key
#  Desc: convenience method to update record for specified key, from known data source
# -------------------------------------------------------------------------------------------------
def update_key(args)
	update_rec = JSON.parse(get_the_json("#{args[:collection]}-#{args[:key]}-update-#{args[:jmc]}-record"))
	original_rec = JSON.parse(args[:client].get_key(collection: args[:collection], key: args[:key]))
	update_rec.keys.each do |k|
		unless k == args[:update_idx]
			original_rec[k] = update_rec[k]
		end
	end
	json = JSON.generate(original_rec)
	args[:client].put_key(collection: args[:collection], key: args[:key], json: json)
end

# -------------------------------------------------------------------------------------------------
# #  Name: update_keys
# #  Desc: convenience method -> update for a list of keys, from known data source
# # -------------------------------------------------------------------------------------------------
# def update_keys(args)
# 	update_key_name = args[:update_key_name]
# 	update_recs= JSON.parse(
# 		get_the_json("#{args[:collection]}-#{args[:group]}-update-#{args[:jmc]}-records")
# 	)[args[:collection]]
# 	update_recs.each do |update_rec|
# 		orig_rec = JSON.parse(args[:client].get_key(collection: args[:collection], key: update_rec[:update_key_name]))
# 		update_rec.keys.each do |k|
# 			unless k == update_key_name
# 				orig_rec[k] = update_rec[k]
# 			end
# 		end
# 		json = JSON.stringify(orig_rec)
# 		args[:client].put_key(collection: args[:collection], key: update_rec[:update_key_name], json: json)
# 	end
# end


# =================================================================================================
#   EVENTS

# -------------------------------------------------------------------------------------------------
#  Name: get_events_list
#  Desc: get the list of events for specified 'key/event_type'
#  Args: client, collection, key, jmc, list
# -------------------------------------------------------------------------------------------------
def get_events_list(args)
	JSON.parse(
		get_the_json("#{args[:collection]}-#{args[:key]}-#{args[:event_type]}-#{args[:jmc]}-list")
  )[args[:list]]
end

# -------------------------------------------------------------------------------------------------
#  Name: populate_events
#  Desc: client, convenience method to PUT a list events for specified 'key/event_type'
#  Args: client, collection, key, jmc, list
# -------------------------------------------------------------------------------------------------
def populate_events(args)
	get_events_list(args).each do |event|
		json = get_the_json("#{args[:collection]}-#{args[:key]}-#{args[:event_type]}-#{event}-#{args[:jmc]}-record")
		puts json
		$stdout.flush
		args[:client].put_event(collection: args[:collection], key: args[:key],
		                        event_type: args[:event_type], json: json )
	end
end

# =================================================================================================
#   RELATIONS

# -------------------------------------------------------------------------------------------------
#  Name: get_relation_list
#  Desc: get the list of relations for specified 'key/relation'
#  Args: client, collection_A, key_A, collection_B, list, jmc
# -------------------------------------------------------------------------------------------------
def get_relation_list(args)
  JSON.parse(
  	get_the_json("#{args[:collection_A]}-#{args[:key_A]}-#{args[:collection_B]}-#{args[:jmc]}-relation")
  )[args[:list]]
end

# -------------------------------------------------------------------------------------------------
#  Name: populate_relation
#  Desc: convenience method to PUT list of relations for specified 'key/relation'
#  Args: client, collection_A, key_A, collection_B, list, jmc
# -------------------------------------------------------------------------------------------------
def populate_relation(args)
	get_relation_list(args).each do |key_B|
		show_response args[:client].put_relation({
			collection_A: args[:collection_A], key_A: args[:key_A], relation: args[:relation],
			collection_B: args[:collection_B], key_B: key_B
		})
	end
end

# -------------------------------------------------------------------------------------------------
#  Name: delete_relation_list
#  Desc: convenience method to DELETE list of relations for specified 'key/relation'
#  Args: collection_A, key_A, relation
# -------------------------------------------------------------------------------------------------
def delete_relation_list(args)
	get_relation_list(args).each do |key_B|
		args[:client].delete_relation({
			collection_A: args[:collection_A], key_A: args[:key_A], relation: args[:relation],
			collection_B: args[:collection_B], key_B: key_B
		})
	end
end


# ===================================================================================
#  These 'convenience methods' perform put/delete actions for lists of keys

# # -------------------------------------------------------------------
# #  Name: delete_keys
# #  Desc: delete_collection for a list of keys
# #  Args: collection, keys
# # -------------------------------------------------------------------
# def delete_keys(args)
# 	args[:keys].each do |key|
# 		args[:client].delete_key(collection: args[:collection], key: key)
# 	end
# end

# # -------------------------------------------------------------------
# #  Name: delete_events_list
# #  Desc: delete_events for list of events for specified key
# #  Args: collection, key, events
# # -------------------------------------------------------------------
# def delete_events_list(args)
# 	args[:events].each do |event|
# 		api_url = "#{base_url}/#{args[:collection]}/#{args[:key]}/events/#{event}"
# 		puts do_the_delete_call({ url: api_url })
# 		$stdout.flush
# 	end
# end






