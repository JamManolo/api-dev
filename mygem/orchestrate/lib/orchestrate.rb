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
		#  Name: put_event
		#  Desc: add event to specified key
		#  Args: collection, key, event_type, json (string)
		# -------------------------------------------------------------------
		def put_event(args)
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

		# JMC - ?Matt? - neither approach to delete relations works
		# -------------------------------------------------------------------
		#  Name: delete_relation_all
		#  Desc: delete specified relations (all) from specified key
		#  Args: collection, key, relation
		# -------------------------------------------------------------------
		def delete_relation_all(args)
			api_url = "#{@base_url}/#{args[:collection_A]}/#{args[:key_A]}/relation/" +
			                       "#{args[:relation]}"
			do_the_delete_call( url: api_url )
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
		
	end # class Orchestrate

end # module NoDB

