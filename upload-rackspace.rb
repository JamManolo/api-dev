#!/Users/jimcar/.rvm/rubies/ruby-2.0.0-p247/bin/ruby -w
#coding:utf-8

require 'fog'
require 'json'


def rackspace_data_store(record={})

  rackspace_config = JSON.parse(File.open('rackspace_config.json').read)
  test_config = JSON.parse(File.open('test_config.json').read)

  rackspace_service = Fog::Storage.new({
    provider:          'Rackspace',
    rackspace_username: rackspace_config['username'],
    rackspace_api_key:  rackspace_config['api_key'],
    rackspace_region:   rackspace_config['region'],
    connection_options: {},
  })

  bucket_name = test_config['test-bucket-name']
  data_file_recs = JSON.parse(File.open('FILES/xmlsoccer-match-db-info.json').read)['items']
  directories = rackspace_service.directories
  data_file_recs.each do |record|
  	filename = "#{record['path']}/#{record['name']}"
    retname = directories.first.files.create(
      key: filename, body: File.open(filename
    ))
  	puts "Uploaded #{filename} to #{bucket_name}/#{retname.key}."
    STDOUT.flush
  end

end

rackspace_data_store()
