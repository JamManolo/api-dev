#!/Users/jimcar/.rvm/rubies/ruby-2.0.0-p247/bin/ruby -w
#coding:utf-8

require 'aws-sdk'
require 'json'
require 'nokogiri'

# -------------------------------------------------
#  Name: aws_data_store
#  Desc: upload files to s3
#        data_type can be 'match' or 'fixture'
# -------------------------------------------------
def aws_data_store(options)

  data_type = options[:data_type]
  league_id = options[:league_id]

  aws_config = JSON.parse(File.open('aws_config.json').read)
  test_config = JSON.parse(File.open('test_config.json').read)
  data_file_recs = 
    JSON.parse(File.open("JSON-FILES/xmlsoccer-#{data_type}-data-files-#{league_id}.json").read)['match-data-files']

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

def upload_driver

  xml_doc = Nokogiri::XML(open("./XML/AllLeagues.xml"))
  league_ids = xml_doc.xpath("//League/Id").map { |node| node.text }

  league_ids.each do |league_id|
    aws_data_store(data_type: 'match', league_id: league_id)
  end

end

upload_driver


