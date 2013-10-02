#!/Users/jimcar/.rvm/rubies/ruby-2.0.0-p247/bin/ruby -w
#coding:utf-8

require "aws-sdk"
require "json"

aws_config_keys = JSON.parse(File.open('aws_config.json').read)
AWS.config(aws_config_keys)

# Get an instance of the S3 interface
puts "Getting S3 instance"
s3 = AWS::S3.new

# List the buckets and objects, download all the objects
s3.buckets.each do |bucket|
	puts bucket.name
	bucket.objects.each do |object|
		next if object.key =~ /^logs\//
		puts object.key
		File.open("./jmc.aws.objects/#{object.key}", "wb") do |file|
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
