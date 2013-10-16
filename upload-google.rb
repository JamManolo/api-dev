#!/Users/jimcar/.rvm/rubies/ruby-2.0.0-p247/bin/ruby -w
#coding:utf-8

require 'google/api_client'
require 'json'
require 'httparty'

def gapi_data_store(options={})

  gapi_config = JSON.parse(File.open('gapi_config.json').read)
  service_account_email = gapi_config['service_account_email']
  key_file = gapi_config['key_file']
  key_secret = gapi_config['key_secret']
  client = Google::APIClient.new(application_name: "Soccer App", application_version: "0.1")
  key = Google::APIClient::KeyUtils.load_from_pkcs12(key_file, key_secret)
  client.authorization = Signet::OAuth2::Client.new(
    token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
    audience: 'https://accounts.google.com/o/oauth2/token',
    scope: 'https://www.googleapis.com/auth/devstorage.full_control',
    issuer: service_account_email,
    signing_key: key)
  client.authorization.fetch_access_token!
  storage = client.discovered_api('storage', 'v1beta2')

  test_config = JSON.parse(File.open('test_config.json').read)
  bucket = test_config['test-bucket-name']
  data_file_recs = JSON.parse(File.open('FILES/xmlsoccer-match-db-info.json').read)['items']

  data_file_recs.each do |record|

    upload_file = "#{record['path']}/#{record['name']}"
    media = Google::APIClient::UploadIO.new(upload_file, 'application/x-www-form-urlendoded')
    metadata = {
      'title' => 'My xml file',
      'description' => "It's chock full of data",
    }
    storage_info = client.execute(
      api_method:  storage.objects.insert,
      parameters:  { bucket: bucket, 
                     uploadType: 'resumable',
                     name: upload_file, },
      body_object: metadata,
      media:       media
    )
    upload = storage_info.resumable_upload
    if upload.resumable?
      client.execute(upload)
    end

  	puts "Uploaded #{upload_file} to #{bucket}."
  end

end

gapi_data_store()
