#!/Users/jimcar/.rvm/rubies/ruby-2.0.0-p247/bin/ruby -w
#coding:utf-8

require 'net/https'
require "rubygems"
require "json"
require "uri"
require "Nokogiri"
require "./mygem/xmlsoccerhttp/lib/xmlsoccerhttp"
require "./transform-utils"
require "./xmlsoccer-league-map"

# ---------------------------------------------------
#  Name: transform_all_teams
#  Desc: cleanup xmlsoccer.xml 
# ---------------------------------------------------
def transform_all_teams(options={})

  use_ds    = options[:use_ds]    ? options[:use_ds]    : false
  localtest = options[:localtest] ? options[:localtest] : false
  src_dir   = options[:src_dir]   ? options[:src_dir]   : 'XML'

  if use_ds == true
      puts "Fetching 'All Teams' info from production data store ..."
      teams_xml = Nokogiri::XML(aws_data_fetch({
        name: "AllTeams.xml",
        path: 'soccer/raw-data',
      }))
  elsif localtest == true
    puts "Reading local data for all teams ..."
    teams_xml = Nokogiri::XML(File.open("#{src_dir}/AllTeams.xml"))
  else
    puts "Setting up client"
    xmlsoccer_client = XMLsoccerHTTP::RequestManager.new({
      api_key: JSON.parse(File.open('xmlsoccer_config.json').read)['api_key'],
      api_type: "Demo"
    })
    puts "Requesting data for all teams ..."
    STDOUT.flush
    teams_xml = Nokogiri::XML(xmlsoccer_client.get_all_teams.body)
  end
    
  team_recs = Array.new
  data_file_recs = Array.new
  nodb_file_recs = Array.new 
  all_team_ids = Array.new
  
  teams_xml.xpath("//Team").each do |node|

    # Handle known bad data for Ukranian League stadium (league_id: 40)
    if node.xpath("Stadium").text == '"Avanhard" Stadium'
      node.xpath("Stadium").first.content = 'Avanhard Stadium'
    end

    # Handle known bad data for Bundesliga (Leverkusen)
    if node.xpath("HomePageURL").text == 'BayArena'
      node.xpath("HomePageURL").first.content = node.xpath("Stadium").text
      node.xpath("Stadium").first.content = 'BayArena'
    end

    # Handle shittle situation
    if node.xpath("Team_Id").text == "579"
      node.xpath("Name").first.content = "Shittle Flounders FC"
    end

    # 'standardize' the team_id string
    # team_id_str = node.xpath("Team_Id").text
    # team_id_str = team_id_str.to_i < 100 ? "0#{team_id_str}" : team_id_str
    # team_id_str = team_id_str.to_i < 10  ? "0#{team_id_str}" : team_id_str
    team_id_str = standardize_id_str(node.xpath("Team_Id").text, :team)

    # Add team_id to all teams array
    all_team_ids << team_id_str

    # Save updated XML file for this team (node)
    filename = write_xml_file({
      group: 'team',
      group_info: team_id_str,
      node: node,
    })

    # Collects records for writing json and rake files
    team_recs <<      { team_id:       node.xpath("Team_Id").text,
                        name:          node.xpath("Name").text,
                        league:        "Unknown",
                        league_id:     0,
                        country:       node.xpath("Country").text,
                        stadium:       node.xpath("Stadium").text,
                        home_page_url: node.xpath("HomePageURL").text,
                        wiki_link:     node.xpath("WIKILink").text,
                        data_file_id:  0
                      } 

    # Save this record as json file, for noDB
    filename = write_nodb_record_json_file({
      rec_type: 'teams',
      rec_info: "#{team_id_str}-create-t1",
      rec: team_recs.last,
    })
    nodb_file_recs << { name: filename, path: 'soccer/nodb', timestamp: `date`.strip, }                  

    data_file_recs << { name:      filename,
                        path:      'soccer/teams',
                        timestamp: `date`.strip
                      } 

  end # xml_teams.each

  # Save json file for handy all-teams list
  # (use :rel_type to specify this is actually a list)
  filename = write_nodb_relation_json_file({
    rel_A:     'teams',
    rel_B:     'teams',
    rel_info:  'all-team-ids',
    rel_key_A:  'all',
    rel_keys_B: all_team_ids.sort,
    rel_type:   'list',
    jmc:        't1',
  })
  # nodb_file_recs << { name: filename, path: 'soccer/nodb', timestamp: `date`.strip, }

  # Save json file for easy upload of xml files to data store...
  write_data_file_json_file({
    rec_type: 'team',
    rec_data: 'xml',
    rec_info: 'all',
    recs: data_file_recs
  })
  
  # Save as json file, for noDB
  filename = write_records_json_file({
    rec_type: 'teams',
    rec_info: 'all-create-t1',
    recs: team_recs
  })

  # Save json file for easy upload of json noDB files to data store...
  write_data_file_json_file({
    rec_type: "team",
    rec_info: 'all',
    rec_data: 'nodb',
    recs: [ { name: filename, path: 'soccer/nodb', timestamp: `date`.strip, } ]
  })

  # Or...just create the rake file now - DUH!
  write_create_records_rake_file({
    rec_class: 'Team',
    rec_type: 'team',
    desc: 'Fill database with team data',
    recs: team_recs,
    jmc: 't1',
    ext: 'all',
  })

end

transform_all_teams(localtest: true, use_ds: true, src_dir: 'XML-RAW')


