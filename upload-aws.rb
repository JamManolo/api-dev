#!/Users/jimcar/.rvm/rubies/ruby-2.0.0-p247/bin/ruby -w
#coding:utf-8

require 'aws-sdk'
require 'json'

def aws_data_store(options)

  aws_config = JSON.parse(File.open('aws_config.json').read)
  test_config = JSON.parse(File.open('test_config.json').read)
  data_file_recs = 
    JSON.parse(File.open("JSON-FILES/xmlsoccer-#{options[:data_type]}-data-files.json").read)['match-data-files']

  AWS.config(aws_config)
  s3 = AWS::S3.new

  bucket_name = test_config['test-bucket-name-aws']

  data_file_recs.each do |record|
  	filename = "#{record['path']}/#{record['name']}"
    puts "Attempting to upload: '#{filename}'"
    STDOUT.flush
  	retname = s3.buckets[bucket_name].objects[filename].write(file: filename)
  	puts "Uploaded #{filename} to #{bucket_name}/#{retname.key}."
    STDOUT.flush
  end

end

# data_type can be 'match' or 'fixture'
aws_data_store(data_type: 'match')
