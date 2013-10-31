#
# simple 'include' file for transform tools
#

def write_xml_file(args)
  filename = "xmlsoccer-#{args[:group]}-#{args[:group_info]}.xml"
  File.open("./XML-FILES/#{args[:group]}s/#{filename}", "w") do |f|
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
  File.open("./JSON-FILES/xmlsoccer-#{args[:rec_type]}s-#{args[:rec_info]}-data-files.json", "w") do |f|
    f.puts "{ \"#{args[:rec_type]}-data-files\": ["
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
end

def write_records_json_file(args)
  File.open("./JSON-FILES/xmlsoccer-#{args[:rec_type]}-#{args[:rec_info]}-records.json", "w") do |f|
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
      f.puts "\t\t\t#{args[:rec_class]}.update("
      f.puts "\t\t\t\tid,"
      f.puts "\t\t\t\t{"
      rec.each do |k,v|
        next if ( "#{k}" == rec_key )
        unless v.kind_of? Array
          f.puts "\t\t\t\t\t\"#{k}\" => \"#{v}\","
        else
          f.puts "\t\t\t\t\t\"#{k}\" => #{v},"
        end
      end
      f.puts "\t\t\t\t},"
      f.puts "\t\t\t)"
    end
    f.puts "\t\tend\n\tend\nend"
  end
end





