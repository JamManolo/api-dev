#
# simple 'include' file for transform tools
#

def create_group_map(options={})

	league_id = options[:league_id]
	fixtures_xml = options[:xml]

	group_hash = Hash.new

	fixtures_xml.xpath("//Match").each do |node|
		if [16, 17].include? league_id
      home_team_id = node.xpath("HomeTeam_Id").text
      away_team_id = node.xpath("AwayTeam_Id").text
      if group_hash[home_team_id].nil?
        group_hash[home_team_id] = Array.new
        group_hash[home_team_id] << home_team_id
        group_hash[home_team_id] << away_team_id
      elsif !group_hash[home_team_id].include? away_team_id
        group_hash[home_team_id] << away_team_id
      end
    end
	end

  groups = Array.new
  team_has_group = Hash.new
  group_hash.each do |k,v|
    if team_has_group[k].nil?
      groups << v
      v.each do |t|
        team_has_group[t] = true
      end
    end
  end

  # Group name order hard-coded for 2013 (due to xmlsoccer fixture order)
  if league_id == 16
    group_names = [ 'A', 'D', 'B', 'C', 'H', 'F', 'E', 'G', ]
  elsif league_id == 17
    group_names = [ 'A', 'E', 'F', 'B', 'C', 'D', 'J', 'H', 'I', 'K', 'G', 'L' ]
  end
                                
  unsorted_groups = Hash.new
  groups.each do |group|
    group_name = group_names.shift
    unsorted_groups[group_name] = Array.new
    group.each do |team_id|
      unsorted_groups[group_name] << team_id
      group_hash[team_id.to_s] = group_name
    end
  end

  # @groups = Hash.new
  # unsorted_groups.keys.sort.each do |key|
  #   @groups[key] = unsorted_groups[key]
  # end

  group_hash

end

