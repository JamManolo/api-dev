#!/Users/jimcar/.rvm/rubies/ruby-2.0.0-p247/bin/ruby -w
#coding:utf-8

require 'aws-sdk'
require 'json'

def aws_data_store(options={})

  aws_config = JSON.parse(File.open('aws_config.json').read)
  test_config = JSON.parse(File.open('test_config.json').read)
  data_file_recs = JSON.parse(File.open('FILES/xmlsoccer-match-db-info.json').read)['items']

  AWS.config(aws_config)
  s3 = AWS::S3.new

  bucket_name = test_config['test-bucket-name-aws']

  data_file_recs.each do |record|
  	filename = "#{record['path']}/#{record['name']}"
  	retname = s3.buckets[bucket_name].objects[filename].write(file: filename)
  	puts "Uploaded #{filename} to #{bucket_name}/#{retname.key}."
  end

end

aws_data_store()
