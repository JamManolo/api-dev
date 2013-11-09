require "curb"

# ===================================================================
#  Use Curl to do the HTTP stuff
# ===================================================================
def do_the_get_call(args)
	puts "----- GET: #{args[:url]} -----"
	c = Curl::Easy.new(args[:url]) do |curl|
		curl.http_auth_types = :basic
		curl.username = args[:user]
	end
	c.perform
	c.body_str
end

def do_the_put_call(args)
	puts "----- PUT: #{args[:url]} -----"
	c = Curl::Easy.http_put(args[:url], args[:json]) do |curl|
		curl.headers['Accept'] = 'application/json'
		curl.headers['Content-Type'] = 'application/json'
		curl.http_auth_types = :basic
		curl.username = args[:user]
	end
	c.perform
  # c.body_str
end

# def do_the_new_call(args)
# 	puts "----- NEW: #{args[:url]} -----"
# 	c = Curl::Easy.new(args[:url]) do |curl|
# 		curl.headers['Accept'] = 'application/json'
# 		curl.headers['Content-Type'] = 'application/json'
# 		curl.http_auth_types = :basic
# 		curl.username = args[:user]
# 	end
# 	c.perform
#   c.body_str
# end

def do_the_delete_call(args)
	puts "----- DELETE: #{args[:url]} -----"
	c = Curl::Easy.new(args[:url]) do |curl|
		curl.http_auth_types = :basic
		curl.username = args[:user]
		curl.delete = true
	end
	c.perform
	c.inspect
end

# =================================================================================================
#  Routines to perform basic Orchestrate actions
# =================================================================================================

# This is what 'orch_config.json' looks like:
#
# {
# 	"base-url":"https://api.orchestrate.io/v0",
# 	"user":"<your-user-key-from-orchestrate.io>"
# }
#
@orch_config = JSON.parse(open("orch_config.json").read)
@base_url = orch_config['base-url']
@user     = orch_config['user']

# -------------------------------------------------------------------------------------------------
#  Name: get_collection_key
#  Desc: return specified 'row' of data (key)
# -------------------------------------------------------------------------------------------------
def get_collection_key(args)
	api_url = "#{base_url}/#{args[:collection]}/#{args[:key]}"
	do_the_get_call( url: api_url, user: @user )
end

# -------------------------------------------------------------------------------------------------
#  Name: put_collection_key
#  Desc: add specified 'row' of data (key)
# -------------------------------------------------------------------------------------------------
def put_collection_key(args)
	api_url = "#{@base_url}/#{args[:collection]}/#{args[:key]}"
	puts do_the_put_call( url: api_url, user: @user, json: args[:json] )
end

# -------------------------------------------------------------------------------------------------
#  Name: get_events
#  Desc: return requested events from specified key
# -------------------------------------------------------------------------------------------------
def get_events(args)
	api_url = "#{@base_url}/#{args[:collection]}/#{args[:key]}/events/#{args[:event_type]}"
	do_the_get_call( url: api_url, user: @user )
end

# -------------------------------------------------------------------------------------------------
#  Name: put_events
#  Desc: add events to specified key
# -------------------------------------------------------------------------------------------------
def put_events(args)
	api_url = "#{@base_url}/#{args[:collection]}/#{args[:key]}/events/#{args[:event_type]}"
	puts do_the_put_call( url: api_url, user: @user, json: args[:json] )
end

# -------------------------------------------------------------------------------------------------
#  Name: get_relation
#  Desc: return requested relation from specified key
# -------------------------------------------------------------------------------------------------
def get_relation(args)
	api_url = "#{@base_url}/#{args[:collection]}/#{args[:key]}/relations/#{args[:relation]}"
	do_the_get_call( url: api_url, user: @user )
end

# -------------------------------------------------------------------------------------------------
#  Name: put_relation
#  Desc: create the requested relation for the specified key (coll_A/key_A)
# -------------------------------------------------------------------------------------------------
def put_relation(args)
	api_url = "#{@base_url}/#{args[:coll_A]}/#{args[:key_A]}/relation/" +
	          "#{args[:relation]}/#{args[:coll_B]}/#{key_B}"
	puts do_the_put_call( url: api_url, user: @user, json: '{}')
end


# =================================================================================================
#  Generalized routines to populate Orchestrate collections
#  These 'convenience methods' perform basic Orchestrate actions for lists of items
# =================================================================================================

# -------------------------------------------------------------------------------------------------
#  Name: populate_collection
#  Desc: convenience method, put_collection for a list of keys
# -------------------------------------------------------------------------------------------------
def populate_collection(args)
	args[:keys].each do |key|
		api_url = "#{@base_url}/#{args[:collection]}/#{key}"
		puts do_the_put_call({ url: api_url, user: @user, json: args[:json][key] })
	end
end

# -------------------------------------------------------------------------------------------------
#  Name: populate_events
#  Desc: convenience method, put_events for list of events for specified key 
# -------------------------------------------------------------------------------------------------
def populate_events(args)
	args[:events].each do |event|
		api_url = "#{base_url}/#{args[:collection]}/#{args[:key]}/events/#{event}"
		puts do_the_put_call({ url: api_url, user: @user, json: args[:json][event] })
	end
end

# -------------------------------------------------------------------------------------------------
#  Name: populate_relation
#  Desc: convenience method, put_relation for list of relations for specified key (coll_A/key_A)
# -------------------------------------------------------------------------------------------------
def populate_relation(args)
	args[:keys_B].each do |key_B|
		api_url = "#{@base_url}/#{args[:coll_A]}/#{args[:key_A]}/relation/" +
		          "#{args[:relation]}/#{args[:coll_B]}/#{key_B}"
		puts do_the_put_call({ url: api_url, user: @user, json: '{}' })
	end
end


