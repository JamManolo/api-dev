module SoccerStatsHelper

  # ----------------------------------------------
  #  AWS S3 Storage - fetch and store helpers
  # ----------------------------------------------

	def aws_data_fetch(data_file_rec)
	  AWS.config(JSON.parse(File.open('aws_config.json').read))
	  s3 = AWS::S3.new

    test_config = JSON.parse(File.open('test_config.json').read)
	  bucket_name = test_config['test-bucket-name-aws']
  	filename = data_file_rec[:path].nil? ? data_file_rec[:name] : "#{data_file_rec[:path]}/#{data_file_rec[:name]}"
    logger.debug "AWS download: '#{filename}'"
    s3.buckets[bucket_name].objects[filename].read 
	end

	def aws_data_store(data_file_rec={})
    AWS.config(JSON.parse(File.open('aws_config.json').read))
    s3 = AWS::S3.new

	  test_config = JSON.parse(File.open('test_config.json').read)
	  bucket_name = test_config['test-bucket-name-aws']
  	filename = "#{data_file_rec[:path]}/#{data_file_rec[:name]}"
  	retname = s3.buckets[bucket_name].objects[filename].write(file: filename)
  	logger.debug "Uploaded #{filename} to #{bucket_name}/#{retname.key}."
	end

  # ---------------------------------------------------
  #  Rackspace Cloud Storage - fetch helper
  # ---------------------------------------------------
  # require 'fog'

  # def rackspace_data_fetch(data_file_rec)
  #   rackspace_config = JSON.parse(File.open('rackspace_config.json').read)
  #   rackspace_service = Fog::Storage.new({
  #     provider:          'Rackspace',
  #     rackspace_username: rackspace_config['username'],
  #     rackspace_api_key:  rackspace_config['api_key'],
  #     rackspace_region:   rackspace_config['region'],
  #     connection_options: {},
  #   })

  #   filename = "#{data_file_rec[:path]}/#{data_file_rec[:name]}"
  #   directories = rackspace_service.directories
  #   File.open("./downloads/rackspace/#{filename}", "w") do |f|
  #     directories.first.files.get(filename) do |data, remaining, content_length|
  #       f.syswrite data
  #     end
  #   end
  #   File.open("./downloads/rackspace/#{filename}").read
  # end

  # ------------------------------------------------
  #  Google Cloud Storage - fetch helper
  # ------------------------------------------------
  require 'google/api_client'

  def gapi_data_fetch(data_file_rec)

    gapi_config = JSON.parse(File.open('gapi_config.json').read)
    client = Google::APIClient.new(application_name: "Soccer App", application_version: "0.1")
    key = Google::APIClient::KeyUtils.load_from_pkcs12(
      gapi_config['key_file'], gapi_config['key_secret']
    )
    client.authorization = Signet::OAuth2::Client.new(
      token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
      audience: 'https://accounts.google.com/o/oauth2/token',
      scope: 'https://www.googleapis.com/auth/devstorage.full_control',
      issuer: gapi_config['service_account_email'],
      signing_key: key)
    client.authorization.fetch_access_token!
    storage = client.discovered_api('storage', 'v1beta2')

    test_config = JSON.parse(File.open('test_config.json').read)
    bucket = test_config['test-bucket-name']
    filename = "#{data_file_rec[:path]}/#{data_file_rec[:name]}"

    # Get the metadata for a particular object
    object_info = client.execute(:api_method => storage.objects.get, :parameters => { 
      bucket: bucket,
      object: filename,
      alt:    "media",
    })

    # Use HTTParty to download the object - but there's got to be a better way!
    logger.debug "----- Just HTTParty Hard! -----"
    url = object_info.response.env[:response_headers]['location']
    token = "Bearer #{object_info.request.authorization.access_token}"
    HTTParty.get(url, headers: {"Authorization" => token}).response.body
  end

end
