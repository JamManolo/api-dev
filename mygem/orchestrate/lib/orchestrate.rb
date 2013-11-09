require "curb"

module NoDB

	class Orchestrate

		# ===================================================================================
		#  Initialize, plus a few private routines to perform basic HTTP actions
		
		def initialize(orch_config={})
			@base_url = orch_config['base-url']  # https://api.orchestrate.io/v0
			@user     = orch_config['user']      # <user-key-from-orchestrate.io>
		end

		# -------------------------------------------------------------------
		#  Use Curl to do the HTTP stuff (GET, PUT, DELETE)
		# -------------------------------------------------------------------
		def do_the_get_call(args)
			puts "----- GET: #{args[:url]}"
			c = Curl::Easy.new(args[:url]) do |curl|
				curl.http_auth_types = :basic
				curl.username = @user
			end
			c.perform
			c.body_str
		end

		def do_the_put_call(args)
			puts "----- PUT: #{args[:url]}"
			c = Curl::Easy.http_put(args[:url], args[:json]) do |curl|
				curl.headers['Accept'] = 'application/json'
				curl.headers['Content-Type'] = 'application/json'
				curl.http_auth_types = :basic
				curl.username = @user
			end
			c.perform
		  # c.body_str
		end

		def do_the_delete_call(args)
			puts "----- DELETE: #{args[:url]}"
			c = Curl::Easy.new(args[:url]) do |curl|
				curl.http_auth_types = :basic
				curl.username = @user
				curl.delete = true
			end
			c.perform
			c.inspect
		end

		private :do_the_get_call, :do_the_put_call, :do_the_delete_call

		# ===================================================================================
		#  Public routines to perform basic Orchestrate actions

		# -------------------------------------------------------------------
		#  Name: get_collection_key
		#  Desc: return specified 'row' of data (key)
		#  Args: collection, key
		# -------------------------------------------------------------------
		def get_collection_key(args)
			api_url = "#{base_url}/#{args[:collection]}/#{args[:key]}"
			do_the_get_call( url: api_url )
		end

		# -------------------------------------------------------------------
		#  Name: put_collection_key
		#  Desc: add specified 'row' of data (key)
		#  Args: collection, key, json (string)
		# -------------------------------------------------------------------
		def put_collection_key(args)
			api_url = "#{@base_url}/#{args[:collection]}/#{args[:key]}"
			puts do_the_put_call( url: api_url, json: args[:json] )
			$stdout.flush
		end

		# -------------------------------------------------------------------
		#  Name: delete_collection_key
		#  Desc: delete specified 'row' of data (key)
		#  Args: collection, key
		# -------------------------------------------------------------------
		def delete_collection_key(args)
			api_url = "#{@base_url}/#{args[:collection]}/#{args[:key]}"
			puts do_the_delete_call( url: api_url )
			$stdout.flush
		end

		# -------------------------------------------------------------------
		#  Name: get_events
		#  Desc: return requested events from specified key
		#  Args: collection, key, event_type
		# -------------------------------------------------------------------
		def get_events(args)
			api_url = "#{@base_url}/#{args[:collection]}/#{args[:key]}/events/#{args[:event_type]}"
			do_the_get_call( url: api_url )
		end

		# -------------------------------------------------------------------
		#  Name: put_events
		#  Desc: add events to specified key
		#  Args: collection, key, event_type, json (string)
		# -------------------------------------------------------------------
		def put_events(args)
			api_url = "#{@base_url}/#{args[:collection]}/#{args[:key]}/events/#{args[:event_type]}"
			puts do_the_put_call( url: api_url, json: args[:json] )
		end

		# -------------------------------------------------------------------
		#  Name: delete_events
		#  Desc: return requested events from specified key
		#  Args: collection, key, event_type
		# -------------------------------------------------------------------
		def delete_events(args)
			api_url = "#{@base_url}/#{args[:collection]}/#{args[:key]}/events/#{args[:event_type]}"
			do_the_delete_call( url: api_url )
		end

		# -------------------------------------------------------------------
		#  Name: get_relation
		#  Desc: return requested relation from specified key
		#  Args: collection, key, relation
		# -------------------------------------------------------------------
		def get_relation(args)
			api_url = "#{@base_url}/#{args[:collection]}/#{args[:key]}/relations/#{args[:relation]}"
			do_the_get_call( url: api_url )
		end

		# -------------------------------------------------------------------
		#  Name: put_relation
		#  Desc: create requested relation for specified key (coll_A/key_A)
		#  Args: collection_A, key_A, relation, collection_B, key_B
		# -------------------------------------------------------------------
		def put_relation(args)
			api_url = "#{@base_url}/#{args[:collection_A]}/#{args[:key_A]}/relation/" +
			                       "#{args[:relation]}/#{args[:collection_B]}/#{args[:key_B]}"
			puts do_the_put_call( url: api_url, json: '{}')
			$stdout.flush
		end

		# -------------------------------------------------------------------
		#  Name: delete_relation
		#  Desc: delete specified relations (all) from specified key
		#  Args: collection, key, relation
		# -------------------------------------------------------------------
		def delete_relation(args)
			api_url = "#{@base_url}/#{args[:collection_A]}/#{args[:key_A]}/relation/" +
			                       "#{args[:relation]}/#{args[:collection_B]}/#{args[:key_B]}"
			do_the_delete_call( url: api_url )
		end


		# ===================================================================================
		#  Generalized routines to populate Orchestrate collections
		#  These 'convenience methods' perform basic Orchestrate actions for lists of items

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

		# ===================================================================================
		#  Generalized routines to delete lists of collection keys, events and relations

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

	end # class Orchestrate

end # module NoDB

