#!/Users/jimcar/.rvm/rubies/ruby-2.0.0-p247/bin/ruby -w
#coding:utf-8

# Inspired by https://gist.github.com/3166610
require 'google/api_client'
require 'json'
require 'openssl'

# Update these to match your own apps credentials
service_account_email = "765280027324-l4aq4o9r9pkk6bjtn8m0dgolkfo0v30j@developer.gserviceaccount.com" # Email of service account
key_file = 'privatekey.p12' # File containing your private key
key_secret = 'notasecret' # Password to unlock private key

client = Google::APIClient.new(application_name: "Soccer App", application_version: "0.1")

# Load our credentials for the service account
key = Google::APIClient::KeyUtils.load_from_pkcs12(key_file, key_secret)
client.authorization = Signet::OAuth2::Client.new(
  :token_credential_uri => 'https://accounts.google.com/o/oauth2/token',
  :audience => 'https://accounts.google.com/o/oauth2/token',
  # :scope => 'https://www.googleapis.com/auth/devstorage.read_write',
  :scope => 'https://www.googleapis.com/auth/devstorage.full_control',
  :issuer => service_account_email,
  :signing_key => key)

# Request a token for our service account
client.authorization.fetch_access_token!

# client.discovered_apis.each do |gapi|
#   puts "#{gapi.title} \t #{gapi.id} \t #{gapi.preferred}"
# end
storage = client.discovered_api('storage', 'v1beta2')

# GET https://www.googleapis.com/storage/v1beta2/b?project=free-fantasy-football-info&projection=full&key={YOUR_API_KEY}
storage_info = client.execute(:api_method => storage.buckets.list, :parameters => { 
  project: "free-fantasy-football-info",
})
# puts "Blah 3 #{storage_info}"
# puts "Blah 3 #{storage_info.body}"

storage_info = client.execute(api_method: storage.buckets.get, parameters: {
  bucket: "fff-info-files"
})
# puts "Blah 3.5 #{storage_info}"
# puts "Blah 3.5 #{storage_info.body}"

storage_info = client.execute(:api_method => storage.objects.list, :parameters => { 
  bucket: "fff-info-files",
})
jmc = JSON.parse storage_info.body

# puts "Blah 4 #{storage_info}"
# puts "Blah 4 #{storage_info.body}"
# puts "Blah 4 #{storage_info.response}"
# puts "====================="
# jmc.each do |k,v|
#   puts "---------------------"
#   puts "#{k} \t #{v}"
#   puts "---------------------"
# end
# jmc["items"].each do |item|
#   puts "====================="
#   puts item
#   puts "====================="
# end

obj = jmc["items"][2]["name"]
puts "obj = '#{obj}'"
storage_info = client.execute(:api_method => storage.objects.get, :parameters => { 
  bucket: "fff-info-files",
  object: obj,
  alt: "media",
})
puts "----- storage_info -----"
puts "Blah 4.5 #{storage_info}"
puts "----- storage_info.body -----"
puts "Blah 4.5 #{storage_info.body}"
puts "----- storage_info.response -----"
puts "Blah 4.5 #{storage_info.response}"
puts "----- storage_info.response.status -----"
puts "Blah 4.5 #{storage_info.response.status}"
puts "----- storage_info.response.headers -----"
puts "Blah 4.5 #{storage_info.response.headers}"
puts "----- storage_info.response.body -----"
puts "Blah 4.5 #{storage_info.response.body}"
puts "----- storage_info.response.env -----"
puts "Blah 4.5 #{storage_info.response.env}"
puts "----- storage_info.response.env[:response_headers] -----"
puts "Blah 4.5 #{storage_info.response.env[:response_headers]}"
puts "----- storage_info.response.env[:response_headers]['location'] -----"
puts "Blah 4.5 #{storage_info.response.env[:response_headers]['location']}"
puts "----- storage_info.response.env[:url] -----"
puts "Blah 4.5 #{storage_info.response.env[:url]}"
puts "----- storage_info.data -----"
puts "Blah 4.5 #{storage_info.data}"
puts "----- storage_info.request -----"
puts "Blah 4.5 #{storage_info.request}"
puts "----- storage_info.request.authorization -----"
puts "Blah 4.5 #{storage_info.request.authorization}"
puts "----- storage_info.request.authorization.access_token -----"
puts "Blah 4.5 #{storage_info.request.authorization.access_token}"

url = storage_info.response.env[:response_headers]['location']
uri = URI(url)
puts "Blah 92 url = '#{url}'"
puts "Blah 92 uri = '#{uri}'"

# res = Net::HTTP.get_response uri
# puts "Blah 92 res = '#{res}'"
# puts "Blah 92 res.code = '#{res.code}'"
# puts "Blah 92 res.message = '#{res.message}'"
# puts "Blah 92 res.class.name = '#{res.class.name}'"

# f = File.open("jmc.objects.get-3", "w")
# # Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https', key: key) do |http|
# Net::HTTP.start(uri.host, uri.port, :use_ssl => true) do |http|
#   request = Net::HTTP::Get.new  uri
#   response = http.request request  # Net::HTTPResponse object
#   f.puts response
# end
# f.close

puts "----- Just HTTParty Hard! -----"
require 'httparty'
token = "Bearer #{storage_info.request.authorization.access_token}"
jmcjmc = HTTParty.get(url, headers: {"Authorization" => token})
f = File.open("jmc.objects.get-4", "w")
f.puts jmcjmc
f.close
puts "----- Just HTTParty Hard! -----"


# response = Net::HTTP.post_form( URI.parse( @api_url ), api_args )


# jmcjmc = Net::HTTP.get(uri, { :use_ssl => uri.scheme == 'https', key: key })

    

# storage_info = client.execute(api_method: storage.bucket_access_controls.list, parameters: {
#   bucket: "fff-info-files"
# })
# puts "Blah 5 #{storage_info}"
# puts "Blah 5 #{storage_info.body}"
# puts "Blah 5 #{storage_info.response}"



