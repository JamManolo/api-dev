#!/Users/jimcar/.rvm/rubies/ruby-2.0.0-p247/bin/ruby -w
#coding:utf-8

require 'net/https'
require "rubygems"
require "json"
require "uri"
require "Nokogiri"
require "./mygem/xmlsoccerhttp/lib/xmlsoccerhttp"
require "./transform-utils"

# ---------------------------------------------------
#  Name: transform_leagues
#  Desc: cleanup xmlsoccer.xml 
# ---------------------------------------------------
def transform_leagues(options={})

  localtest = options[:localtest] ? options[:localtest] : false
  use_ds    = options[:use_ds]    ? options[:use_ds]    : false

  if localtest == true
    puts "Reading local data for all leagues ..."
    leagues_xml = Nokogiri::XML(File.open("XML/AllLeagues.xml"))
  elsif use_ds == true
    leagues_xml = Nokogiri::XML(open(aws_data_fetch({
      name: 'AllLeagues.xml',
      path: 'soccer/raw-data',
    })))
  else
    puts "Setting up client"
    xmlsoccer_client = XMLsoccerHTTP::RequestManager.new({
      api_key: JSON.parse(File.open('xmlsoccer_config.json').read)['api_key'],
      api_type: "Full"
    })
    puts "Requesting data for all leagues ..."
    STDOUT.flush
    leagues_xml = Nokogiri::XML(xmlsoccer_client.get_all_leagues.body)
  end

  league_recs = Array.new
  update_recs = Array.new
  data_file_recs = Array.new
  
  leagues_xml.xpath("//League").each do |node|

    ["Historical_Data", "Fixtures", "Livescore"].each do |key|
      node.xpath(key).first.content = node.xpath(key).text == 'false' ? false : true
    end

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

    update_recs <<    { league_id:         node.xpath("Id").text,
                        latest_match_date: node.xpath("LatestMatch").text,
                      }                 

    data_file_recs << { name:      filename,
                        path:      'soccer/leagues',
                        timestamp: `date`.strip
                      } 
  end # leagues.each

  write_data_file_json_file({
    rec_type: 'league',
    rec_info: 'all',
    recs: data_file_recs,
  })

  write_records_json_file({
    rec_type: 'leagues',
    rec_info: 'all',
    recs: league_recs,
  })

  # Or...just create the rake file now - DUH!
  if options[:update] and options[:update] == true
    write_update_records_rake_file({
      rec_class: 'League',
      rec_type: 'league',
      rec_key: 'league_id',
      desc: 'Update database with league data',
      recs: update_recs,
      jmc: 'a1',
      ext: 'all',
    })
  else
    write_create_records_rake_file({
      rec_class: 'League',
      rec_type: 'league',
      desc: 'Fill database with league data',
      recs: league_recs,
      jmc: 'a1',
      ext: 'all',
    })
  end

end

transform_leagues(localtest: true, update: false)
transform_leagues(localtest: true, update: true)

