#!/Users/jimcar/.rvm/rubies/ruby-2.0.0-p247/bin/ruby -w
#coding:utf-8

require 'net/https'
require "rubygems"
require "json"
require "uri"
# require "Nokogiri"
require "./mygem/xmlsoccerhttp/lib/xmlsoccerhttp"
require "./transform-utils"
require "./xmlsoccer-league-map"

# -------------------------------------------------------------------------------------------------
#  Name: transform_teams_by_league
#  Desc: 
# -------------------------------------------------------------------------------------------------
def transform_teams_by_league(options={})

  league_id_str = league_id = options[:league_id]
  season = options[:season] ? options[:season] : '1314'

  member_team_ids  = Array.new
  team_recs        = Array.new
  data_file_recs   = Array.new
  comp_update_recs = Array.new
  update_recs      = Array.new
  update_rec       = {}

  puts "Fetching 'Teams by League' info for league #{league_id_str} from production data store ..."
  teams_xml = Nokogiri::XML(aws_data_fetch({
    name: "Teams-league-#{league_id_str}-#{season}.xml",
    path: 'soccer/raw-data',
  }))
  teams_xml.xpath("//XMLSOCCER.COM").first.add_namespace_definition(nil, "http://xmlsoccer.com/Team")
  namespace = 'xmlns:'
    
  teams_xml.xpath("//#{namespace}Team").each do |node|

    # Handle known bad data for Ukranian League stadium (league_id: 40)
    if league_id == "40" and node.xpath("#{namespace}Stadium").text == '"Avanhard" Stadium'
      node.xpath("#{namespace}Stadium").first.content = 'Avanhard Stadium'
    end

    # Handle shittle situation
    if league_id == "20" and node.xpath("#{namespace}Team_Id").text == "579"
      node.xpath("#{namespace}Name").first.content = "Shittle Flounders FC"
    end

    # 'standardize' the team_id string
    team_id_str = standardize_id_str(node.xpath("#{namespace}Team_Id").text, :team)

    # Add team_id to league members (teams)
    member_team_ids << team_id_str


    # Add league information, separating competitions from domestic leagues
    # Collect records for writing rake update files
    league_type = (@competition_league_list.include? league_id)? 'competition' : 'domestic'

    if league_type == 'competition'
      node.add_child("<League>Unknown</League>")
      node.add_child("<League_Id>0</League_Id>")
      node.add_child("<Competition>#{@xmlsoccer_league_map[league_id]}</Competition>")
      node.add_child("<Competition_Id>#{league_id}</Competition_Id>")
      team_id = node.xpath("#{namespace}Team_Id").text
      competition_id = node.xpath("#{namespace}Competition_Id").text
      if @comp_hash[team_id].nil?
        @comp_hash[team_id] = Array.new()
        @comp_hash[team_id] << competition_id
      else
        @comp_hash[team_id] << competition_id
      end
      @all_comp_team_ids << team_id_str
      update_rec = { team_id: team_id_str, competition: @xmlsoccer_league_map[league_id], competition_id: league_id }
    else
      # domestic league
      node.add_child("<League>#{@xmlsoccer_league_map[league_id]}</League>")
      node.add_child("<League_Id>#{league_id}</League_Id>")
      update_recs << {
        team_id:   node.xpath("#{namespace}Team_Id").text,
        league:    node.xpath("#{namespace}League").text,
        league_id: node.xpath("#{namespace}League_Id").text,
      }
      update_rec = { team_id: team_id_str, league: @xmlsoccer_league_map[league_id], league_id: league_id }
    end

    # Collect for writing json record file
    team_recs << {
      name:           node.xpath("#{namespace}Name").text,
      team_id:        team_id_str,
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

    # Save this record as json file, for noDB
    if true or league_type == 'domestic'
      filename = write_nodb_record_json_file({
        rec_type: 'teams',
        rec_info: "#{team_id_str}-create-t2",
        rec: team_recs.last,
      })
      @nodb_file_recs << { name: filename, path: 'soccer/nodb', timestamp: `date`.strip, }
    end

    # Save this record as json file, for noDB
    filename = write_nodb_record_json_file({
      rec_type: 'teams',
      rec_info: "#{team_id_str}-update-t2-#{league_type}-#{league_id_str}",
      rec:      update_rec,
    })
    @nodb_file_recs << { name: filename, path: 'soccer/nodb', timestamp: `date`.strip, }

    # Save updated XML file for this team (node)
    filename = write_xml_file(group: 'team', group_info: team_id_str, node: node)

    # Collect for writing json upload file
    data_file_recs << {
      name:      filename,
      path:      'soccer/teams',
      timestamp: `date`.strip
    } 

  end # team_nodes.each

  # Save json file for easy upload of xml files to data store...
  write_upload_list_json_file({
    rec_type: "team",
    rec_data: 'xml',
    rec_info: league_id_str,
    recs: data_file_recs
  })
  
  # Save as team records json file, for ... noDB
  filename = write_record_array_json_file({
    rec_type: "teams",
    rec_info: "#{league_id_str}-create-t2",
    recs: team_recs
  })
  @nodb_file_recs << { name: filename, path: 'soccer/nodb', timestamp: `date`.strip, }

  # Or...just create the rake file now - DUH!
  write_update_records_rake_file({
    rec_class: 'Team',
    rec_type: 'team',
    rec_key: 'team_id',
    desc: 'Update database with team data',
    recs: update_recs,
    jmc: 't2',
    ext: league_id_str,
  })

  # Save as json file, for ... noDB
  filename = write_record_array_json_file({
    rec_type: "teams",
    rec_info: "#{league_id_str}-update-t2",
    recs: update_recs
  })
  @nodb_file_recs << { name: filename, path: 'soccer/nodb', timestamp: `date`.strip, }

  # Save json file for creating league/teams relationship
  filename = write_nodb_relation_json_file({
    rel_A:     'leagues',
    rel_B:     'teams',
    rel_info:  'member-team-ids',
    rel_key_A:  league_id_str,
    rel_keys_B: member_team_ids.sort,
    jmc:        't2',
  })
  @nodb_file_recs << { name: filename, path: 'soccer/nodb', timestamp: `date`.strip, }

  @all_member_team_ids += member_team_ids

end

# -------------------------------------------------------------------------------------------------
#  Name: jmc_write_all_leagues_summary_type_files_YO
#  Desc: write various all-league/all-team files
# -------------------------------------------------------------------------------------------------
def jmc_write_all_leagues_summary_type_files_YO

  # Save json file for handy all-leagues list
  # (use :rel_type to specify this is actually a list)
  filename = write_nodb_relation_json_file({
    rel_A:     'teams',
    rel_B:     'leagues',
    rel_info:  'all-team-ids',
    rel_key_A:  'all',
    rel_keys_B: @all_member_team_ids.sort.uniq,
    rel_type:   'list',
    jmc:        't2',
  })
  # nodb_file_recs << { name: filename, path: 'soccer/nodb', timestamp: `date`.strip, }

  # Save json file for handy all-competitions list
  # (use :rel_type to specify this is actually a list)
  filename = write_nodb_relation_json_file({
    rel_A:     'teams',
    rel_B:     'competitions',
    rel_info:  'all-team-ids',
    rel_key_A:  'all',
    rel_keys_B: @all_comp_team_ids.sort.uniq,
    rel_type:   'list',
    jmc:        't2',
  })
  # @nodb_file_recs << { name: filename, path: 'soccer/nodb', timestamp: `date`.strip, }

  competitions_recs = Array.new
  @comp_hash.each do |k,v|
    competitions_recs << { team_id: k, competitions: v }
  end

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
  filename = write_record_array_json_file({
    rec_type: "teams",
    rec_info: "all-update-t2",
    recs: competitions_recs
  })
  @nodb_file_recs << { name: filename, path: 'soccer/nodb', timestamp: `date`.strip, }

  # Save json file for easy upload to noDB data store...
  write_upload_list_json_file({
    rec_type: "team",
    rec_info: 'league',
    rec_data: 'nodb',
    recs: @nodb_file_recs
  })
end

# -------------------------------------------------------------------------------------------------
#  Name: transform_driver
#  Desc: 
# -------------------------------------------------------------------------------------------------
def transform_driver

  @comp_hash           = Hash.new
  @nodb_file_recs      = Array.new
  @all_member_team_ids = Array.new
  @all_comp_team_ids   = Array.new

  # Process competition leagues *before* domestic leagues
  league_ids =  get_competition_league_ids + get_domestic_league_ids

  league_ids.each do |league_id|
    transform_teams_by_league(league_id: league_id)
  end

  # Write various all-league/all-team files
  jmc_write_all_leagues_summary_type_files_YO

end

transform_driver




