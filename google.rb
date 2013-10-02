#!/Users/jimcar/.rvm/rubies/ruby-2.0.0-p247/bin/ruby -w
#coding:utf-8

# Inspired by https://gist.github.com/3166610
require 'google/api_client'
require 'json'
require 'httparty'

# Set test flags
test_bucket_get = true      # storage-bucket-list, storage-bucket_get
test_object_get = true      # storage-object-list, storage-object-get
test_object_insert = true   # storage-object-insert

# Email of service account
service_account_email = "765280027324-l4aq4o9r9pkk6bjtn8m0dgolkfo0v30j@developer.gserviceaccount.com" 
key_file = 'privatekey.p12' # File containing your private key
key_secret = 'notasecret'   # Password to unlock private key

client = Google::APIClient.new(application_name: "Soccer App", application_version: "0.1")

# Load our credentials for the service account
key = Google::APIClient::KeyUtils.load_from_pkcs12(key_file, key_secret)
client.authorization = Signet::OAuth2::Client.new(
  :token_credential_uri => 'https://accounts.google.com/o/oauth2/token',
  :audience => 'https://accounts.google.com/o/oauth2/token',
  :scope => 'https://www.googleapis.com/auth/devstorage.full_control',
  :issuer => service_account_email,
  :signing_key => key)

# Request a token for our service account
client.authorization.fetch_access_token!

# Discover the Cloud Storage API
storage = client.discovered_api('storage', 'v1beta2')

# Identify our project space
project = "free-fantasy-football-info"

# ==============================================
#  Name: test_bucket_get
# ==============================================
if test_bucket_get == true

  bucket_list = client.execute(:api_method => storage.buckets.list, :parameters => { 
    project: project,
  })

  buckets = JSON.parse bucket_list.body

  buckets['items'].each do |bucket|
    bucket_info = client.execute(api_method: storage.buckets.get, parameters: {
      bucket: bucket['name']
    })
  end
end

# Use bucket from test_get_bucket for object tests, if available
bucket = buckets.nil? ? "fff-info-files" : buckets['items'].first['name']

# ==============================================
#  Name: test_object_get
# ==============================================

if test_object_get == true

  # Get the metadata for the objects in our bucket
  object_list = client.execute(:api_method => storage.objects.list, :parameters => { 
    bucket: bucket,
  })

  objects = JSON.parse object_list.body

  objects['items'].each do |object|
    # Get the metadata for a particular object
    object_info = client.execute(:api_method => storage.objects.get, :parameters => { 
      bucket: bucket,
      object: object['name'],
      alt:    "media",
    })

    # Use HTTParty to download the object - but there's got to be a better way!
    puts "----- Just HTTParty Hard! -----"
    url = object_info.response.env[:response_headers]['location']
    token = "Bearer #{object_info.request.authorization.access_token}"
    data = HTTParty.get(url, headers: {"Authorization" => token})
    f = File.open("./jmc.objects/#{object['name']}", "w")
    f.puts data
    f.close
  end

end

# ==============================================
#  Name: test_object_insert
# ==============================================
if test_object_insert

  media = Google::APIClient::UploadIO.new('jmc.log', 'text/plain')
  metadata = {
    'title' => 'My log file',
    'descrription' => 'It tells the story',
  }

  storage_info = client.execute(
    api_method:  storage.objects.insert,
    parameters:  { bucket: "fff-info-files", 
                   uploadType: 'resumable',
                   name: "jmc.log", },
    body_object: metadata,
    media:       media
  )

  upload = storage_info.resumable_upload
  if upload.resumable?
    client.execute(upload)
  end
end



