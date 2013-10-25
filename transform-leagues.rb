#!/Users/jimcar/.rvm/rubies/ruby-2.0.0-p247/bin/ruby -w
#coding:utf-8

require 'net/https'
require "rubygems"
require "json"
require "uri"
require "Nokogiri"
require "./mygem/xmlsoccerhttp/lib/xmlsoccerhttp"

# ---------------------------------------------------
#  Name: transform_leagues
#  Desc: cleanup xmlsoccer.xml 
# ---------------------------------------------------
def transform_leagues(options={})

  localtest = (options[:localtest].nil? or options[:localtest] != true) ? false : true

  unless localtest == true
    puts "Setting up client"
    xmlsoccer_client = XMLsoccerHTTP::RequestManager.new({
      api_key: JSON.parse(File.open('xmlsoccer_config.json').read)['api_key'],
      api_type: "Demo"
    })
    puts "Requesting data for all leagues ..."
    STDOUT.flush
    leagues_xml = Nokogiri::XML(xmlsoccer_client.get_all_leagues.body)
  else
    puts "Reading local data for all leagues ..."
    leagues_xml = Nokogiri::XML(File.open("XML/AllLeagues.xml"))
  end

  league_recs = Array.new
  data_file_recs = Array.new
  
  leagues_xml.xpath("//League").each do |node|

    # Save the XML file for this league
    filename = "xmlsoccer-league-#{node.xpath("Id").text}.xml"
    f = File.open("./XML-FILES/leagues/#{filename}", "w")
    f.puts "<?xml version=\"1.0\" encoding=\"utf-8\"?>"
    f.puts "<FreeFantasyFootball.Info>"
    f.puts "\t<#{node.name}>"
    node.elements.each do |e|
     f.puts "\t\t#{e}"
    end
    f.puts "\t</#{node.name}>"
    f.puts "</FreeFantasyFootball.Info>"
    f.close

    league_recs <<    { league_id:         node.xpath("Id").text,
                        name:              node.xpath("Name").text,
                        country:           node.xpath("Country").text,
                        historical_data:   node.xpath("Historical_Data").text,
                        fixtures:          node.xpath("Fixtures").text,
                        livescore:         node.xpath("Livescore").text,
                        number_of_matches: node.xpath("NumberOfMatches").text,
                        latest_match_date: node.xpath("LatestMatch").text,
                        latest_round:      0,
                        final_round:       0,
                        data_file_id:      0
                      } 

    data_file_recs << { name:      filename,
                        path:      'soccer/leagues',
                        timestamp: `date`.strip
                      } 
  end


  # Save json file for easy upload to data store...
  f = File.open("./JSON-FILES/xmlsoccer-league-data-files.json", "w")
  f.puts '{ "league-data-files": ['
  data_file_recs.each do |record|
    f.puts '{'
    record.each do |k,v|
      my_comma = k == :timestamp ? '' : ','
      f.puts "\"#{k}\":\"#{v}\"#{my_comma}"
    end
    my_comma = record == data_file_recs.last ? '' : ','
    f.puts "}#{my_comma}"
  end
  f.puts '] }'
  f.close

  # Save as json file, for whatever purpose...
  f = File.open("./JSON-FILES/xmlsoccer-leagues.json", "w")
  f.puts '{ "leagues": ['
  league_recs.each do |record|
    f.puts '{'
    record.each do |k,v|
      my_comma = k == :data_file_id ? '' : ','
      f.puts "\"#{k}\":\"#{v}\"#{my_comma}"
    end
    my_comma = record == league_recs.last ? '' : ','
    f.puts "}#{my_comma}"
  end
  f.puts '] }'
  f.close

  # Or...just create the rake file now - DUH!
  if options[:update].nil? or options[:update] != true
    File.open("./RAKE-FILES/create_l1_league_data.rake", "w") do |f|
      f.puts 'namespace :db do'
      f.puts "\tdesc \"Fill database with league data\""
      f.puts "\ttask populate: :environment do"
      f.puts "\t\tif !ENV['create'].nil? and ENV['create'] == 'league'"
      league_recs.each do |record|
        f.puts "\t\t\tLeague.create!("
        record.each do |k,v|
          f.puts "\t\t\t\t\"#{k}\" => \"#{v}\","
        end
        f.puts "\t\t\t)"
      end
      f.puts "\t\tend\n\tend\nend"
    end
  else
    File.open("./RAKE-FILES/update_l1_league_data.rake", "w") do |f|
      f.puts 'namespace :db do'
      f.puts "\tdesc \"Update database with league data\""
      f.puts "\ttask populate: :environment do"
      f.puts "\t\tif !ENV['update'].nil? and ENV['update'] == 'league'"
      league_recs.each do |record|
        f.puts "\t\t\tid = League.find_by(league_id: #{record[:league_id]})"
        f.puts "\t\t\tLeague.update("
        f.puts "\t\t\t\tid,"
        record.each do |k,v|
          next unless k == :latest_match_date
          f.puts "\t\t\t\t#{k}: \"#{v}\","
        end
        f.puts "\t\t\t)"
      end
      f.puts "\t\tend\n\tend\nend"
    end
  end

end

transform_leagues(localtest: true, update: false)
transform_leagues(localtest: true, update: true)

