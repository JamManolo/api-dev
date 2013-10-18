#!/Users/jimcar/.rvm/rubies/ruby-2.0.0-p247/bin/ruby -w
#coding:utf-8

require 'fog'
require 'json'

gapi_config = JSON.parse(File.open('gapi_config.json').read)

service = Fog::Storage.new({
	provider:            'google',
	google_storage_access_key_id: "00b4903a97cd6919b43fad381f2799fb1ae62a008adaa42d4afd52c075435492",
	google_storage_secret_access_key: gapi_config['key_file'],
	# google_project:      gapi_config['project'],
	# google_project:      gapi_config['project'],
	# google_client_email: gapi_config['service_account_email'],
	# google_key_location: gapi_config['key_file'],
})


puts service.nil? ? "service: NIL" : "service: #{service}"
puts "----- requests ------\n#{service.requests}"

# List the buckets and objects, download all the objects
puts "------service.directories ------"

bucket = service.get_bucket("fff-info-files")
puts bucket.key

# service.directories.each do |dir|
# 	# puts "KEY = #{dir.key}"
# 	# dir.files.each do |file|
# 	# 	puts "NAME = #{file.key}"
# 	# 	next if file.key =~ /^logs\//
# 	# 	File.open("./downloads/gapi-fog/#{file.key}", 'w') do |f|
# 	# 		dir.files.get(file.key) do | data, remaining, content_length |
# 	# 			f.syswrite data
# 	# 		end
# 	# 	end
# 	# end
# end

# # Upload some files
# puts "------- directory.files.create -------"
# if !service.directories.last.nil?
# 	dir = service.directories.last
# 	puts dir
# 	['jmc.log', 'Gemfile'].each do |file|
# 		tmpfile = dir.files.create(key: file, body: File.open(file))
# 		puts tmpfile
# 	end
# end











# puts "-------- service.requests ---------"
# puts service.requests

# puts "------ service.cdn.requests ------"
# puts service.cdn.requests

# puts "----- service.head_containers -----"
# response = service.head_containers
# puts response.status

# puts "------- service.directories -------"
# directories = service.directories
# directories.each do |d|
# 	puts d
# end

# puts "------service.directories.get ------"
# if !directories.first.nil?
# 	puts directories.first 
# 	directories.first.files.each do |file|
# 		puts file
# 		puts file.public_url
# 		puts file.key
# 		File.open("./downloads/rackspace/#{file.key}", 'w') do |f|
# 			directories.first.files.get(file.key) do | data, remaining, content_length |
# 				f.syswrite data
# 			end
# 		end
# 	end
# end

# puts "------- directory.files.create -------"
# if !directories.first.nil?
# 	puts directories.first 
# 	['jmc.log', 'Gemfile'].each do |file|
# 		tmpfile = directories.first.files.create(key: file, body: File.open(file))
# 		puts tmpfile
# 	end
# end






