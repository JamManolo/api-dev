#!/Users/jimcar/.rvm/rubies/ruby-2.0.0-p247/bin/ruby -w
#coding:utf-8

require 'json'
require 'fog'

# JMC - initial testing indicates that it's about 3x faster to access S3 directly instead of through fog

def fog_aws_data_store(options={})

	aws_config = JSON.parse(File.open('aws_config.json').read)
  test_config = JSON.parse(File.open('test_config.json').read)
  data_file_recs = JSON.parse(File.open('FILES/xmlsoccer-match-db-info.json').read)['items']

  aws_service = Fog::Storage.new({
  	provider:              'AWS',
  	aws_access_key_id:     aws_config['access_key_id'],
  	aws_secret_access_key: aws_config['secret_access_key'],
  	region: 							 'us-west-2',
  })

  bucket_name = test_config['test-bucket-name']

  aws_service.directories.each do |dir|
  	if dir.key == bucket_name
  		data_file_recs.each do |record|
  			filename = "#{record['path']}/#{record['name']}"
  			retname = dir.files.create(key: filename, body: File.open(filename))
  			puts "Uploaded #{filename} to #{bucket_name}/#{retname.key}."
  		end
			loaded #{filename} to #{bucket_name}/#{retname.key}."
  	end
  end

end

# fog_aws_data_store()

