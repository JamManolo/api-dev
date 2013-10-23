#!/Users/jimcar/.rvm/rubies/ruby-2.0.0-p247/bin/ruby -w
#coding:utf-8

require 'net/https'
require "rubygems"
require "json"
require "uri"
require "Nokogiri"
require "./mygem/xmlsoccerhttp/lib/xmlsoccerhttp"

# ---------------------------------------------------
#  Name: transform_teams
#  Desc: cleanup xmlsoccer.xml 
# ---------------------------------------------------
def transform_teams(options={})

  localtest = (options[:localtest].nil? or options[:localtest] != true) ? false : true

  unless localtest == true
    puts "Setting up client"
    xmlsoccer_client = XMLsoccerHTTP::RequestManager.new({
      api_key: JSON.parse(File.open('xmlsoccer_config.json').read)['api_key'],
      api_type: "Demo"
    })
    puts "Requesting data for all teams ..."
    STDOUT.flush
    teams_xml = Nokogiri::XML(xmlsoccer_client.get_all_teams.body)
  else
    puts "Reading local data for all teams ..."
    teams_xml = Nokogiri::XML(File.open("XML/AllTeams.xml"))
  end

  team_recs = Array.new
  data_file_recs = Array.new
  
  teams_xml.xpath("//Team").each do |node|

    # Save the XML file for this team
    filename = "xmlsoccer-team-#{node.xpath("Team_Id").text}.xml"
    f = File.open("./XML-FILES/teams/#{filename}", "w")
    f.puts "<?xml version=\"1.0\" encoding=\"utf-8\"?>"
    f.puts "<FreeFantasyFootball.Info>"
    f.puts "\t<#{node.name}>"
    node.elements.each do |e|
     f.puts "\t\t#{e}"
    end
    f.puts "\t</#{node.name}>"
    f.puts "</FreeFantasyFootball.Info>"
    f.close

    team_recs <<      { team_id:       node.xpath("Team_Id").text,
                        name:          node.xpath("Name").text,
                        country:       node.xpath("Country").text,
                        stadium:       node.xpath("Stadium").text,
                        home_page_url: node.xpath("HomePageURL").text,
                        wiki_link:     node.xpath("WIKILink").text,
                        data_file_id:  0
                      } 

    data_file_recs << { name:      filename,
                        path:      'soccer/teams',
                        timestamp: `date`.strip
                      } 
  end

  # Save json file for easy upload to data store...
  f = File.open("./JSON-FILES/xmlsoccer-team-data-files.json", "w")
  f.puts '{ "team-data-files": ['
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
  f = File.open("./JSON-FILES/xmlsoccer-teams.json", "w")
  f.puts '{ "teams": ['
  team_recs.each do |record|
    f.puts '{'
    record.each do |k,v|
      my_comma = k == :data_file_id ? '' : ','
      f.puts "\"#{k}\":\"#{v}\"#{my_comma}"
    end
    my_comma = record == data_file_recs.last ? '' : ','
    f.puts "}#{my_comma}"
  end
  f.puts '] }'
  f.close

  # Or...just create the rake file now - DUH!
  f = File.open("./RAKE-FILES/team_data.rake", "w")
  f.puts 'namespace :db do'
  f.puts "\tdesc \"Fill database with file data\""
  f.puts "\ttask populate: :environment do"
  f.puts "\t\tif ENV['update'].nil?"
  team_recs.each do |record|
    f.puts "\t\t\tTeam.create!("
    record.each do |k,v|
      f.puts "\t\t\t\t\"#{k}\" => \"#{v}\","
    end
    f.puts "\t\t\t)"
  end
  f.puts "\t\tend\n\tend\nend"
  f.close

end

transform_teams(localtest: true)

