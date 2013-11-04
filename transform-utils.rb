#
# simple 'include' file for transform tools
#

def write_xml_file(args)
  target_dir = './XML-FILES'
  filename = "xmlsoccer-#{args[:group]}-#{args[:group_info]}.xml"
  File.open("#{target_dir}/#{args[:group]}s/#{filename}", "w") do |f|
    f.puts "<?xml version=\"1.0\" encoding=\"utf-8\"?>"
    f.puts "<FreeFantasyFootball.Info>"
    f.puts "\t<#{args[:node].name}>"
    args[:node].elements.each do |e|
     f.puts "\t\t#{e}"
    end
    f.puts "\t</#{args[:node].name}>"
    f.puts "</FreeFantasyFootball.Info>"
  end
  filename
end

def write_data_file_json_file(args)
  target_dir = "./JSON-FILES"
  rec_data = args[:rec_data] ? args[:rec_data] : 'data'
  filename = "xmlsoccer-#{args[:rec_type]}s-#{args[:rec_info]}-#{rec_data}-files.json"
  File.open("#{target_dir}/#{filename}", "w") do |f|
    f.puts "{ \"#{args[:rec_type]}-#{rec_data}-files\": ["
    args[:recs].each do |rec|
      f.puts '{'
      rec.each do |k,v|
        my_comma = k == :timestamp ? '' : ','
        f.puts "\"#{k}\":\"#{v}\"#{my_comma}"
      end
      my_comma = rec == args[:recs].last ? '' : ','
      f.puts "}#{my_comma}"
    end
    f.puts '] }'
  end
  filename
end

def write_records_json_file(args)
  target_dir = "./JSON-FILES"
  filename = "xmlsoccer-#{args[:rec_type]}-#{args[:rec_info]}-records.json"
  puts "writing #{filename}"
  File.open("#{target_dir}/#{filename}", "w") do |f|
    f.puts "{ \"#{args[:rec_type]}\" : ["
    args[:recs].each do |rec|
      f.puts '{'
      rec.each do |k,v|
        my_comma = k == :data_file_id ? '' : ','
        f.puts "\"#{k}\":\"#{v}\"#{my_comma}"
      end
      my_comma = rec == args[:recs].last ? '' : ','
      f.puts "}#{my_comma}"
    end
    f.puts '] }'
  end
  filename
end

def write_create_records_rake_file(args)
  File.open("./RAKE-FILES/create_#{args[:jmc]}_#{args[:rec_type]}_data-#{args[:ext]}.rake", "w") do |f|
    f.puts 'namespace :db do'
    f.puts "\tdesc \"#{args[:desc]}\""
    f.puts "\ttask populate: :environment do"
    f.puts "\t\tif !ENV['create'].nil? and ENV['create'] == '#{args[:rec_type]}'"
    args[:recs].each do |rec|
      f.puts "\t\t\t#{args[:rec_class]}.create!("
      rec.each do |k,v|
        f.puts "\t\t\t\t\"#{k}\" => \"#{v}\","
      end
      f.puts "\t\t\t)"
    end
    f.puts "\t\tend\n\tend\nend"
  end
end

def write_update_records_rake_file(args)
  rec_key = args[:rec_key]

  File.open("./RAKE-FILES/update_#{args[:jmc]}_#{args[:rec_type]}_data-#{args[:ext]}.rake", "w") do |f|
    f.puts 'namespace :db do'
    f.puts "\tdesc \"#{args[:desc]}\""
    f.puts "\ttask populate: :environment do"
    f.puts "\t\tif !ENV['update'].nil? and ENV['update'] == '#{args[:rec_type]}'"
    args[:recs].each do |rec|
      f.puts "\t\t\tid = #{args[:rec_class]}.find_by(#{args[:rec_key]}: \"#{rec[:"#{rec_key}"]}\")"

      f.puts "\t\t\tif id"

      f.puts "\t\t\t\t#{args[:rec_class]}.update("
      f.puts "\t\t\t\t\tid,"
      f.puts "\t\t\t\t\t{"
      rec.each do |k,v|
        next if ( "#{k}" == rec_key )
        unless v.kind_of? Array
          f.puts "\t\t\t\t\t\t\"#{k}\" => \"#{v}\","
        else
          f.puts "\t\t\t\t\t\t\"#{k}\" => #{v},"
        end
      end
      f.puts "\t\t\t\t\t},"
      f.puts "\t\t\t\t)"

      f.puts "\t\t\telse"
      f.puts "\t\t\t\tputs \"#{rec[:"#{rec_key}"]}\""
      f.puts "\t\t\tend"
    end
    f.puts "\t\tend\n\tend\nend"
  end
end

# ----------------------------------------------
#  AWS S3 Storage - fetch and store helpers
# ----------------------------------------------

require 'aws-sdk'

def aws_data_fetch(data_file_rec)
  AWS.config(JSON.parse(File.open('aws_config.json').read))
  s3 = AWS::S3.new

  test_config = JSON.parse(File.open('test_config.json').read)
  bucket_name = test_config['test-bucket-name-aws']
  filename = data_file_rec[:path].nil? ? data_file_rec[:name] : "#{data_file_rec[:path]}/#{data_file_rec[:name]}"
  puts "AWS download: '#{filename}'"
  STDOUT.flush
  s3.buckets[bucket_name].objects[filename].read 
end



