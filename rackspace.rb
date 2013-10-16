#!/Users/jimcar/.rvm/rubies/ruby-2.0.0-p247/bin/ruby -w
#coding:utf-8

require 'fog'
require 'json'

rackspace_config = JSON.parse(File.open('rackspace_config.json').read)

rackspace_service = Fog::Storage.new({
	provider:          'Rackspace',
	rackspace_username: rackspace_config['username'],
	rackspace_api_key:  rackspace_config['api_key'],
	rackspace_region:   rackspace_config['region'],
	connection_options: {},
})

puts "-------- rackspace_service.requests ---------"
puts rackspace_service.requests

puts "------ rackspace_service.cdn.requests ------"
puts rackspace_service.cdn.requests

puts "----- rackspace_service.head_containers -----"
response = rackspace_service.head_containers
puts response.status

puts "------- rackspace_service.directories -------"
directories = rackspace_service.directories
directories.each do |d|
	puts d.key
end

puts "------rackspace_service.directories.get ------"
if !directories.first.nil?
	puts directories.first.key
	directories.first.files.each do |file|
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
	puts directories.first.key
	['jmc.log', 'Gemfile'].each do |file|
		tmpfile = directories.first.files.create(key: file, body: File.open(file))
		puts tmpfile.key
	end
end






