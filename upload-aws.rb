#!/Users/jimcar/.rvm/rubies/ruby-2.0.0-p247/bin/ruby -w
#coding:utf-8

require 'aws-sdk'
require 'json'
require 'nokogiri'
require './massively_confusing_file_hash'

# -------------------------------------------------
#  Name: upload_files
#  Desc: upload files to s3 
#        data_file_recs : array of records
# -------------------------------------------------
def upload_files(data_file_recs)
  test_config = JSON.parse(File.open('test_config.json').read)
  bucket_name = test_config['test-bucket-name-aws']

  aws_config = JSON.parse(File.open('aws_config.json').read)
  AWS.config(aws_config)
  s3 = AWS::S3.new

  $stderr.reopen("jmc_errorlog.txt", "w")
  total = data_file_recs.length
  count = 1

  data_file_recs.each do |record|
    filename = "#{record['path']}/#{record['name']}"
    puts "Attempting to upload: '#{filename}'"
    STDOUT.flush
    retname = s3.buckets[bucket_name].objects[filename].write(file: filename)
    puts "Uploaded file # #{count}/#{total} to #{bucket_name}/#{retname.key}."
    STDOUT.flush
    count += 1
  end
end

# Support stuff - @lids = array of league_id_str
@src_dir = './JSON-FILES'
@lids = [ '01', '02', '03', '04', '05', '06', '07', '08', '09', '10',
          '11', '12',       '14',       '16', '17', '18', '19', '20',
                      '33',       '35', '36', '37', '38', '39', '40', '41' ]

@xml_data_types  = ['league', 'team-all', 'team', 'fixture',]
@nodb_data_types = ['league', 'team-all', 'team', 'fixture', 'result',]


# -------------------------------------------------
#  Name: upload_source_files
# -------------------------------------------------
def upload_source_files
  data_file_recs = Array.new
  info = @massively_confusing_file_hash['source-xml']
  filename = "#{@src_dir}/xmlsoccer-#{info[:name_str]}-#{info[:group]}-#{info[:file_type]}-files.json"
  data_file_recs += JSON.parse(File.open(filename).read)["#{info[:data_type]}-#{info[:file_type]}-files"]
  upload_files(data_file_recs)
end

# -------------------------------------------------
#  Name: upload_application_files
# -------------------------------------------------
def upload_application_files
  data_file_recs = Array.new
  info = @massively_confusing_file_hash['result-xml']
  if info[:group] == 'lid'
    @lids.each do |lid|
      filename = "#{@src_dir}/xmlsoccer-#{info[:name_str]}-#{lid}-#{info[:file_type]}-files.json"
      data_file_recs += JSON.parse(File.open(filename).read)["#{info[:data_type]}-#{info[:file_type]}-files"]
    end
  else
    filename = "#{@src_dir}/xmlsoccer-#{info[:name_str]}-#{info[:group]}-#{info[:file_type]}-files.json"
    data_file_recs += JSON.parse(File.open(filename).read)["#{info[:data_type]}-#{info[:file_type]}-files"]
  end
  upload_files(data_file_recs)
end

# -------------------------------------------------
#  Name: upload_extraneous_xml_files
# -------------------------------------------------
def upload_extraneous_xml_files
  data_file_recs = Array.new
  @xml_data_types.each do |data_type|
    info = @massively_confusing_file_hash["#{data_type}-xml"]
    if info[:group] == 'lid'
      @lids.each do |lid|
        filename = "#{@src_dir}/xmlsoccer-#{info[:name_str]}-#{lid}-#{info[:file_type]}-files.json"
        data_file_recs += JSON.parse(File.open(filename).read)["#{info[:data_type]}-#{info[:file_type]}-files"]
      end
    else
      filename = "#{@src_dir}/xmlsoccer-#{info[:name_str]}-#{info[:group]}-#{info[:file_type]}-files.json"
      data_file_recs += JSON.parse(File.open(filename).read)["#{info[:data_type]}-#{info[:file_type]}-files"]
    end
  end
  upload_files(data_file_recs)
end

# -------------------------------------------------
#  Name: upload_nodb_files
# -------------------------------------------------
def upload_nodb_files
  data_file_recs = Array.new
  @nodb_data_types.each do |data_type|
    info = @massively_confusing_file_hash["#{data_type}-nodb"]
    filename = "#{@src_dir}/xmlsoccer-#{info[:name_str]}-#{info[:group]}-#{info[:file_type]}-files.json"
    data_file_recs += JSON.parse(File.open(filename).read)["#{info[:data_type]}-#{info[:file_type]}-files"]
  end
  upload_files(data_file_recs)
end

# upload_source_files
# upload_application_files
upload_extraneous_xml_files
# upload_nodb_files


