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
  src_dir   = options[:src_dir]   ? options[:src_dir]   : 'XML'

  if use_ds == true
    puts "Fetching 'All Leagues' info from production data store ..."
    leagues_xml = Nokogiri::XML(aws_data_fetch({
      name: 'AllLeagues.xml',
      path: 'soccer/raw-data',
    }))
  elsif localtest == true
    puts "Reading local data for all leagues ..."
    leagues_xml = Nokogiri::XML(File.open("#{src_dir}/AllLeagues.xml"))
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
  jmc_recs = Array.new

  leagues_xml.xpath("//League").each do |node|

    ["Historical_Data", "Fixtures", "Livescore"].each do |key|
      node.xpath(key).first.content = node.xpath(key).text == 'false' ? false : true
    end

    league_id = node.xpath("Id").text
    # league_id_str = league_id.to_i < 10 ? "0#{league_id}" : league_id
    league_id_str = standardize_id_str(league_id, :league)

    filename = write_xml_file({
      group: 'league',
      group_info: league_id_str,
      node: node,
    })

    data_file_recs << { name:      filename,
                        path:      'soccer/leagues',
                        timestamp: `date`.strip
                      } 

    league_recs <<    { league_id:         league_id,
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

    # Save this record as json file, for noDB
    filename = write_nodb_record_json_file({
      rec_type: 'leagues',
      rec_info: "#{league_id_str}-create-a1",
      rec: league_recs.last,
    })
    jmc_recs << { name: filename, path: 'soccer/nodb', timestamp: `date`.strip, }

    update_recs <<    { league_id:         node.xpath("Id").text,
                        latest_match_date: node.xpath("LatestMatch").text,
                      }

    # Save this record as json file, for noDB
    filename = write_nodb_record_json_file({
      rec_type: 'leagues',
      rec_info: "#{league_id_str}-update-a1",
      rec: update_recs.last,
    })
    jmc_recs << { name: filename, path: 'soccer/nodb', timestamp: `date`.strip, }

  end # leagues.each

  # Save json file for easy upload of xml files to data store...
  write_upload_list_json_file({
    rec_type: 'league',
    rec_info: 'all',
    rec_data: 'xml',
    recs: data_file_recs,
  })

  # Save as json file, for noDB
  filename = write_record_array_json_file({
    rec_type: 'leagues',
    rec_info: 'all-create-a1',
    recs: league_recs,
  })
  jmc_recs << { name: filename, path: 'soccer/nodb', timestamp: `date`.strip, }

  # # Save json file for easy upload of noDB json files to data store...
  # write_upload_list_json_file({
  #   rec_type: "league",
  #   rec_info: 'all',
  #   rec_data: 'nodb',
  #   recs: [ { name: filename, path: 'soccer/nodb', timestamp: `date`.strip, } ]
  # })

  # Save as json file, for noDB
  filename = write_record_array_json_file({
    rec_type: 'leagues',
    rec_info: 'all-update-a1',
    recs: update_recs,
  })
  jmc_recs << { name: filename, path: 'soccer/nodb', timestamp: `date`.strip, }

  # Save json file for easy upload of noDB json files to data store...
  write_upload_list_json_file({
    rec_type: "league",
    rec_info: 'all',
    rec_data: 'nodb',
    recs: jmc_recs
  })

  # Or...just create the rake file now - DUH!
  # if options[:update] and options[:update] == true
    write_update_records_rake_file({
      rec_class: 'League',
      rec_type: 'league',
      rec_key: 'league_id',
      desc: 'Update database with league data',
      recs: update_recs,
      jmc: 'a1',
      ext: 'all',
    })
  # else
    write_create_records_rake_file({
      rec_class: 'League',
      rec_type: 'league',
      desc: 'Fill database with league data',
      recs: league_recs,
      jmc: 'a1',
      ext: 'all',
    })
  # end

end

transform_leagues(localtest: true, update: false, use_ds: true, src_dir: './XML-RAW')
# transform_leagues(localtest: true, update: true, src_dir: './XML-RAW')

