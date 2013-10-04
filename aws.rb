#!/Users/jimcar/.rvm/rubies/ruby-2.0.0-p247/bin/ruby -w
#coding:utf-8

require "aws-sdk"
require "json"

aws_config = JSON.parse(File.open('aws_config.json').read)
AWS.config(aws_config)

# Get an instance of the S3 interface
puts "Getting S3 instance"
s3 = AWS::S3.new

# List the buckets and objects, download all the objects
s3.buckets.each do |bucket|
	puts bucket.name
	bucket.objects.each do |object|
		next if object.key =~ /^logs\//
		puts object.key
		File.open("./downloads/aws/#{object.key}", "wb") do |file|
			object.read do |chunk|
				file.write(chunk)
			end
			file.close
		end
	end
end

# Upload some files
bucket_name = s3.buckets.nil? ? "fff-info-files" : s3.buckets.first.name
upload_files =['jmc.log', 'Gemfile']

upload_files.each do |file_name|
	key = File.basename(file_name)
	puts "Attemptimg to upload file #{file_name} to bucket #{bucket_name}."
	s3.buckets[bucket_name].objects[key].write(:file => file_name)
	puts "Uploaded file #{file_name} to bucket #{bucket_name}."
end


# Now test using Fog

require 'fog'

aws_config = JSON.parse(File.open('aws_config.json').read)

# Get an instance of the Fog/S3 interface
service = Fog::Storage.new({
	provider:              'AWS',
	aws_access_key_id:     aws_config['access_key_id'],
	aws_secret_access_key: aws_config['secret_access_key'],
	region:               'us-west-2',
})

# List the buckets and objects, download all the objects
puts "------service.directories ------"
service.directories.each do |dir|
	puts "KEY = #{dir.key}"
	dir.files.each do |file|
		puts "NAME = #{file.key}"
		next if file.key =~ /^logs\//
		File.open("./downloads/aws-fog/#{file.key}", 'w') do |f|
			dir.files.get(file.key) do | data, remaining, content_length |
				f.syswrite data
			end
		end
	end
end

# Upload some files
puts "------- directory.files.create -------"
if !service.directories.last.nil?
	dir = service.directories.last
	puts dir
	['jmc.log', 'Gemfile'].each do |file|
		tmpfile = dir.files.create(key: file, body: File.open(file))
		puts tmpfile
	end
end






