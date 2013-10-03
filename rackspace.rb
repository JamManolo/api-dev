#!/Users/jimcar/.rvm/rubies/ruby-2.0.0-p247/bin/ruby -w
#coding:utf-8

require 'fog'
require 'json'

rackspace_config = JSON.parse(File.open('rackspace_config.json').read)

service = Fog::Storage.new({
	provider:          'Rackspace',
	rackspace_username: rackspace_config['username'],
	rackspace_api_key:  rackspace_config['api_key'],
	rackspace_region:   rackspace_config['region'],
	connection_options: {},
})

puts "-------- service.requests ---------"
puts service.requests

puts "------ service.cdn.requests ------"
puts service.cdn.requests

puts "----- service.head_containers -----"
response = service.head_containers
puts response.status

puts "------- service.directories -------"
directories = service.directories
directories.each do |d|
	puts d
end

puts "------service.directories.get ------"
if !directories.first.nil?
	puts directories.first 
	directories.first.files.each do |file|
		puts file
		puts file.public_url
		puts file.key
		File.open("./downloads/rackspace/#{file.key}", 'w') do |f|
			directories.first.files.get(file.key) do | data, remaining, content_length |
				f.syswrite data
			end
		end
	end
end

puts "------- directory.files.create -------"
if !directories.first.nil?
	puts directories.first 
	['jmc.log', 'Gemfile'].each do |file|
		tmpfile = directories.first.files.create(key: file, body: File.open(file))
		puts tmpfile
	end
end






