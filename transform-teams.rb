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

  use_ds    = options[:use_ds]    ? options[:use_ds]    : false
  localtest = options[:localtest] ? options[:localtest] : false
  src_dir   = options[:src_dir]   ? options[:src_dir]   : 'XML'
  season = '1314'

  unless localtest == true or use_ds == true
    puts "Setting up client"
    xmlsoccer_client = XMLsoccerHTTP::RequestManager.new({
      api_key: JSON.parse(File.open('xmlsoccer_config.json').read)['api_key'],
      api_type: "Full"
    })
  end

  xml_doc = Nokogiri::XML(open("#{src_dir}/AllLeagues.xml"))
  league_ids = xml_doc.xpath("//League/Id").map { |node| node.text }

  comp_hash = Hash.new
  nodb_file_recs = Array.new

  league_ids.each do |league_id|

    next if ["15", "34"].include? league_id
    league_id_str = league_id.to_i < 10 ? "0#{league_id}" : league_id

    if use_ds == true
      puts "Fetching 'Teams by League' info from production data store ..."
      teams_xml = Nokogiri::XML(aws_data_fetch({
        name: "Teams-league-#{league_id_str}-#{season}.xml",
        path: 'soccer/raw-data',
      }))
    elsif localtest == true
      filename = "#{src_dir}/Teams-league-#{league_id_str}-#{season}.xml"
      puts "Reading local data for league #{league_id_str} from #{filename} ..."
      teams_xml = Nokogiri::XML(File.open(filename))
    else
      puts "Requesting data for league #{league_id} ..."
      STDOUT.flush
      teams_xml = Nokogiri::XML(xmlsoccer_client.get_all_teams_by_league_and_season(league_id, season).body)
    end
    teams_xml.xpath("//XMLSOCCER.COM").first.add_namespace_definition(nil, "http://xmlsoccer.com/Team")
    namespace = 'xmlns:'

    team_recs = Array.new
    data_file_recs = Array.new
    update_recs = Array.new
    
    teams_xml.xpath("//#{namespace}Team").each do |node|

      # Handle known bad data for Ukranian League stadium (league_id: 40)
      if league_id == "40" and node.xpath("#{namespace}Stadium").text == '"Avanhard" Stadium'
        node.xpath("#{namespace}Stadium").first.content = 'Avanhard Stadium'
      end

      # Handle shittle situation
      if league_id == "20" and node.xpath("#{namespace}Team_Id").text == "579"
        node.xpath("#{namespace}Name").first.content = "Shittle Flounders FC"
      end

      # Add league information, separating competitions from domestic leagues
      # Collect records for writing rake update files
      is_competition = ["15", "16", "17", "34", "35"].include?(league_id) ? true : false
      if is_competition == true
        node.add_child("<Competition>#{@xmlsoccer_league_map[league_id]}</Competition>")
        node.add_child("<Competition_Id>#{league_id}</Competition_Id>")
        team_id = node.xpath("#{namespace}Team_Id").text
        competition_id = node.xpath("#{namespace}Competition_Id").text
        if comp_hash[team_id].nil?
          comp_hash[team_id] = Array.new()
          comp_hash[team_id] << competition_id
        else
          comp_hash[team_id] << competition_id
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
      team_id_str = node.xpath("#{namespace}Team_Id").text
      team_id_str = team_id_str.to_i < 100 ? "0#{team_id_str}" : team_id_str
      team_id_str = team_id_str.to_i < 10  ? "0#{team_id_str}" : team_id_str
      filename = write_xml_file({
        group: 'team',
        group_info: team_id_str,
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
        name:           node.xpath("#{namespace}Name").text,
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

    # Save json file for easy upload of xml files to data store...
    write_data_file_json_file({
      rec_type: "team",
      rec_data: 'xml',
      rec_info: league_id_str,
      recs: data_file_recs
    })
    
    # Save as team records json file, for ... noDB
    filename = write_records_json_file({
      rec_type: "teams",
      rec_info: "#{league_id_str}-create-t1",
      recs: team_recs
    })
    nodb_file_recs << { name: filename, path: 'soccer/nodb', timestamp: `date`.strip, }

    # Or...just create the rake file now - DUH!
    write_update_records_rake_file({
      rec_class: 'Team',
      rec_type: 'team',
      rec_key: 'team_id',
      desc: 'Update database with team data',
      recs: update_recs,
      jmc: 't1',
      ext: league_id_str,
    })

    # Save as json file, for ... noDB
    filename = write_records_json_file({
      rec_type: "teams",
      rec_info: "#{league_id_str}-update-t1",
      recs: update_recs
    })
    nodb_file_recs << { name: filename, path: 'soccer/nodb', timestamp: `date`.strip, }

  end # league_ids.each

  competitions_recs = Array.new
  comp_hash.each do |k,v|
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

  # Save as json file, for ... noDB
  filename = write_records_json_file({
    rec_type: "teams",
    rec_info: "all-update-t2",
    recs: competitions_recs
  })
  nodb_file_recs << { name: filename, path: 'soccer/nodb', timestamp: `date`.strip, }

  # Save json file for easy upload to noDB data store...
  write_data_file_json_file({
    rec_type: "team",
    rec_info: 'league',
    rec_data: 'nodb',
    recs: nodb_file_recs
  })

end


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

    # Save updated XML file for this team (node)
    team_id_str = node.xpath("Team_Id").text
    team_id_str = team_id_str.to_i < 100 ? "0#{team_id_str}" : team_id_str
    team_id_str = team_id_str.to_i < 10  ? "0#{team_id_str}" : team_id_str
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

    data_file_recs << { name:      filename,
                        path:      'soccer/teams',
                        timestamp: `date`.strip
                      } 
  end

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
transform_all_teams_by_league(localtest: true, use_ds: true, src_dir: 'XML-RAW')


