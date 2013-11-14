# =================================================================================================
#    Simple 'include' file for transform tools
# =================================================================================================

# ----------------------------------------------
#  Id 'standardization' routine
# ----------------------------------------------
@id_str_lengths = { league: 2, team: 3, fixture: 6 }

def standardize_id_str(id, type)
  id_str = id.to_s
  while id_str.length < @id_str_lengths[type] do
    id_str = "0#{id_str}"
  end
  id_str
end

# ----------------------------------------------
#  Return all league_ids
# ----------------------------------------------
def get_league_ids
  xml_data = aws_data_fetch(path: 'soccer/raw-data', name: 'AllLeagues.xml')
  Nokogiri::XML(xml_data).xpath("//League/Id").map { |node| node.text }
end

# ----------------------------------------------
#  Return all team_ids
# ----------------------------------------------
def get_team_ids
  xml_data = aws_data_fetch(path: 'soccer/raw-data', name: 'AllTeams.xml')
  Nokogiri::XML(xml_data).xpath("//Team/Team_Id").map { |node| node.text }
end

# ----------------------------------------------
#  Return all fixture_ids
# ----------------------------------------------
def get_fixture_ids
  fixtures = Array.new
  puts "getting fixtures"
  get_league_ids.each do |league_id|
    next if ['15','34'].include? league_id
    league_id_str = standardize_id_str(league_id, :league)
    puts "... for league #{league_id_str}"

    filename = "Fixtures-league-#{league_id}-1314.xml"
    jmclist = Nokogiri::XML(open("XML-TEST/#{filename}")).xpath("//Match/Id").map { |node| node.text }
    puts "XML LEN: '#{jmclist.length}'"

    filename = "Fixtures-league-#{league_id_str}-1314.xml"
    xml_data = aws_data_fetch(path: 'soccer/raw-data', name: filename)
    jmclist = Nokogiri::XML(xml_data).xpath("//Match/Id").map { |node| node.text }
    puts "AWS LEN: '#{jmclist.length}'"
    fixtures += jmclist
  end
  fixtures
end

# ----------------------------------------------
#  Return all result_ids
# ----------------------------------------------
def get_result_ids
  fixtures = Array.new
  puts "getting results"
  get_league_ids.each do |league_id|
    next if ['15','34'].include? league_id
    league_id_str = standardize_id_str(league_id, :league)
    puts "... for league #{league_id_str}"
    src_dir = 'XML-TEST'
    # JMC filename = "Fixtures-league-#{league_id_str}-1314.xml"
    filename = "HistoricMatches-league-#{league_id}-1314.xml"
    fixtures += Nokogiri::XML(open("#{src_dir}/#{filename}")).xpath("//Match/FixtureMatch_Id").map { |node| node.text }
  end
  fixtures
end


# ----------------------------------------------
#  File creation routines
# ----------------------------------------------

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

def write_nodb_relation_json_file(args)
  rel_type = args[:rel_type] ? args[:rel_type] : 'relation'
  target_dir = "./JSON-NODB"
  filename = "xmlsoccer-#{args[:rel_A]}-#{args[:rel_key_A]}-#{args[:rel_B]}-#{args[:jmc]}-#{rel_type}.json"
  puts "writing #{filename}"
  File.open("#{target_dir}/#{filename}", "w") do |f|
    f.puts "{  \"#{args[:rel_info]}\": ["
    args[:rel_keys_B].each do |v|
      my_comma = v == args[:rel_keys_B].last ? '' : ','
      f.puts "\"#{v}\"#{my_comma}"
    end
    f.puts "]}"
  end
  filename
end

def write_nodb_record_json_file(args)
  target_dir = "./JSON-NODB"
  filename = "xmlsoccer-#{args[:rec_type]}-#{args[:rec_info]}-record.json"
  puts "writing #{filename}"
  File.open("#{target_dir}/#{filename}", "w") do |f|
    f.puts '{'
    args[:rec].each do |k,v|
      my_comma = k == args[:rec].keys.last ? '' : ','
      f.puts "\"#{k}\":\"#{v}\"#{my_comma}"
    end
    f.puts "}"
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
        my_comma = k == rec.keys.last ? '' : ','
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
  target_dir = "./RAKE-FILES"
  filename = "create_#{args[:jmc]}_#{args[:rec_type]}_data-#{args[:ext]}.rake"
  puts "writing #{filename}"
  File.open("#{target_dir}/#{filename}", "w") do |f|
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
  target_dir = "./RAKE-FILES"
  filename = "update_#{args[:jmc]}_#{args[:rec_type]}_data-#{args[:ext]}.rake"
  puts "writing #{filename}"
  File.open("#{target_dir}/#{filename}", "w") do |f|
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
  @s3 = AWS::S3.new
  test_config = JSON.parse(File.open('test_config.json').read)
  bucket_name = test_config['test-bucket-name-aws']
  filename = data_file_rec[:path].nil? ? data_file_rec[:name] : "#{data_file_rec[:path]}/#{data_file_rec[:name]}"
  puts "AWS download: '#{filename}'" if @verbose
  $stdout.flush
  @s3.buckets[bucket_name].objects[filename].read 
end



