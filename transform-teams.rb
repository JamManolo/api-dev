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

def transform_all_teams_by_league(options={})

  localtest = (options[:localtest].nil? or options[:localtest] != true) ? false : true
  season = '1314'

  unless localtest == true
    puts "Setting up client"
    xmlsoccer_client = XMLsoccerHTTP::RequestManager.new({
      api_key: JSON.parse(File.open('xmlsoccer_config.json').read)['api_key'],
      api_type: "Full"
    })
  end

  xml_doc = Nokogiri::XML(open("./XML/AllLeagues.xml"))
  league_ids = xml_doc.xpath("//League/Id").map { |node| node.text }
  # Testing for 'competitions leagues'
  # league_ids = [ "16", "17", "35" ]

  comp_recs = Array.new

  league_ids.each do |league_id|

    unless localtest == true
      puts "Requesting data for league #{league_id} ..."
      STDOUT.flush
      team_xml = 
        Nokogiri::XML(xmlsoccer_client.get_all_teams_by_league_and_season(league_id, season).body)
    else
      puts "Reading local data for league #{league_id} ..."
      teams_xml = Nokogiri::XML(File.open("XML-NEW/Teams-league-#{league_id}-#{season}.xml"))
    end
    teams_xml.xpath("//XMLSOCCER.COM").first.add_namespace_definition(nil, "http://xmlsoccer.com/Team")
    namespace = 'xmlns:'

    team_recs = Array.new
    data_file_recs = Array.new
    update_recs = Array.new
    jmc_hashish = Hash.new
    
    teams_xml.xpath("//#{namespace}Team").each do |node|

      # Handle known bad data for Ukranian League stadium (league_id: 40)
      if league_id == "40" and node.xpath("#{namespace}Stadium").text == '"Avanhard" Stadium'
        node.xpath("#{namespace}Stadium").first.content = 'Avanhard Stadium'
      end

      # Add league information, separating competitions from domestic leagues
      # Collect records for writing rake update files
      is_competition = ["15", "16", "17", "34", "35"].include?(league_id) ? true : false
      if is_competition == true
        node.add_child("<Competition>#{@xmlsoccer_league_map[league_id]}</Competition>")
        node.add_child("<Competition_Id>#{league_id}</Competition_Id>")

        team_id = node.xpath("#{namespace}Team_Id").text
        competitions = node.xpath("#{namespace}Competition_Id").text
        comp_recs << {
          team_id:      node.xpath("#{namespace}Team_Id").text,
          competitions: node.xpath("#{namespace}Competition_Id").text,
        }
        if jmc_hashish[team_id].nil?
          jmc_hashish[team_id] = Array.new()
          jmc_hashish[team_id] << competitions
        else
          jmc_hashish[team_id] << competitions
        end
      else
        node.add_child("<League>#{@xmlsoccer_league_map[league_id]}</League>")
        node.add_child("<League_Id>#{league_id}</League_Id>")
        update_recs << {
          team_id:   node.xpath("#{namespace}Team_Id").text,
          league:    node.xpath("#{namespace}League").text,
          league_id: node.xpath("#{namespace}League_Id").text,
        }
      end

      # Save updated XML file for this team (node)
      filename = write_xml_file({
        group: 'team',
        group_info: node.xpath("#{namespace}Team_Id").text,
        node: node,
      })

      # Collect for writing json upload file
      data_file_recs << {
        name:      filename,
        path:      'soccer/teams',
        timestamp: `date`.strip
      } 

      # Collect for writing json record file
      team_recs << {
        team_id:        node.xpath("#{namespace}Team_Id").text,
        league:         node.xpath("#{namespace}League").text,
        league_id:      node.xpath("#{namespace}League_Id").text,
        competition:    node.xpath("#{namespace}Competition").text,
        competition_id: node.xpath("#{namespace}Competition_Id").text,
        country:        node.xpath("#{namespace}Country").text,
        stadium:        node.xpath("#{namespace}Stadium").text,
        home_page_url:  node.xpath("#{namespace}HomePageURL").text,
        wiki_link:      node.xpath("#{namespace}WIKILink").text,
        data_file_id:   0
      }
      
    end # team_nodes.each

    # Save json file for easy upload to data store...
    write_data_file_json_file({
      rec_type: "team",
      rec_info: "#{league_id}",
      recs: data_file_recs
    })
    
    # Save as json file, for whatever purpose...
    write_records_json_file({
      rec_type: "teams",
      rec_info: "#{league_id}",
      recs: team_recs
    })

    # Or...just create the rake file now - DUH!
    write_update_records_rake_file({
      rec_class: 'Team',
      rec_type: 'team',
      rec_key: 'team_id',
      desc: 'Update database with team data',
      recs: update_recs,
      jmc: 't1',
      ext: league_id,
    })

  end # league_ids.each

  # Output the competitions rake file
  jmc_hash = Hash.new
  comp_recs.each do |rec|
    puts "REC: '#{rec}'"
    STDOUT.flush
    team_id = rec[:team_id]
    if jmc_hash[team_id].nil?
      jmc_hash[team_id] = Array.new()
      jmc_hash[rec[:team_id]] << rec[:competitions]
    else
      jmc_hash[rec[:team_id]] << rec[:competitions]
    end
    puts "     '#{jmc_hash[team_id]}'"
  end

  competitions_recs = Array.new
  jmc_hash.each do |k,v|
    competitions_recs << { team_id: k, competitions: v }
  end

  puts "Writing write_update_records_rake_file"
  STDOUT.flush
  write_update_records_rake_file({
    rec_class: 'Team',
    rec_type: 'team',
    rec_key: 'team_id',
    desc: 'Update database with team competitions data',
    recs: competitions_recs,
    jmc: 't2',
    ext: 'all',
  })

end

# transform_teams_by_league(localtest: true)

# ---------------------------------------------------
#  Name: transform_all_teams
#  Desc: cleanup xmlsoccer.xml 
# ---------------------------------------------------
def transform_all_teams(options={})

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

    # Handle known bad data for Ukranian League stadium (league_id: 40)
    if node.xpath("Stadium").text == '"Avanhard" Stadium'
      node.xpath("Stadium").first.content = 'Avanhard Stadium'
    end

    # Save updated XML file for this team (node)
    filename = write_xml_file({
      group: 'team',
      group_info: node.xpath("Team_Id").text,
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

    data_file_recs << { name:      filename,
                        path:      'soccer/teams',
                        timestamp: `date`.strip
                      } 
  end

  # Save json file for easy upload to data store...
  write_data_file_json_file({
    rec_type: 'team',
    recs: data_file_recs
  })
  
  # Save as json file, for whatever purpose...
  write_records_json_file({
    rec_type: 'teams',
    recs: team_recs
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

# transform_all_teams(localtest: true)
transform_all_teams_by_league(localtest: true)


